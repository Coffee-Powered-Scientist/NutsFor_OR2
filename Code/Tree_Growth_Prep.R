rm(list = ls())

###Read in NTN_OR2####

library(dplyr)
library(lubridate)

setwd("~/Project_Master/Test_Rep/Data")

Growth_40<-read.csv2("~/Project_Master/Test_Rep/Data/Tree_Growth_40.csv")

Growth_80<-read.csv2("~/Project_Master/Test_Rep/Data/Tree_Growth_80.csv")


Growth_40[,1:5]<- sapply(Growth_40[,1:5],as.numeric)

Growth_80[,1:5]<- sapply(Growth_80[,1:5],as.numeric)

# Repeat Dataset on itself, add a year column

Growth_40_Rep<-do.call("rbind", replicate(12, Growth_40, simplify = FALSE))

Growth_40_Rep$YEAR<-rep(2028:2531, each=1)

Growth_80_Rep<-do.call("rbind", replicate(5, Growth_80, simplify = FALSE))

Growth_80_Rep$YEAR<-rep(2068:2477, each=1)

write.csv(Growth_40_Rep, "Growth_40.csv")
write.csv(Growth_80_Rep, "Growth_80.csv")