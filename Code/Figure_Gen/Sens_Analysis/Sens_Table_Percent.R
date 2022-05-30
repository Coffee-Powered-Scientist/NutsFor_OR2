
rm(list=ls())

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")
# Take percent sens. output and generates a pre-table to be used for the manuscript

library(dplyr)
library(reshape2)
library(stringr)
library(tidyr)

## Atmospheric Sens. Variable

AtmBio<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/AtmBio_Per.csv')
AtmLeach<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/AtmLeach_Per.csv')
AtmWeath<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/AtmWeath_Per.csv')

Atm<-cbind(AtmBio)
Atm$id = "Atm"

Atm_M<-melt(Atm)

AtmLeach$Pz = "Leach"
AtmWeath$Pz = "Weath"

AtmLeach<-melt(AtmLeach)

AtmWeath<-melt(AtmWeath)
Atm_BC<-rbind(AtmLeach, AtmWeath)
Atm_BC$id = "Atm"

Atm_BC_Melt<-Atm_BC

## Exchangeable Sens. Variable

ExBio<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/ExBio_Per.csv')
ExLeach<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/ExLeach_Per.csv')
ExWeath<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/ExWeath_Per.csv')

Ex<-cbind(ExBio) #, ExLeach, ExWeath)

Ex$id = "Ex"

Ex_M<-melt(Ex)

ExLeach$Pz = "Leach"
ExWeath$Pz = 'Weath'
Ex_BC<-rbind(melt(ExLeach), melt(ExWeath))
Ex_BC$id = "Ex"
Ex_BC_Melt<-Ex_BC


## Growth Sens. Variable

GrwthBio<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/GrowthBio_Per.csv')
GrwthLeach<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/LeachGrowth_Per.csv')
GrwthWeath<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/GrowthWeath_Per.csv')

Grwth<-cbind(GrwthBio) #, GrwthLeach, GrwthWeath)

Grwth$id = "Grwth"

Grwth_M<-melt(Grwth)

GrwthLeach$Pz = "Leach"
GrwthWeath$Pz = 'Weath'
Grwth_BC<-rbind(melt(GrwthLeach), melt(GrwthWeath))
Grwth_BC$id = "Grwth"
Grwth_BC_Melt<-Grwth_BC


## Mineral Sens. Variable

MinBio<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/MinBio_Per.csv')
MinLeach<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/MinLeach_Per.csv')
MinWeath<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/MinWeath_Per.csv')

Min<-cbind(MinBio) #, MinLeach, MinWeath)

Min$id = "Mineral"

Min_M<-melt(Min)

MinLeach$Pz = "Leach"
MinWeath$Pz = 'Weath'
Min_BC<-rbind(melt(MinLeach), melt(MinWeath))
Min_BC$id = "Min"
Min_BC_Melt<-Min_BC

## Nitrification

NitBio<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/NitBio_Per.csv')
NitLeach<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/NitLeach_Per.csv')
NitWeath<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/NitWeath_Per.csv')

Nit<-cbind(NitBio) #, NitLeach, NitWeath)

Nit$id = "Nit"

Nit_M<-melt(Nit)

NitLeach$Pz = "Leach"
NitWeath$Pz = 'Weath'
Nit_BC<-rbind(melt(NitLeach), melt(NitWeath))
Nit_BC$id = "Nit"
Nit_BC_Melt<-Nit_BC

## SOMP 

SOMPBio<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/SOMPGrowth_Per.csv')
SOMPLeach<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/SOMPLeach_Per.csv')
SOMPWeath<-read.csv('~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/SOMPWeath_Per.csv')

SOMP<-cbind(SOMPBio) #, SOMPLeach, SOMPWeath)

SOMP$id = "SOMP"

SOMP_M<-melt(SOMP)

SOMPLeach$Pz = "Leach"
SOMPWeath$Pz = 'Weath'
SOMP_BC<-rbind(melt(SOMPLeach), melt(SOMPWeath))
SOMP_BC$id = "SOMP"
SOMP_BC_Melt<-SOMP_BC
# Bind all together, melt, and add identification 

Tbl_Melt<-rbind(Atm_M, Ex_M, Grwth_M, Min_M, Nit_M, SOMP_M)


Tbl_Melt$type<-ifelse(grepl("Max",Tbl_Melt$variable),'Max','Min')

Tbl_Melt$SiteN<-ifelse(grepl("LN",Tbl_Melt$variable),'LN','HN')

Tbl_Melt$Rock<-ifelse(grepl("SED",Tbl_Melt$variable),'SED','BAS')

Tbl_Melt<-Tbl_Melt  %>% unite(Site, SiteN, Rock)

Tbl_Melt<-Tbl_Melt[-c(1,10, 19, 28, 37, 46),]

target = c("LN_SED", "LN_BAS", "HN_SED", "HN_BAS")

Tbl_Biomass<-dcast(Tbl_Melt,  Site ~ id+type)

Tbl_Biomass<-Tbl_Biomass[order(nrow(Tbl_Biomass):1),]

######

Tbl_Melt_BC<-rbind(Atm_BC_Melt, Ex_BC_Melt, Grwth_BC_Melt, Min_BC_Melt, Nit_BC_Melt, SOMP_BC_Melt)

Tbl_Melt_BC<-Tbl_Melt_BC[-c(1,26, 43, 68, 85, 110, 127, 152,169, 194, 211, 236),]

Tbl_Melt_BC$type<-ifelse(grepl("Max",Tbl_Melt_BC$variable),'Max','Min')

Tbl_Melt_BC$SiteN<-ifelse(grepl("LN",Tbl_Melt_BC$variable),'LN','HN')

Tbl_Melt_BC$Rock<-ifelse(grepl("SED",Tbl_Melt_BC$variable),'SED','BAS')


Tbl_Melt_BC<-Tbl_Melt_BC  %>% unite(Site, SiteN, Rock)

Tbl_Melt_BC$Cation<-ifelse(grepl("_Ca", Tbl_Melt_BC$variable), "Ca", ifelse(grepl("_Mg", Tbl_Melt_BC$variable), "Mg", "K"))



### Determine Cation Type ###


Tbl_BC<-dcast(Tbl_Melt_BC,  Site ~ id+type+Cation+Pz)

Tbl_BC<-Tbl_BC[order(nrow(Tbl_BC):1),]

write.csv(Tbl_Biomass, "Biomass_Percent_Change_Sens.csv")
write.csv(Tbl_BC, "BC_Percent_Change_Sens.csv")
