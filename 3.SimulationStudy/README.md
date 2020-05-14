Instructions for data replication 
===
This README contains a detailled description of the simulationprocedure to replicate the obtained results. 

Please note that this simulation study has (last) been executed from 28-04-20 until 30-04-20. The seed numbers of the random generator are stated in the R-code.

---
**Obtaining the PRO-ACT database & data preperation**
---
Please register, and download the PRO-ACT dataset [here](https://nctu.partners.org/ProACT/Data/Index/1). Only the variables concerning the allocation, survival and survivaltime are of interest. Cases that contain missingness in any of these variables are removed. Because most ALS-trials have a follow up of 18 months (548 days) or less, the variables Subject_Died and Death_Days are censored at 548 days.

Recode the variables such that:

* Study_Arm (Active/Placebo) -> D$TRT(Y/N)
* Subject_Died (Yes/No) -> D$STATUS18(1,0)
* Death_Days (number) -> D$STIME18(number, max 548)
---
**Run the rmd files saved in this folder in the right order**
---

To perform the entire analysis for the simulated scenarios A-F, the same simulationstudy is performed twice, but with different (varied) input parameters. 
P
* In simulationstudy A, the scenarios A,B,C1-3 and D1-3 are simulated.
* In simulationstudy B, the scenarios A,B,E1-3 and F1-3 are simulated.

Hence, there are two versions of every rmd file (except `0.DataPreperation`), either starting with "A." or "B.". 

For both the simulation studies, run the rmd files stored in this folder starting from `O.DataPreperation` to `A/B.DataVisualization` in the right order as presented below.  
 

| Files                      | Description   |
| -----------------          | ------------- |
|0.DataPreperation            |In this document the historical controldataset is prepared. The weibull shape and scale parameters are estimated from the historical controlgroup and the required sample size is calculated. The shape and scale parameter and sample size are used as input parameters in simulating the current control group.|
|1.DataSimulation             |Simulate survivaldata based on the parameters extracted from 0.DataPreperation|
|2.Poolingmethods:            |   |
|- 2.1.Always pool             |All the simulated datasets are pooled with the historical controls|
|- 2.2.Test-then-pool          |A HR difference test is perfomed to compare the current (simulated) current controls and the historical controls. The resulting p-values are stored|
|- 2.3.Equivalence-testing HR |The CI of the HR difference test is calculated|
|- 2.4.Equivalence-testing HR boot |The CI of the HR difference test is bootstrapped|
|- 2.5.Equivalence-testing rMean |The CI of the RMST difference test is calculated|
|- 2.5.Equivalence-testing rMean boot |The CI of the RMST difference test is bootstrapped|
|3.FinalAnalysis   | Execute the final analysis (Experimental vs Controlgroup) for all the pooled and not-pooled datasets for a range of difference decisionthresholds|
|4.DataAnalysis | Calculate and visualize the proportion of false positives and true positives for each poolingmethod

At the end of every rmd file the raw data output is stored in the folder with the corresponding number (for example the output of `0.DataPreperation` is stored in the folder `0.DataPreperation_output`). At the start of the next rmd file the required data is extracted from these folders. A description of the folders stored in this folder is presented below:

| Folder                     | Description   |
| -----------------          | ------------- |
|0.DataPreperation_output    |Raw data files, output from `0.DataPreperation`|
|1.DataSimulation_ouput      |Raw data files, output from the rmd files `A.1.DataSimulation` and `B.1.DataSimulation`|
|2.PoolingMethods_ouput      |Raw data files, output from the rmd files staring with `A.2` and `B.2`|
|3.FinalAnalysis_ouput       |Raw data files, output from the rmd files starting with `A.3` and `B.3`|
|4.DataVisualization_ouput   |Raw data files, output from the rmd files starting with `A.4` and `B.4`|
|Compiled HTMLs              |Compiled HTMLs of the rmd files as described above |
|functions                   |contains R files with functions that are used multiple times in the rmd files described above|
|vanEijk_functions           |contains R files with functions that are both not part of a package and not written by me, with a README file with a refference|

--
The resulting graphs and proportions can be find in the folder `4.DataVisualization_ouput`.

---
Operating system and package versions
---
The package versions of the R-packages applied in this simulationstudy are stated below. The operation system of the computer is Windows 10 Home, 64-bit. The simulation study is performed in R, version 3.6.2 (Rstudio version 1.1.456). The approximated runningtime for both the simulationstudies (all the rmd. files in this folder) is 28 hours, which is largely due to the long runningtime of `A.2.4.Equivalence-testing HR boot`, `B.2.4.Equivalence-testing HR boot`, `A.2.5.Equivalence-testing rMean boot` and `B.2.5.Equivalence-testing rMean boot`.


| R-package                  | Package version | Reference  |
| -----------------          | -------------       | ------------- |
| `Survival`                 |3.1.8                | Therneau T (2015). _A Package for Survival Analysis in S_. version 2.38, <URL: https://CRAN.R-project.org/package=survival>.|
| `Boot`                     |1.3.23         | Angelo Canty and Brian Ripley (2019). boot: Bootstrap R (S-Plus) Functions. R package version 1.3-23.|
| `GGplot2`                   |3.2.1         | H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016|
| `Cowplot`                   |1.0.0         | Claus O. Wilke (2019). cowplot: Streamlined Plot Theme and Plot Annotations for 'ggplot2'. R package version 1.0.0. https://CRAN.R-project.org/package=cowplot |
| `dplyr`                     |0.8.4         | Hadley Wickham, Romain François, Lionel Henry and Kirill Müller (2020). dplyr: A Grammar of Data Manipulation. R package version 0.8.4. https://CRAN.R-project.org/package=dplyr|
| `ggpubr`                    |0.2.4         | Alboukadel Kassambara (2019). ggpubr: 'ggplot2' Based Publication Ready Plots. R package version 0.2.4. https://CRAN.R-project.org/package=ggpubr|
| `survminer`                 |0.4.6|       Alboukadel Kassambara, Marcin Kosinski and Przemyslaw Biecek (2019). survminer: Drawing Survival Curves using 'ggplot2'. R package version 0.4.6.   https://CRAN.R-project.org/package=survminer|


Joukje Willemsen, 14-05-2020
