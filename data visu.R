###########################################################
#                      PROJET MLA                         #
###########################################################
library(lme4)
library(AppliedPredictiveModeling)
library(MASS)
library(tree)
library(plyr)
library(glmnet)
library(ggplot2)
library(ggpubr)
transparentTheme(trans = .5)
library(caret)

data = read.table("C:/Users/alext/OneDrive - UCL/UCL/DATA/Q3/LSTAT2210 - Modèles Linéaires Avancés/Projet/sleepstudy_treat_miss.csv", header=TRUE, sep = ",")
data$Subject <- sapply(data$Subject, factor)
#data$age <- sapply(data$age, factor)
data$Days <- sapply(data$Days, factor)
data$treatment <- sapply(data$treatment, factor)
y = data$Reaction
qqnorm(y)
qqline(y)
hist(y, breaks = 10)




# 1) Effet du traitement sur le temps de réaction
ggplot(data = data, mapping = aes(x = treatment, y = Reaction)) +
  geom_point(alpha = 1, aes(color = treatment))  + geom_boxplot(alpha = 0)

# 2) Effet du temps (nbr de jours avec peu de sommeil) sur le temps de réaction
ggplot(data = data, mapping = aes(x = Days, y = Reaction)) +
  geom_point(alpha = 1, aes(color = treatment))  + geom_boxplot(alpha = 0)

# 3) Effet de l'age sur le temps de réaction
ggplot(data = data, mapping = aes(x = age, y = Reaction)) +
  geom_point(alpha = 1, aes(color = treatment)) 

# 4) Age des individus dans chacun des groupes de traitement
ggplot(data = data, mapping = aes(x = treatment, y = age)) +
  geom_point(alpha = 1, aes(color = treatment)) + geom_boxplot(alpha = 0)

# 5) Evolution du temps de réaction durant le temps pour chaque groupe d'age d'individus. 
ggplot(data = data, mapping = aes(x = Days, y = Reaction)) +
  geom_point(alpha = 1, aes(color = sort(sapply(age, factor))))





