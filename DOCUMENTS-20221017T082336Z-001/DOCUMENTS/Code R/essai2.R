#install.packages("xlsx") 
library("xlsx")
#install.packages("ggplot2") 
library(ggplot2)
#install.packages("tidyverse")
library(tidyverse)

Tableau<-read.xlsx("grim.xlsx",1,
                   header=TRUE, colClasses=NA)
Tableau
FStade<-as.factor(Tableau$Grime.)
FStade2<-as.factor(Tableau$Salinity)

m<-aov(Salinity~Grime., data=Tableau)
summary(m)

library(agricolae)

par(mfrow=c(2,2)) # affiche une fenêtre graphique 2x2
par(mar = rep(2, 4))
plot(m) # affiche les résidus du modèle
shapiro.test(m$residuals)
bartlett.test (m$residuals ~ Tableau$Grime.)

kruskal.test(Tableau$salinite~Tableau$profondeuur)

pairwise.wilcox.test(Tableau$salinite, Tableau$profondeuur,
                     p.adjust.method = "BH")
effect=HSD.test(m,"profondeuur")
effect

par(mfrow=c(1,1))

ggplot(Tableau, aes(x=profondeuur, y=salinite), fill=class)+
  geom_boxplot(aes(fill = profondeuur))+
 

install.packages("ggplot2") 
library(ggplot2)
#install.packages("tidyverse")
library(tidyverse)

