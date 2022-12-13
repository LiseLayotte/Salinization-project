#loading package
library(tidyverse)

#loading data
#set your own
getwd()
setwd("C:/Users/ASUS/Documents/RStudio")  

mydata <- read.csv("shannon_salinity.csv", sep=",")

##head
head(mydata)
summary (mydata)


#Results bareground
shapiro.test (mydata$shannon)
shapiro.test (mydata$salinity)
#test non paramétrique
cor.test(mydata$salinity,mydata$shannon, method="spearman")

plot(log(mydata$salinity)~log(mydata$shannon),xlab="Shannon index",ylab="Salinity (μS/cm)",col=mydata$salinity,pch=19, xlim=c(0,5), ylim=c(0,10))
plot(mydata$salinity~mydata$shannon,xlab="Shannon index",ylab="Salinity (μS/cm)",col=mydata$salinity,pch=19, xlim=c(0,5))
