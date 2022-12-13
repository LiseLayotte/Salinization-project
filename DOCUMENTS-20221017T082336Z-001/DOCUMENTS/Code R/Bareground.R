#loading package
library(tidyverse)

#loading data
#set your own
getwd()
setwd("C:/Users/ASUS/Documents/RStudio")  

mydata <- read.csv("data_plant.csv", sep=",")

##head
head(mydata)
summary (mydata)

#Graphique des données

library(ggplot2)

ggplot(mydata, aes(x=viticultural_practice, y=bareground, fill=viticultural_practice)) + 
  geom_boxplot()  +    
  theme(legend.position="none")

  #Results bareground

m<-aov(bareground~viticultural_practice,data=mydata)
summary(m)

res <- lm(bareground~viticultural_practice, data=mydata)
summary(res)
anova(res)

#Pr(>F) < 0.05 -> les habitats ont un réel impact sur le pourcentage sol nu

# Validation du modèle
##residuals
par(mfrow=c(2,2))
plot(res) #!!!pb ici

##  Shapiro-Wilk normality test
shapiro.test(res$residuals)

#la p-value est > à 0.05, on ne peut pas rejeter l’hypothèse nulle. Les 
#résidus du modèle sont donc considérées comme suivant une loi normale.

##  Bartlett test of homogeneity of variances
bartlett.test (res$residuals ~ mydata$viticultural_practice)

#p-value > 0.05 on ne peux pas rejetter l'hypothèse nulle, les variances des résidus sont égales


##results nb_species

ggplot(mydata, aes(x=viticultural_practice, y=nb_species, fill=viticultural_practice)) + 
  geom_boxplot()  +    
  theme(legend.position="none")

kruskal.test(mydata$nb_species~mydata$viticultural_practice)
#p-value > 0.05 -> on ne peux pas rejetter H0, les groupes ont la meme distribution

pairwise.wilcox.test(mydata$nb_species,mydata$viticultural_practice)
#
#Seule abandonned montre des résultats différents des autres groupes 

#Results height

ggplot(mydata, aes(x=viticultural_practice, y=mean_height, fill=viticultural_practice)) + 
  geom_boxplot()  +    
  theme(legend.position="none")

kruskal.test(mydata$mean_height~mydata$viticultural_practice)
#p-value < 0.05 -> on rejette H0, les groupes n'ont pas la meme distribution

pairwise.wilcox.test(mydata$mean_height,mydata$viticultural_practice)

