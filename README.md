DATA ARCHIVE
===
This repository serves as a research archive for the manuscript "Incorporating historical controls in confirmatory clinical trials using frequentist methods that comprise equivalence testing"

---
**Abstract**
---
Including historical controls in the analysis of a new study can potentially improve power and lead to better parameter estimates. However, the assumption that the historical controls come from the same sampling distribution should be tested carefully to prevent bias and type I error inflation. Currently, this assumption is often tested with a test-than-pool (TTP) test that aims to detect a significant difference in estimated parameters. However, we reason that an equivalence test would be a better fit for this problem. Furthermore, we stress that only including historical controls that are very similar results in a form of confirmation bias. Bootstrapping is considered as a possible solution for this problem. Both the TTP method and the new proposed pooling methods are evaluated in a simulation study considering multiple scenarios that could be realistic in practice. The results show that equivalence testing indeed outperforms the regular TTP test. The equivalence methods where the confidence intervals are bootstrapped underperformed the other methods. Furthermore, the results show that even in a ”perfect world scenario”, the type I error rate is inflated for every pooling method. This is a problem that will remain an important issue when considering pooling historical controls in a current study.

---
**Contents**
---
| Files/Folders              | Description   |
| -----------------          | ------------- |
|1. Thesis.pdf               |The reference pdf titled "Shortcomings of the test-then-pool method and equivalence testing as a more appropriate method of including historical controls" by Joukje Willemsen|
|2. Plots                    |Folder containing the png's and R-script of the figures as presented in the manuscript|
|3. SimulationStudy	     |A R-project containing the compiled and raw RMD scripts used for the simulationstudy and the saved R workspace

---
**Permission and access**
---
**Datamanagment, privacy & ethical approval**

The parameters used to simulate the current controls were based on the PRO-ACT dataset. Furthermore, the data from the controlgroups in the PRO-ACT dataset was used to represent historical controls. 
After registration, the PRO-ACT dataset can be downloaded [here](https://nctu.partners.org/ProACT/Data/Index/1).

**Ethical approval**
I have been granted permission by the NCRI team to download data from the PRO-ACT database.
The use of the PRO-ACT dataset in this simulationstudy is approved by the Ethics Committee of the Faculty of Social and Behavioural Sciences of Utrecht
University, filed under number 19-125.

**Privacy**
On the website of [PRO-ACT](https://nctu.partners.org/ProACT/Document/DisplayLatest/2#anchor_0), there's the following ethical statement:
*"In all of the trials that generated the data included in this database, study protocols were approved by the participating medicalcenters and all participating patients gave informed consent. De-identified data from these trials were donated to the PRO-ACT database for research purposes only and under the explicit conditions that Prize4Life and all users of the data would maintain the anonymity of subjects and not attempt to discover the identity of any subject. In the rare cases where donated data was not already completely anonymized, donated data was further anonymized following the HIPAA de-identification conventions for personal health information: any potential patient initials and/or dates of birth were removed, new randomized subject numbers were created, and wherever possible, trial-specific information was removed in the merging of datasets, including trial center identity and location, trial dates, or other identifying information."*

*Data management*
Among the terms and conditions of using the PRO-ACT dataset is the following:

- "I will not share access to the PRO-ACT Database with anyone who has not signed this agreement and acknowledged the terms and conditions set forth herein."

Hence only summarystatistics are stored in this research archive and no datasets that contain parts of the PRO-ACT dataset in any way are shared online. Hence, the files `DATA2018` and `0.Historicaldata` - needed to replicate the simulationstudy - are not stored and shared online, as they contain (a part of) the PRO-ACT dataset. However, after registration, the PRO-ACT dataset can be downloaded [here](https://nctu.partners.org/ProACT/Data/Index/1).

The Rcode used to simulate historical controls, to obtain the decision qualities of different pooling methods and to obtain the figures presented in the paper are shared on github.

---

For any help with the files in this archive, please contact Joukje Willemsen (j.e.willemsen@uu.nl). 
