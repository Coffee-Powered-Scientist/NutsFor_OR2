
# Sens Table Prep. 
rm(list = ls())

library(dplyr)
library(reshape2)


setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

Uno<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Atm_Weath.csv")
Dos<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Exch_Weath.csv")
Tres<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Growth_Weath.csv")
Quatro<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Mineral_Weath.csv")
Cinco<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Nit_Weath.csv")
Seis<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_SOMP_Weath.csv")


Total_Weath<-rbind(Uno, Dos, Tres, Quatro, Cinco, Seis)

Siete<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Atm_Leach.csv")
Ocho<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Exch_Leach.csv")
Nueve<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Growth_Leach.csv")
Diez<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Mineral_Leach.csv")
Diez1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Nit_Leach.csv")
Diez2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_SOMP_Leach.csv")

Total_Leach<-rbind(Siete, Ocho, Nueve, Diez, Diez1, Diez2)

Ein<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Atm_Bio.csv")
Zewi<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Exch_Bio.csv")
Drei<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Growth_Bio.csv")
vrei<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Mineral_Bio.csv")
funf<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_Nit_Bio.csv")
sechs<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Sens_Tbl_SOMP_Bio.csv")

Total_Bio<-rbind(Ein, Zewi, Drei, vrei, funf, sechs)

write.csv(Total_Weath, "Total_Weath_Sens.csv")
write.csv(Total_Leach, "Total_Leach_Sens.csv")
write.csv(Total_Bio, "Total_Bio_Sens.csv")