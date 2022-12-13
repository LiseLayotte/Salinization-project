install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("ggpubr")

library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

mydata <- read.csv("regression.csv", sep=",")
summary(mydata)

hist(mydata$mean_nb)
plot(mean_nb ~ salinity, data = mydata)

m <- lm(mean_nb ~ salinity, data = mydata)
summary(m)

#p-value > 0.05 -> Hypothèse nulle -> pas de regression linéaire 
