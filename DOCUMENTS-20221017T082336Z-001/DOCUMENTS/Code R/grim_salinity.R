#loading package
library(tidyverse)

#loading data
#set your own
getwd()
setwd("C:/Users/ASUS/Documents/RStudio")  

mydata <- read.csv("grim_salinity.csv", sep=",")

##head
head(mydata)
summary (mydata)

#Graphique des données

library(ggplot2)

ggplot(mydata, aes(x=Grime.strategy, y=Salinity, fill=Grime.strategy)) + 
  geom_boxplot()  +    
  theme(legend.position="none")

#Results bareground
kruskal.test(mydata$Salinity~mydata$Grime.strategy)
