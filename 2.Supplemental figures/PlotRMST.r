---
title: "Plots"
author: "Joukje Willemsen"
date: "17 april 2020"
output: html_document
---

```{r setup, include=FALSE}
load("DATA2018.Rdata")

#Make subset with only controls
Dcontrol <- D[which(D$TRT=="N"),]
Dcontrol <- Dcontrol[complete.cases(Dcontrol[,11]),]
```


#Function to simulate Time Until Mortality
```{r}
TimeUntilMortality <- function(shapeparameter = parameters$shape,scaleparameter,treatmenteffect = HR, allocation,sdrandomeffectcluster, Tmax = 548, pcont = 0.5, N = SampleSize)
  
  {
#Make 3 groups:
# 0 controlgroup
# 1 exp group where HR = HR
# 2 exp group where HR = 1

Data <- as.data.frame(c(rep.int(0, pcont*N), rep.int(1, (1-pcont)*N),rep.int(2, (1-pcont)*N)))
colnames(Data)<-"allocation"
Data$effectgroup <- if_else(Data$allocation == 1, 1, 0) #indicate whether an effect should be simulated (only by allocation = 1)

#Generate random effect cluster
Data$randomeffectcluster <- rnorm(1, mean = 0, sd = sdrandomeffectcluster)

#Time until mortality
Data$TUM <- Data %>% 
               nrow() %>% 
               rweibull(shapeparameter,scaleparameter*exp(-(Data$effectgroup*treatmenteffect+
                 Data$randomeffectcluster)/shapeparameter))

#Censoring indicator
Data$censoring <- ifelse(Data$TUM>Tmax, yes = 1, no = 0)
Data$survivalcensored <- ifelse(Data$TUM>Tmax, yes = Tmax, no = Data$TUM)

#Status indicator
Data$StatusIndicator <- ifelse(Data$TUM>Tmax, yes=0, no = 1) 

return(Data)
}
```

#Input for the different scenarios
Set different parameters (see researchreport)
```{r}
shapeparameter = c(parameters$shape, (parameters$shape+0.1*parameters$shape), (parameters$shape+0.2*parameters$shape), (parameters$shape+0.3*parameters$shape), (parameters$shape+0.4*parameters$shape))
scaleparameter = c(parameters$scale, parameters$scale+100) #HR=c(1, 1.128719)
treatmenteffect = HR #the HR used in 0.DataPreperation to calculate the sample size
#sdrandomeffectcluster = c(0, 0.1, 0.2, 0.4)
sdrandomeffectcluster = 0
```

```{r}
library("ggplot2")
library("survival")
library("survminer")

set.seed(123)
controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[1], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[1], N=4000)
control11 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[1], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[2], N=4000)
control12 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[1], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[3], N=4000)
control13 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[1], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[4], N=4000)
control14 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[2], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[1], N=4000)
control21 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[2], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[2], N=4000)
control22 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[2], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[3], N=4000)
control23 <- controlAT[which(controlAT$allocation==0),]

controlAT <- TimeUntilMortality(scaleparameter = scaleparameter[2], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[4], N=4000)
control24 <- controlAT[which(controlAT$allocation==0),]


Historical <- survfit( Surv(STIME18, STATUS18) ~ 1, data = Dcontrol)
control11 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control11)
control12 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control12)
control13 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control13)
control14 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control14)
control21 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control21)
control22 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control22)
control23 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control23)
control24 <- survfit( Surv(survivalcensored, StatusIndicator) ~ 1, data = control24)


#Combine the two survival curves on one graph:
fit<-list(Historical = Historical, control11 = control11, ontrol14=control14, control21=control21, control24=control24)

plot <- ggsurvplot(fit, combine = TRUE, # Combine curves
           surv.median.line = "hv", # Add medians survival
           risk.table = FALSE,                  # Add risk table
           conf.int = FALSE,                    # Add confidence interval
           pval = FALSE,                        # Add p-value and tervals
           #conf.int.style = "step",            # CI style, use "step" or "ribbon"
           censor = FALSE,                     # Remove censor points
           tables.theme = theme_cleantable(),  # Clean risk table
           legend.title = "Data",              # Change legends: title & labels
           legend.labs = c("Historical","ControlA", "ControlB", "ControlC", "ControlD"),
           linetype = c(1,2,3,3,3),
           size = 2,
           palette = c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"),
           ylim = c(0.5, 1))
            
           #ggtheme = theme_bw() # Change ggplot2 theme

library(ggplot2)
ggsave("situaties.png", plot = print(plot), width = 15, height = 15, units = "cm")

```


```{r}
rmstplot <- function (control){
library(survRM2) 
 dataframe <- data.frame(
  "time" = c(control$survivalcensored, Dcontrol$STIME18), 
  "status"= c(control$StatusIndicator, Dcontrol$STATUS18),
  "arm" = c(rep(0, length(control$survivalcensored)), rep(1, length(Dcontrol$STATUS18))))

rmst <- rmst2(time = dataframe$time, status = dataframe$status, arm = dataframe$arm, tau = 548)
return(ggplot(rmst))
}


set.seed(123)
controlT <- TimeUntilMortality(scaleparameter = scaleparameter[1], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[1], N=4000)
control <- controlT[which(controlT$allocation==0),]
A <-HRplot(control)


set.seed(123)
controlT <- TimeUntilMortality(scaleparameter = scaleparameter[1], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[4], N=4000)
control <- controlT[which(controlT$allocation==0),]
B <-HRplot(control)

set.seed(123)
controlT <- TimeUntilMortality(scaleparameter = scaleparameter[2], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[1], N=4000)
control <- controlT[which(controlT$allocation==0),]
C <-HRplot(control)

set.seed(123)
controlT <- TimeUntilMortality(scaleparameter = scaleparameter[2], sdrandomeffectcluster = 0, shapeparameter = shapeparameter[4], N=4000)
control <- controlT[which(controlT$allocation==0),]
D=HRplot(control)


arrangedfigure <- ggpubr::ggarrange(A, B, C, D, 
                                    labels = c("A", "B", "C", "D"),
                                    ncol = 2, nrow = 2, common.legend = F)

library(ggplot2)
ggsave("C:Users/Joukje/Documents/GitHub/ResearchRepository/2.Plots/4situaties.png", plot = arrangedfigure, width = 15, height = 15)


```
