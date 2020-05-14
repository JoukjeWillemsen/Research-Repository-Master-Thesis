######################################################################
######################## situatie VOORBEELD ##########################
######################################################################
library(ggplot2)

lambda = x
lambda_cA = 0
lambda_h = 0
lambda_eA = 0
x = seq(-5,5,0.01)

dataVOORBEELD <- rbind(
  data.frame(
    group="current",
    x=x,
    y=dnorm(x, lambda_cA, 1),
    lambda = lambda_cA),
  data.frame(
    group="exp",
    x=x,
    y=-dnorm(x, lambda_eA, 1),
    lambda = lambda_eA))

VOORBEELD=ggplot(data = dataVOORBEELD, aes(x=x,y=y, group=group)) +
  scale_color_manual(values = c("#00ba38","#619cff")) +
  
  geom_segment(aes(x = lambda_cA, y = 0, xend = lambda_cA, yend = dnorm(lambda_cA, mean = lambda_cA, sd=1)), color="#00ba38")+ #hist
  
  annotate("text", x = 0, y = dnorm(lambda_cA)+0.025, label = expression(lambda*"c"), color="#00ba38") +
  
  geom_segment(aes(x = lambda_eA, y = 0, xend = lambda_eA, yend = -dnorm(lambda_eA, mean = lambda_eA, sd=1)), color="#619cff")+ #exp
  
  annotate("text", x = 0, y = - dnorm(lambda_eA) - 0.025, label = expression(lambda*"e"), color="#619cff") +
  
  geom_area(
    aes(fill=group),
    alpha=0.2,
    position="dodge") +
  
  scale_fill_manual(values = c("#00ba38","#619cff")) +
  
  geom_line(aes(color=group))+
  
  scale_x_continuous("", breaks=c()) + 
  scale_y_continuous("", breaks=c()) +
  theme_bw()
# labs(title = "Situation A")

VOORBEELD





########################################################################
###################       Situatie A      #############################
########################################################################

#https://www-users.cs.umn.edu/~halfaker/etc/I_heart_Beta/

library(ggplot2)

lambda = x
lambda_cA = 0
lambda_h = 0
lambda_eA = 0
x = seq(-5,5,0.01)

dataA <- rbind(
  data.frame(
    group="hist",
    x=x,
    y=dnorm(x, lambda_h, 1),
    lambda = lambda_h),
  data.frame(
    group="current",
    x=x,
    y=dnorm(x, lambda_cA, 1),
    lambda = lambda_cA),
  data.frame(
    group="exp",
    x=x,
    y=-dnorm(x, lambda_eA, 1),
    lambda = lambda_eA))

A=ggplot(data = dataA, aes(x=x,y=y, group=group)) +
  
  geom_segment(aes(x = lambda_h, y = 0, xend = 0, yend = dnorm(lambda_h)), color="#f8766d") + #hist
  
  annotate("text", x = 0, y = dnorm(lambda_h)+0.030, label = expression(lambda*"h"), color="#f8766d") +
  
  geom_segment(aes(x = lambda_cA, y = 0, xend = lambda_cA, yend = dnorm(lambda_cA, mean = lambda_cA, sd=1)), color="#00ba38")+ #hist
  
  annotate("text", x = 0, y = dnorm(lambda_cA)+0.012, label = expression(lambda*"c"), color="#00ba38") +
  
  geom_segment(aes(x = lambda_eA, y = 0, xend = lambda_eA, yend = -dnorm(lambda_eA, mean = lambda_eA, sd=1)), color="#619cff")+ #exp
  
  annotate("text", x = 0, y = - dnorm(lambda_eA) - 0.012, label = expression(lambda*"e"), color="#619cff") +
  
  geom_area(
    aes(fill=group),
    alpha=0.2,
    position="dodge") +
  
  geom_line(aes(color=group))+
  
  scale_x_continuous("", breaks=c()) + 
  scale_y_continuous("", breaks=c()) +
  theme_bw()
 # labs(title = "Situation A")

A

########################################################################
###################       Situatie B      #############################
########################################################################

#https://www-users.cs.umn.edu/~halfaker/etc/I_heart_Beta/

library(ggplot2)

lambda = x
lambda_cB = 2
lambda_h = 0
lambda_eB = 2
x=seq(-5,5,0.01)

