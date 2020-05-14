0.DataPreperation - Markdown file that is used to abstract the scale and shape parameters from the historical distribution (the PRO-ACT data) using controls only
1.DataSimulation - Simulate survivaldata based on the parameters extracted from 0.DataPreperation
2.Poolingmethods: - For all simulated datasets the decision "pool or not pool" is made based on each poolingmethod
- 2.1.Always pool
- 2.2.Test-then-pool
- 2.3.Equivalence-testing HR
- 2.4.Equivalence-testing HR boot
- 2.5.Equivalence-testing rMean
- 2.5.Equivalence-testing rMean boot
3.FinalAnalysis - Execute the final analysis (Experimental vs Controlgroup) for all the pooled and not-pooled datasets  
4.DataAnalysis - Calculate & visualize the proportion of false positives and true positives for each poolingmethod

 