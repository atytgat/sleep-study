/* Generated Code (IMPORT) */
/* Source File: sleepstudy_treat_miss.csv */
/* Source Path: /home/u44436243 */
/* Code generated on: 1/2/21, 4:57 PM */

%web_drop_table(WORK.SLEEP);


FILENAME REFFILE '/home/u44436243/sleepstudy_treat_miss.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.SLEEP;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.SLEEP; RUN;

%web_open_table(WORK.SLEEP);

/* copy Days to use when Days is considered not categorial */
DATA SLEEP;
SET SLEEP;
DaysC = put(Days,2.);
RUN;



/* Modèle 1 : ANOVA pour le traitement */
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest;
title 'Modele 1';
CLASS treatment;
MODEL Reaction = treatment  / SOLUTION OUTP=previsions RESIDUAL CL;
RUN;
ODS graphics off; 


/* Modèle 2 : Subject comme effet aléatoire */
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 2';
CLASS Subject treatment;
MODEL Reaction = treatment / SOLUTION OUTP=previsions RESIDUAL CL;
RANDOM Subject / G;
REPEATED / TYPE = SIMPLE SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 


/* Modèle 3 : AR(1)*/
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 3';
CLASS Subject treatment;
MODEL Reaction = treatment / SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED / TYPE = AR(1) SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 

/* Modèle 3 bis : TOEP*/
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 3 bis';
CLASS Subject treatment;
MODEL Reaction = treatment / SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED / TYPE = TOEP  SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 

/* Modèle 3bisbis: UN */
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 3bis';
CLASS Subject treatment;
MODEL Reaction = treatment / SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED / TYPE = UN SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 



/* Modèle 4: + age */
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 4';
CLASS Subject treatment;
MODEL Reaction = treatment age/ SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED / TYPE = AR(1) SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 


/* Modèle 4bis : interaction age et traitement rejetée*/
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 4bis';
CLASS Subject treatment;
MODEL Reaction = treatment age age*treatment/ SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED / TYPE = AR(1) SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 


/* Modèle 5 : + Days*/
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 5';
CLASS Subject treatment DaysC;
MODEL Reaction = treatment age Days/ SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED DaysC/ TYPE = AR(1) SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 

/* Modèle 5bis : Days treatment interaction rejetée */
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 5bis';
CLASS Subject treatment DaysC;
MODEL Reaction = treatment age Days Days*treatment/ SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED DaysC/ TYPE = AR(1) SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 


/* Modèle 6 : + interaction age*jour */
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 6';
CLASS Subject treatment DaysC;
MODEL Reaction = treatment age Days Days*age/ SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED DaysC/ TYPE = AR(1) SUBJECT = Subject R RCORR;
RUN;
ODS graphics off; 

/* Modèle 7 : correlation differente selon le traitement*/
ODS graphics on;
PROC MIXED data = SLEEP method = ml covtest IC;
title 'Modele 7';
CLASS Subject treatment DaysC;
MODEL Reaction = treatment age Days Days*age/ SOLUTION OUTP=previsions RESIDUAL CL;
REPEATED DaysC/ TYPE = AR(1) SUBJECT = Subject Group=treatment R=1,11 RCORR=1,11;
RUN;
ODS graphics off; 
