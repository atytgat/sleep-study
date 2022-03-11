# Modeling a treatment's effect on the reaction time of sleep deprived patients

Sleep medicine researchers conducted a study on the effects of sleep deprivation. They followed 18 patients for 10 days. 
On day 0 the patients slept without restriction, after this day (day 1 to 9) they were put on a regime with a maximum of 3 hours of sleep per night. The effects on the short and long term are studied, in particular by analyzing the reaction time of the patients. Here the researchers are also interested in the effect of certain drugs and compare 2 groups A (placebo) and B (experimental treatment). 

The database is already structured in long format (one line per timepoint). The information available are:
- Reaction: reaction time in ms
- Days: day in relation to the cycle (day 0: normal sleep, 1-9 following days)
- Subject: patient ID
- age: patient's age
- treatment: treatment A or B

The main research question concerns the impact of treatment on reaction time.
It can be assumed that the missing values are "missing completely at random" i.e. the probability of absence is the same for all probability of absence is the same for all observations. This probability does not depend This probability does not depend on the observed values of the response nor on the unobserved values.


Several linear models are built in SAS, some with mixed effects and some with mixed error-components to account for the correlations present in the dataset. Each model considered is chosen based upon assumptions made on the data, and each tries to improve upon the previous models considered. We conclude that it can not be asserted that the treatment has any effects on the reaction time of the patients.

The whole description of the procedure and the results analysis can be found in the report file. Note that it is written in French.


This project was conducted as part of the LSTAT2210 Advanced linear modeling at UCLouvain in 2020.

