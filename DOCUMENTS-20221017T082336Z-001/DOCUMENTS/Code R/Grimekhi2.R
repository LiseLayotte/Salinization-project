#loading package
library(tidyverse)

#loading data
#set your own
getwd()

data<-read.csv("grime.csv", sep=",")
data
summary(data)

#test du Khi-2
Tab<-table(data$Agricultural.Practicies,data$Grime.strategy)
chi<-chisq.test(data$Agricultural.Practicies, data$Grime.strategy)
Tab
#Repr??sentation
barplot(Tab)

#Valeurs attendues pour tester les conditions de validit??
chi$expected
