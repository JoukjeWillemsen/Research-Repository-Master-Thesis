DATA ARCHIVE
===
This repository serves as a research archive for the manuscript "Incorporating historical controls in confirmatory clinical trials using frequentist methods that comprise equivalence testing" for the masters programme Methodology & Statistics for the Behavioural, Biomedical and Social Science at Utrecht University.

The manuscript has not yet been published. The manuscript was handed in as master thesis at 11-05-2020.

---
**Abstract**
---
Including historical controls in the analysis of a new study can potentially improve power and lead to better parameter estimates. However, the assumption that the historical controls come from the same sampling distribution should be tested carefully to prevent bias and type I error inflation. Currently, this assumption is often tested with a test-than-pool (TTP) test that aims to detect a significant difference in estimated parameters. However, we reason that an equivalence test would be a better fit for this problem. Furthermore, we stress that only including historical controls that are very similar results in a form of confirmation bias. Bootstrapping is considered as a possible solution for this problem. Both the TTP method and the new proposed pooling methods are evaluated in a simulation study considering multiple scenarios that could be realistic in practice. The results show that equivalence testing indeed outperforms the regular TTP test. The equivalence methods where the confidence intervals are bootstrapped underperformed the other methods. Furthermore, the results show that even in a ”perfect world scenario”, the type I error rate is inflated for every pooling method. This is a problem that will remain an important issue when considering pooling historical controls in a current study.

---
**Contents**
---
| Files/Folders              | Description   |
| -----------------          | ------------- |
|`1. Manuscript`          |Contains both the pdf of the manuscript titled "Shortcomings of the test-then-pool method and equivalence testing as a more appropriate method of including historical controls" and the material files used to compile this pdf|
|`2. Supplemental figures`                    |Folder containing compiled and raw RMD scripts and the png's of the supplemental figures as presented in the manuscript|
|`3. SimulationStudy`	     |A R-project containing the compiled and raw RMD scripts used to simulate data, perform poolingmethods, analyse the results and make the plots as presented in the manuscript|
|`4. Data storage & privacy` |Contains a READ.ME with information about permission, storage and privacy|

---
**Data storage**
---

**Datamanagment & ethical approval**
For details about datamanegement and ethical approval, please visist [`4. Data storage & privacy`](https://github.com/JoukjeWillemsen/Research-Repository-Master-Thesis/tree/master/4.Data%20storage%20%26%20privacy).

**Replication**
For a detailled description of the simulationprocedure to replicate the obtained results please visit [`3. SimulationStudy`](https://github.com/JoukjeWillemsen/Research-Repository-Master-Thesis/tree/master/3.SimulationStudy).

---
**Privacy**
---

**Data protection impact assessment**

The PRO-ACT database is already publicly available with the goal of facilitating research that might benefit future ALS patients. The research question of this manuscript is in line with this goal; if a more appropriate method of including historical controls can be established, future (ALS) trials can benefit from this knowledge and in some cases underpowered and/or biased studies can be prevented. The PRO-ACT database provides real-world historical controls, and therefore provided the simulation study with a more realistic working example. 
The use of the PRO-ACT dataset in this study is conform the [terms and conditions of the PRO-ACT database](https://nctu.partners.org/ProACT/Document/DisplayLatest/1) and not shared with others or stored elsewhere. Hence no additional burden, risks or privacyproblems is caused by this study for any of the participants who originally took part of the trials inlcuded in the PRO-ACT database.

**Informed consent & anonymization/pseudonymization**

On the website of PRO-ACT, there's the following ethical statement: *"In all of the trials that generated the data included in this database, study protocols were approved by the participating medicalcenters and all participating patients gave informed consent. De-identified data from these trials were donated to the PRO-ACT database for research purposes only and under the explicit conditions that Prize4Life and all users of the data would maintain the anonymity of subjects and not attempt to discover the identity of any subject. In the rare cases where donated data was not already completely anonymized, donated data was further anonymized following the HIPAA de-identification conventions for personal health information: any potential patient initials and/or dates of birth were removed, new randomized subject numbers were created, and wherever possible, trial-specific information was removed in the merging of datasets, including trial center identity and location, trial dates, or other identifying information."*

**Security**

The PRO-ACT database is publicly available. However, statement four of the terms and conditions of using the PRO-ACT dataset states that the PRO-ACT Database should not be shared with anyone who has not signed the agreement and acknowledged the terms and conditions. Hence only summarystatistics are stored in this research archive and no raw data that contain parts of the PRO-ACT dataset in any way are shared online. 

For more information about the collection of the data, informed consent and how privacy is guaranteed I would like to refer to the [PRO-ACT website](https://nctu.partners.org/ProACT/Document/DisplayLatest/9) and [the article of Atassi et al. (2014)](https://www.ncbi.nlm.nih.gov/pubmed/25298304)

---
**Permission and access**
---

This research archive is publicly available and shared on [github](https://github.com/JoukjeWillemsen/Research-Repository-Master-Thesis). A copy of this repository has been stored in the archives of Utrecht University. The data will be stored for a minimal duration of ten years.

---

For any help with the files in this archive, please contact Joukje Willemsen (j.e.willemsen@uu.nl). 
