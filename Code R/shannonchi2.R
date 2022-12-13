#loading package
library(tidyverse)

#loading data
#set your own
getwd()
setwd("C:/Users/ASUS/Documents/RStudio")  

mydata <- read.csv("shannon2.csv", sep=",")

##head
head(mydata)
summary (mydata)

#Graphique des données

library(ggplot2)

ggplot(mydata, aes(x=viticultural_practice, y=shannon, fill=viticultural_practice)) + 
  geom_boxplot()  +    
  theme(legend.position="none")

#Results shannon
Tableau<-table(viticultural_practice,shannon)
Tableau <- matrix(c(0.3151507699,0.6686513702,0.5665394331,0.8313306394), nrow = 4, ncol=1, byrow=TRUE)
chi<-chisq.test(Tableau)
chi
barplot(Tableau)

