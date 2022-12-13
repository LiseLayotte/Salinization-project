#install.packages("xlsx") 
library("xlsx")
#install.packages("ggplot2") 
library(ggplot2)
#install.packages("tidyverse")
library(tidyverse)

Tableau<-read.xlsx("essai.xlsx",1,
                   header=TRUE, colClasses=NA, row.names=1)
Tableau

chi<-chisq.test(Tableau)
chi
barplot(as.matrix(Tableau), col=c (62,8,5,5,11), main="% of Grime Strategy according of agricultural practice", cex.main=1,
        legend.text=c("R","S","C","CR","SR"), args.legend=list(x="topright"))

