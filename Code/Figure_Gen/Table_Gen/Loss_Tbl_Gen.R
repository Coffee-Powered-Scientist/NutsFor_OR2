
rm(list = ls())

library(reshape2)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Table_Prep")

Uno<-read.csv("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_BO/Loss4B.csv", sep=",")

Dos<-read.csv("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_WTH/Loss4W.csv", sep=",")

Tres<-read.csv("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_BO/Loss8B.csv", sep=",")

Quatro<-read.csv("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_WTH/Loss8W.csv", sep=",")


All_Loss<-rbind(Uno, Dos, Tres, Quatro)

write.csv(All_Loss, "All_Loss_Tbl.csv")