dataB <- rbind(
  data.frame(
    group="hist",
    x = x,
    y=dnorm(x, lambda_h, 1),
    lambda = lambda_h),
  data.frame(
    group="current",
    x= x,
    y=dnorm(x, lambda_cB, 1),
    lambda = lambda_cB),
  data.frame(
    group="exp",
    x= x,
    y=-dnorm(x, lambda_eB, 1),
    lambda = lambda_eB))

B=ggplot(dataB, aes(x=x,y=y, group=group)) +
  
  #expand_limits(x=c(-5,5)) +
  #scale_x_continuous(limits=c(-5,5)) +
  #expand_limits(x = c(-10, 10)) +
  #coord_cartesian(xlim =c(-5, 5)) +
  
  geom_segment(aes(x = lambda_h, y = 0, xend = 0, yend = dnorm(lambda_h)), color="#f8766d") + #hist
  
  annotate("text", x = lambda_h, y = dnorm(lambda_h, mean = lambda_h, sd = 1)+0.012, label = expression(lambda*"h"), color="#f8766d") +
  
  geom_segment(aes(x = lambda_cB, y = 0, xend = lambda_cB, yend = dnorm(lambda_cB, mean = lambda_cB, sd=1)), color="#00ba38")+ #hist
  
  annotate("text", x = lambda_cB, y = dnorm(lambda_cB, mean = lambda_cB, sd = 1)+0.012, label = expression(lambda*"c"), color="#00ba38") +
  
  geom_segment(aes(x = lambda_eB, y = 0, xend = lambda_eB, yend = -dnorm(lambda_eB, mean = lambda_eB, sd=1)), color="#619cff")+ #exp
  
  annotate("text", x = lambda_eB, y = - dnorm(lambda_eB, mean = lambda_eB, sd = 1) - 0.012, label = expression(lambda*"e"), color="#619cff") +
  
  geom_area(
    aes(fill=group),
    alpha=0.2,
    position="dodge") +
  
  geom_line(aes(color=group))+
  
  scale_x_continuous("", breaks=c()) + 
  scale_y_continuous("", breaks=c()) +
#  labs(title = "Situation B") +
  
  theme_bw()

B

########################################################################
###################       Situatie C     #############################
########################################################################

#https://www-users.cs.umn.edu/~halfaker/etc/I_heart_Beta/

library(ggplot2)

#lambda = x
lambda_cC = 0
lambda_h = 0
lambda_eC = 0

lambda_cClist <- 
  rbind(
    data.frame(name = lambda_cC1,
               mean = -2),
    data.frame(name = lambda_cC2,
               mean = -1),
    data.frame(name = lambda_cC3,
               mean = 0),
    data.frame(name = lambda_cC4,
               mean = 1),
    data.frame(name = lambda_cC5,
               mean = 2))

lambda_eClist <- 
  rbind(
    data.frame(name = lambda_eC1,
               mean = -2),
    data.frame(name = lambda_eC2,
               mean = -1),
    data.frame(name = lambda_eC3,
               mean = 0),
    data.frame(name = lambda_eC4,
               mean = 1),
    data.frame(name = lambda_eC5,
               mean = 2))

lambda_cC1 = -2
lambda_cC2 = -1
lambda_cC3 = 0
lambda_cC4 = 1
lambda_cC5 = 2

lambda_eC1 = -2
lambda_eC2 = -1
lambda_eC3 = 0
lambda_eC4 = 1
lambda_eC5 = 2

