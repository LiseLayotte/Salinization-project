#loading package
library(tidyverse)

#loading data
#set your own
getwd()
setwd("C:/Users/ASUS/Documents/RStudio")  

mydata <- read.csv("shannon3.csv", sep=",")

##head
head(mydata)
summary (mydata)

#Graphique des données

library(ggplot2)

ggplot(mydata, aes(x=viticultural_practice, y=shannon, fill=viticultural_practice)) + 
  geom_boxplot()  +    
  theme(legend.position="none")

kruskal.test(mydata$shannon~mydata$viticultural_practice)
#p-value > 0.05 -> on ne peux pas rejetter H0, les groupes ont la meme distribution

pairwise.wilcox.test(mydata$shannon,mydata$viticultural_practice)
#
#Seule abandonned et commited sont différents 

