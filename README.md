DATA ARCHIVE
===
This repository serves as a research archive for the manuscript "Incorporating historical controls in confirmatory clinical trials using frequentist methods that comprise equivalence testing"

---
**Abstract**
---
Including historical controls in the analysis of a new study can potentially improve power and lead to better parameter estimates. However, the assumption that the historical controls come from the same sampling distribution should be tested carefully to prevent bias and type I error inflation. Currently, this assumption is often tested with a test-than-pool (TTP) test that aims to detect a significant difference in estimated parameters. However, we reason that an equivalence test would be a better fit for this problem. Furthermore, we stress that only including historical controls that are very similar results in a form of confirmation bias. Bootstrapping is considered as a possible solution for this problem. Both the TTP method and the new proposed pooling methods are evaluated in a simulation study considering multiple scenarios that could be realistic in practice. The results show that equivalence testing indeed outperforms the regular TTP test. The equivalence methods where the confidence intervals are bootstrapped underperformed the other methods. Furthermore, the results show that even in a ”perfect world scenario”, the type I error rate is inflated for every pooling method. This is a problem that will remain an important issue when considering pooling historical controls in a current study.

---
| Files/Folders              | Description   |
| -----------------          | ------------- |
|1. Thesis.pdf               |The reference pdf titled "Shortcomings of the test-then-pool method and equivalence testing as a more appropriate method of including historical controls" by Joukje Willemsen|
|2. Plots                    |Folder containing the png's and R-script of the figures as presented in the manuscript|
|3. SimulationStudy	     |A R-project containing the compiled and raw RMD scripts used for the simulationstudy and the saved R workspace

Please note that the files `DATA2018` and `0.Historicaldata` - needed to replicate the simulationstudy - are not stored and shared online, as they contain (a part of) the PRO-ACT dataset. However, after registration, the PRO-ACT dataset can be downloaded [here](https://nctu.partners.org/ProACT/Data/Index/1).

For any help with the files in this archive, please contact Joukje Willemsen (j.e.willemsen@uu.nl). 