dataC <- rbind(
  data.frame(
    niveau="pophist",
    group="hist",
    x=seq(-5,5,0.01),
    y=4.6*dnorm(x, lambda_h, 1.7),
    lambda = lambda_h),
  data.frame(
    niveau="popcont",
    group="current",
    x=seq(-5,5,0.01),
    y=4.6*dnorm(x, lambda_cC, 1.7),
    lambda = lambda_cC),
  data.frame(
    niveau="popexp",
    group="exp",
    x=seq(-5,5,0.01),
    y=-4.6*dnorm(x, lambda_eC, 1.7),
    lambda = lambda_eC),
  data.frame(
    niveau="exp",
    group="lambda_eC1",
    x=seq(-5,5,0.01),
    y=-dnorm(x, lambda_eC1, 1),
    lambda = lambda_eC1),
  data.frame(
    niveau="exp",
    group="lambda_eC2",
    x=seq(-5,5,0.01),
    y=-dnorm(x, lambda_eC2, 1),
    lambda = lambda_eC2),
  data.frame(
    niveau="exp",
    group="lambda_eC3",
    x=seq(-5,5,0.01),
    y=-dnorm(x, lambda_eC3, 1),
    lambda = lambda_eC3),
  data.frame(
    niveau="exp",
    group="lambda_eC4",
    x=seq(-5,5,0.01),
    y=-dnorm(x, lambda_eC4, 1),
    lambda = lambda_eC4),
  data.frame(
    niveau="exp",
    group="lambda_eC5",
    x=seq(-5,5,0.01),
    y=-dnorm(x, lambda_eC5, 1),
    lambda = lambda_eC5),
  data.frame(
    niveau="current",
    group="lambda_cC1",
    x=seq(-5,5,0.01),
    y=dnorm(x, lambda_cC1, 1),
    lambda = lambda_cC1),
  data.frame(
    niveau="current",
    group="lambda_cC2",
    x=seq(-5,5,0.01),
    y=dnorm(x, lambda_cC2, 1),
    lambda = lambda_cC2),
  data.frame(
    niveau="current",
    group="lambda_cC3",
    x=seq(-5,5,0.01),
    y=dnorm(x, lambda_cC3, 1),
    lambda = lambda_cC3),
  data.frame(
    niveau="current",
    group="lambda_cC4",
    x=seq(-5,5,0.01),
    y=dnorm(x, lambda_cC4, 1),
    lambda = lambda_cC4),
  data.frame(
    niveau="current",
    group="lambda_cC5",
    x=seq(-5,5,0.01),
    y=dnorm(x, lambda_cC5, 1),
    lambda = lambda_cC5))

C=ggplot(data=dataC, aes(x=x,y=y, group=group)) +
  
  scale_color_manual(values = c("#f8766d", "#00ba38", "#619cff", "#619cff", "#00ba38")) + #rood 619cff blauw 619cff blauw
  
  ## add lines & fillings
  
  geom_segment(aes(x = lambda_h, y = 0, xend = 0, yend = 4.6*dnorm(lambda_h, mean=lambda_h, sd=1.7)), color="#f8766d") + #hist
  
  annotate("text", x = lambda_h, y = 0.07+4.6*dnorm(lambda_h, mean = lambda_h, sd = 1.7), label = expression(lambda*"h"), color="#f8766d") +
  
  geom_segment(aes(x = lambda_cC, y = 0, xend = lambda_cC, yend = -4.6*dnorm(lambda_cC, mean = lambda_cC, sd=1.7)), color="#619cff")+ #hist
  
  annotate("text", x = lambda_eC, y = -0.05 + -4.6*dnorm(lambda_eC, mean = lambda_eC, sd = 1.7), label = expression(lambda*"e"), color="#619cff") +
  
  geom_segment(aes(x = lambda_eC, y = 0, xend = lambda_eC, yend = 4.6*dnorm(lambda_eC, mean = lambda_eC, sd=1.7)), color="#00ba38") + 
  
  annotate("text", x = lambda_cC, y = 0.025+4.6*dnorm(lambda_cC, mean = lambda_cC, sd = 1.7), label = expression(lambda*"c"), color="#00ba38") +
  
  
  ### de kleine c's ###
  
  #1
  geom_segment(aes(x = lambda_eClist$mean[1], y = 0, xend = lambda_eClist$mean[1], yend = -dnorm(lambda_eClist$mean[1], mean = lambda_eClist$mean[1], sd=1)), color="#619cff")+ #exp
  annotate("text", x = lambda_eClist$mean[1], y = -0.025 - dnorm(lambda_eClist$mean[1], mean = lambda_eClist$mean[1], sd = 1), label = expression(lambda*"e_1"), color="#619cff") +
  
  #2
  geom_segment(aes(x = lambda_eClist$mean[2], y = 0, xend = lambda_eClist$mean[2], yend = -dnorm(lambda_eClist$mean[2], mean = lambda_eClist$mean[2], sd=1)), color="#619cff")+ #exp
  annotate("text", x = lambda_eClist$mean[2], y = -0.025 - dnorm(lambda_eClist$mean[2], mean = lambda_eClist$mean[2], sd = 1), label = expression(lambda*"e_2"), color="#619cff") +
  
  #3
  geom_segment(aes(x = lambda_eClist$mean[3], y = 0, xend = lambda_eClist$mean[3], yend = -dnorm(lambda_eClist$mean[3], mean = lambda_eClist$mean[3], sd=1)), color="#619cff")+ #exp
  annotate("text", x = lambda_eClist$mean[3], y = -0.025 - dnorm(lambda_eClist$mean[3], mean = lambda_eClist$mean[3], sd = 1), label = expression(lambda*"e_3"), color="#619cff") +
  
  #4
  geom_segment(aes(x = lambda_eClist$mean[4], y = 0, xend = lambda_eClist$mean[4], yend = -dnorm(lambda_eClist$mean[4], mean = lambda_eClist$mean[4], sd=1)), color="#619cff")+ #exp
  annotate("text", x = lambda_eClist$mean[4], y = -0.025 - dnorm(lambda_eClist$mean[4], mean = lambda_eClist$mean[4], sd = 1), label = expression(lambda*"e_4"), color="#619cff") +
  
  #5
  geom_segment(aes(x = lambda_eClist$mean[5], y = 0, xend = lambda_eClist$mean[5], yend = -dnorm(lambda_eClist$mean[5], mean = lambda_eClist$mean[5], sd=1)), color="#619cff")+ #exp
  annotate("text", x = lambda_eClist$mean[5], y = -0.025 - dnorm(lambda_eClist$mean[5], mean = lambda_eClist$mean[5], sd = 1), label = expression(lambda*"e_5"), color="#619cff") +
  
  ### de kleine e's ###
  
  #1
  geom_segment(aes(x = lambda_cClist$mean[1], y = 0, xend = lambda_cClist$mean[1], yend = dnorm(lambda_cClist$mean[1], mean = lambda_cClist$mean[1], sd=1)), color="#00ba38")+ #exp
  annotate("text", x = lambda_cClist$mean[1], y = +0.025 + dnorm(lambda_cClist$mean[1], mean = lambda_cClist$mean[1], sd = 1), label = expression(lambda*"c_1"), color="#00ba38") +
  
  #2
  geom_segment(aes(x = lambda_cClist$mean[2], y = 0, xend = lambda_cClist$mean[2], yend = dnorm(lambda_cClist$mean[2], mean = lambda_cClist$mean[2], sd=1)), color="#00ba38")+ #exp
  annotate("text", x = lambda_cClist$mean[2], y = +0.025 + dnorm(lambda_cClist$mean[2], mean = lambda_cClist$mean[2], sd = 1), label = expression(lambda*"c_2"), color="#00ba38") +
  
  #3
  geom_segment(aes(x = lambda_cClist$mean[3], y = 0, xend = lambda_cClist$mean[3], yend = dnorm(lambda_cClist$mean[3], mean = lambda_cClist$mean[3], sd=1)), color="#00ba38")+ #exp
  annotate("text", x = lambda_cClist$mean[3], y = +0.025 + dnorm(lambda_cClist$mean[3], mean = lambda_cClist$mean[3], sd = 1), label = expression(lambda*"c_3"), color="#00ba38") +
  
  #4
  geom_segment(aes(x = lambda_cClist$mean[4], y = 0, xend = lambda_cClist$mean[4], yend = dnorm(lambda_cClist$mean[4], mean = lambda_cClist$mean[4], sd=1)), color="#00ba38")+ #exp
  annotate("text", x = lambda_cClist$mean[4], y = +0.025 + dnorm(lambda_cClist$mean[4], mean = lambda_cClist$mean[4], sd = 1), label = expression(lambda*"c_4"), color="#00ba38") +
  
  #5
  geom_segment(aes(x = lambda_cClist$mean[5], y = 0, xend = lambda_cClist$mean[5], yend = dnorm(lambda_cClist$mean[5], mean = lambda_cClist$mean[5], sd=1)), color="#00ba38")+ #exp
  annotate("text", x = lambda_cClist$mean[5], y = +0.025 + dnorm(lambda_cClist$mean[5], mean = lambda_cClist$mean[5], sd = 1), label = expression(lambda*"c_5"), color="#00ba38") +
  
  scale_fill_manual(values = c("#f8766d", "#FFFFFF", "#FFFFFF", "#619cff", "#00ba38")) +
  
  scale_linetype_manual(values = c("solid", "dotted", "dotted", "solid", "solid")) +
  
  geom_area(aes(fill=niveau), alpha=0.3, position="dodge") +
  
  geom_line(aes(color=niveau, linetype=niveau))+
  
  scale_x_continuous("", breaks=c()) + 
  scale_y_continuous("", breaks=c()) +
  
 # labs(title = "Situation C") +
  
  theme_bw()


C

  ########################################################################
  ###################       Situatie D     #############################
  ########################################################################
  
  #https://www-users.cs.umn.edu/~halfaker/etc/I_heart_Beta/
  
  library(ggplot2)
  
  #lambda = x
  lambda_c = 2
  lambda_h = 0
  lambda_e = 2
  
  lambda_clist <- 
    rbind(
      data.frame(name = lambda_c1,
                 mean = lambda_c-2),
      data.frame(name = lambda_c2,
                 mean = lambda_c-1),
      data.frame(name = lambda_c3,
                 mean = lambda_c),
      data.frame(name = lambda_c4,
                 mean = lambda_c+1),
      data.frame(name = lambda_c5,
                 mean = lambda_c+2))
  
  lambda_elist <- 
    rbind(
      data.frame(name = lambda_e1,
                 mean = lambda_e-2),
      data.frame(name = lambda_e2,
                 mean = lambda_e-1),
      data.frame(name = lambda_e3,
                 mean = lambda_e),
      data.frame(name = lambda_e4,
                 mean = lambda_e+1),
      data.frame(name = lambda_e5,
                 mean = lambda_e+2))
  
  lambda_c1 = 0
  lambda_c2 = 1
  lambda_c3 = 2
  lambda_c4 = 3
  lambda_c5 = 4
  
  lambda_e1 = 0
  lambda_e2 = 1
  lambda_e3 = 2
  lambda_e4 = 3
  lambda_e5 = 4
  
  x <- seq(-5,7,0.1)
  
  dataD <- rbind(
    data.frame(
      niveau="pophist",
      group="hist",
      x=x,
      y=4.6*dnorm(x, lambda_h, 1.7),
      lambda = lambda_h),
    data.frame(
      niveau="popcont",
      group="current",
      x=x,
      y=4.6*dnorm(x, lambda_c, 1.7),
      lambda = lambda_c),
    data.frame(
      niveau="popexp",
      group="exp",
      x=x,
      y=-4.6*dnorm(x, lambda_e, 1.7),
      lambda = lambda_e),
    data.frame(
      niveau="exp",
      group="lambda_e1",
      x=x,
      y=-dnorm(x, lambda_e1, 1),
      lambda = lambda_e1),
    data.frame(
      niveau="exp",
      group="lambda_e2",
      x=x,
      y=-dnorm(x, lambda_e2, 1),
      lambda = lambda_e2),
    data.frame(
      niveau="exp",
      group="lambda_e3",
      x=x,
      y=-dnorm(x, lambda_e3, 1),
      lambda = lambda_e3),
    data.frame(
      niveau="exp",
      group="lambda_e4",
      x=x,
      y=-dnorm(x, lambda_e4, 1),
      lambda = lambda_e4),
    data.frame(
      niveau="exp",
      group="lambda_e5",
      x=x,
      y=-dnorm(x, lambda_e5, 1),
      lambda = lambda_e5),
    data.frame(
      niveau="current",
      group="lambda_c1",
      x=x,
      y=dnorm(x, lambda_c1, 1),
      lambda = lambda_c1),
    data.frame(
      niveau="current",
      group="lambda_c2",
      x=x,
      y=dnorm(x, lambda_c2, 1),
      lambda = lambda_c2),
    data.frame(
      niveau="current",
      group="lambda_c3",
      x=x,
      y=dnorm(x, lambda_c3, 1),
      lambda = lambda_c3),
    data.frame(
      niveau="current",
      group="lambda_c4",
      x=x,
      y=dnorm(x, lambda_c4, 1),
      lambda = lambda_c4),
    data.frame(
      niveau="current",
      group="lambda_c5",
      x=x,
      y=dnorm(x, lambda_c5, 1),
      lambda = lambda_c5))
  
  D=ggplot(data=dataD, aes(x=x,y=y, group=group)) +
    
    scale_color_manual(values = c("#f8766d", "#00ba38", "#619cff", "#619cff", "#00ba38")) +

    ## add lines & fillings
    
    geom_segment(aes(x = lambda_h, y = 0, xend = 0, yend = 4.6*dnorm(lambda_h, mean=lambda_h, sd=1.7)), color="#f8766d") + #hist
    
    annotate("text", x = lambda_h, y = 0.025+4.6*dnorm(lambda_h, mean = lambda_h, sd = 1.7), label = expression(lambda*"h"), color="#f8766d") +
    
    geom_segment(aes(x = lambda_c, y = 0, xend = lambda_c, yend = -4.6*dnorm(lambda_c, mean = lambda_c, sd=1.7)), color="#619cff")+ #hist
    
    annotate("text", x = lambda_e, y = -0.025 + -4.6*dnorm(lambda_e, mean = lambda_e, sd = 1.7), label = expression(lambda*"e"), color="#619cff") +
    
    geom_segment(aes(x = lambda_e, y = 0, xend = lambda_e, yend = 4.6*dnorm(lambda_e, mean = lambda_e, sd=1.7)), color="#00ba38") + 
    
    annotate("text", x = lambda_c, y = 0.025+4.6*dnorm(lambda_c, mean = lambda_c, sd = 1.7), label = expression(lambda*"c"), color="#00ba38") +
    
    
    ### de kleine c's ###
    
    #1
    geom_segment(aes(x = lambda_elist$mean[1], y = 0, xend = lambda_elist$mean[1], yend = -dnorm(lambda_elist$mean[1], mean = lambda_elist$mean[1], sd=1)), color="#619cff")+ #exp
    annotate("text", x = lambda_elist$mean[1], y = -0.025 - dnorm(lambda_elist$mean[1], mean = lambda_elist$mean[1], sd = 1), label = expression(lambda*"e_1"), color="#619cff") +
    
    #2
    geom_segment(aes(x = lambda_elist$mean[2], y = 0, xend = lambda_elist$mean[2], yend = -dnorm(lambda_elist$mean[2], mean = lambda_elist$mean[2], sd=1)), color="#619cff")+ #exp
    annotate("text", x = lambda_elist$mean[2], y = -0.025 - dnorm(lambda_elist$mean[2], mean = lambda_elist$mean[2], sd = 1), label = expression(lambda*"e_2"), color="#619cff") +
    
    #3
    geom_segment(aes(x = lambda_elist$mean[3], y = 0, xend = lambda_elist$mean[3], yend = -dnorm(lambda_elist$mean[3], mean = lambda_elist$mean[3], sd=1)), color="#619cff")+ #exp
    annotate("text", x = lambda_elist$mean[3], y = -0.025 - dnorm(lambda_elist$mean[3], mean = lambda_elist$mean[3], sd = 1), label = expression(lambda*"e_3"), color="#619cff") +
    
    #4
    geom_segment(aes(x = lambda_elist$mean[4], y = 0, xend = lambda_elist$mean[4], yend = -dnorm(lambda_elist$mean[4], mean = lambda_elist$mean[4], sd=1)), color="#619cff")+ #exp
    annotate("text", x = lambda_elist$mean[4], y = -0.025 - dnorm(lambda_elist$mean[4], mean = lambda_elist$mean[4], sd = 1), label = expression(lambda*"e_4"), color="#619cff") +
    
    #5
    geom_segment(aes(x = lambda_elist$mean[5], y = 0, xend = lambda_elist$mean[5], yend = -dnorm(lambda_elist$mean[5], mean = lambda_elist$mean[5], sd=1)), color="#619cff")+ #exp
    annotate("text", x = lambda_elist$mean[5], y = -0.025 - dnorm(lambda_elist$mean[5], mean = lambda_elist$mean[5], sd = 1), label = expression(lambda*"e_5"), color="#619cff") +
    
    ### de kleine e's ###
    
    #1
    geom_segment(aes(x = lambda_clist$mean[1], y = 0, xend = lambda_clist$mean[1], yend = dnorm(lambda_clist$mean[1], mean = lambda_clist$mean[1], sd=1)), color="#00ba38")+ #exp
    annotate("text", x = lambda_clist$mean[1], y = +0.025 + dnorm(lambda_clist$mean[1], mean = lambda_clist$mean[1], sd = 1), label = expression(lambda*"c_1"), color="#00ba38") +
    
    #2
    geom_segment(aes(x = lambda_clist$mean[2], y = 0, xend = lambda_clist$mean[2], yend = dnorm(lambda_clist$mean[2], mean = lambda_clist$mean[2], sd=1)), color="#00ba38")+ #exp
    annotate("text", x = lambda_clist$mean[2], y = +0.025 + dnorm(lambda_clist$mean[2], mean = lambda_clist$mean[2], sd = 1), label = expression(lambda*"c_2"), color="#00ba38") +
    
    #3
    geom_segment(aes(x = lambda_clist$mean[3], y = 0, xend = lambda_clist$mean[3], yend = dnorm(lambda_clist$mean[3], mean = lambda_clist$mean[3], sd=1)), color="#00ba38")+ #exp
    annotate("text", x = lambda_clist$mean[3], y = +0.025 + dnorm(lambda_clist$mean[3], mean = lambda_clist$mean[3], sd = 1), label = expression(lambda*"c_3"), color="#00ba38") +
    
    #4
    geom_segment(aes(x = lambda_clist$mean[4], y = 0, xend = lambda_clist$mean[4], yend = dnorm(lambda_clist$mean[4], mean = lambda_clist$mean[4], sd=1)), color="#00ba38")+ #exp
    annotate("text", x = lambda_clist$mean[4], y = +0.025 + dnorm(lambda_clist$mean[4], mean = lambda_clist$mean[4], sd = 1), label = expression(lambda*"c_4"), color="#00ba38") +
    
    #5
    geom_segment(aes(x = lambda_clist$mean[5], y = 0, xend = lambda_clist$mean[5], yend = dnorm(lambda_clist$mean[5], mean = lambda_clist$mean[5], sd=1)), color="#00ba38")+ #exp
    annotate("text", x = lambda_clist$mean[5], y = +0.025 + dnorm(lambda_clist$mean[5], mean = lambda_clist$mean[5], sd = 1), label = expression(lambda*"c_5"), color="#00ba38") +
    
    scale_fill_manual(values = c("#f8766d", "#FFFFFF", "#FFFFFF", "#619cff", "#00ba38")) +
    
    scale_linetype_manual(values = c("solid", "dotted", "dotted", "solid", "solid")) +
    
    geom_area(aes(fill=niveau), alpha=0.3, position="dodge") +
    
    geom_line(aes(color=niveau, linetype=niveau))+
    
    #scale_x_discrete(breaks=c(-5:7), labels = rep("", length(c(-5:7)))) +
    scale_x_continuous("", breaks=c()) + 
    scale_y_continuous("", breaks=c()) +
    
 #   labs(title = "Situation D") +
    
    theme_bw()
    
    #theme(axis.title.x=element_blank(),
        #axis.text.x=element_blank(),
       # axis.ticks.x= element_blank())
  
  D


png("C:/Users/Joukje/Documents/MasterThesis/ResearchReport/Figuren/figA.png", width=2400, height=1800, res=300)
A
dev.off()

png("C:/Users/Joukje/Documents/MasterThesis/ResearchReport/Figuren/figB.png", width=2400, height=1800, res=300)
B
dev.off()

png("C:/Users/Joukje/Documents/MasterThesis/ResearchReport/Figuren/figC.png", width=2400, height=1800, res=300)
C
dev.off()

png("C:/Users/Joukje/Documents/MasterThesis/ResearchReport/Figuren/figD.png", width=2400, height=1800, res=300)
D
dev.off()

png("C:/Users/Joukje/Documents/MasterThesis/ResearchReport/Figuren/figVOORBEELD.png", width=2400, height=1800, res=300)
VOORBEELD
dev.off()

#print(g)
##dev.off()
#png("images/normal_approximation.png", width=1800, height=900, res=300)
#print(g)

#dev.off()