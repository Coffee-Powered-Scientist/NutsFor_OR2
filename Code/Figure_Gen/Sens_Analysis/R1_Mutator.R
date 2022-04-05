


##--Sens: R1 Calculator--##

library(dplyr)


# Extracts Sensitivty Info. From Rotation 1 only

# Meant to help dynamizise table in thesis/biogeochem. manuscript

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Maximum/Atm/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Maximum/Atm/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Maximum/Atm/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Maximum/Atm/TreeNut_Mutator.R")


setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")



Atm_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Atmos/Upper/Tree_Nut_All.csv")

Atm_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Atmos/Upper/Tree_Nut_All.csv")

Atm_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Atmos/Upper/Tree_Nut_All.csv")

Atm_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Atmos/Upper/Tree_Nut_All.csv")


Years_R1_40<-c(2005	,2006,	2007,	2008,	2009,2010, 2011,
               2012	,2013	,2014	,2015,	2016,	2017,	2018,
               2019	,2020,	2021	,2022,	2023	,2024, 2025)

#R1 Sens. Biomass Atm. Deposition

LNSED_Atm_Max<-Atm_10_Plus_LNSED %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Atm_Max1<-sum(LNSED_Atm_Max$DW_Bol, LNSED_Atm_Max$DW_Brh,LNSED_Atm_Max$DW_Brk, LNSED_Atm_Max$DW_F)

HNSED_Atm_Max<-Atm_10_Plus_HNSED %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Atm_Max1<-sum(HNSED_Atm_Max$DW_Bol, HNSED_Atm_Max$DW_Brh,HNSED_Atm_Max$DW_Brk, HNSED_Atm_Max$DW_F)

LNBAS_Atm_Max<-Atm_10_Plus_LNBAS %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Atm_Max1<-sum(LNBAS_Atm_Max$DW_Bol, LNBAS_Atm_Max$DW_Brh,LNBAS_Atm_Max$DW_Brk, LNBAS_Atm_Max$DW_F)

HNBAS_Atm_Max<-Atm_10_Plus_HNBAS %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Atm_Max1<-sum(HNBAS_Atm_Max$DW_Bol, HNBAS_Atm_Max$DW_Brh,HNBAS_Atm_Max$DW_Brk, HNBAS_Atm_Max$DW_F)

Atm_R1<-cbind(LN_SED_Atm_Max1,HN_SED_Atm_Max1,LN_BAS_Atm_Max1,HN_BAS_Atm_Max1)


#R1 Sens. Biomass Mineral Area

Mine_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

Mine_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

Mine_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

Mine_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

LNSED_Mine_Max<-Mine_10_Plus_LNSED %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Mine_Max1<-sum(LNSED_Mine_Max$DW_Bol, LNSED_Mine_Max$DW_Brh,LNSED_Mine_Max$DW_Brk, LNSED_Mine_Max$DW_F)

HNSED_Mine_Max<-Mine_10_Plus_HNSED %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Mine_Max1<-sum(HNSED_Mine_Max$DW_Bol, HNSED_Mine_Max$DW_Brh,HNSED_Mine_Max$DW_Brk, HNSED_Mine_Max$DW_F)

LNBAS_Mine_Max<-Mine_10_Plus_LNBAS %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Mine_Max1<-sum(LNBAS_Mine_Max$DW_Bol, LNBAS_Mine_Max$DW_Brh,LNBAS_Mine_Max$DW_Brk, LNBAS_Mine_Max$DW_F)

HNBAS_Mine_Max<-Mine_10_Plus_HNBAS %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Mine_Max1<-sum(HNBAS_Mine_Max$DW_Bol, HNBAS_Mine_Max$DW_Brh,HNBAS_Mine_Max$DW_Brk, HNBAS_Mine_Max$DW_F)

Mine_R1<-cbind(LN_SED_Mine_Max1,HN_SED_Mine_Max1,LN_BAS_Mine_Max1,HN_BAS_Mine_Max1)


#R1 Sens. Biomass Ex. Pool

Ex_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

Ex_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

Ex_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

Ex_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

LNSED_Ex_Max<-Ex_10_Plus_LNSED %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Ex_Max1<-sum(LNSED_Ex_Max$DW_Bol, LNSED_Ex_Max$DW_Brh,LNSED_Ex_Max$DW_Brk, LNSED_Ex_Max$DW_F)

HNSED_Ex_Max<-Ex_10_Plus_HNSED %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Ex_Max1<-sum(HNSED_Ex_Max$DW_Bol, HNSED_Ex_Max$DW_Brh,HNSED_Ex_Max$DW_Brk, HNSED_Ex_Max$DW_F)

LNBAS_Ex_Max<-Ex_10_Plus_LNBAS %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Ex_Max1<-sum(LNBAS_Ex_Max$DW_Bol, LNBAS_Ex_Max$DW_Brh,LNBAS_Ex_Max$DW_Brk, LNBAS_Ex_Max$DW_F)

HNBAS_Ex_Max<-Ex_10_Plus_HNBAS %>% 
  filter(YEAR %in%  c("2025") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Ex_Max1<-sum(HNBAS_Ex_Max$DW_Bol, HNBAS_Ex_Max$DW_Brh,HNBAS_Ex_Max$DW_Brk, HNBAS_Ex_Max$DW_F)

Ex_R1<-cbind(LN_SED_Ex_Max1,HN_SED_Ex_Max1,LN_BAS_Ex_Max1,HN_BAS_Ex_Max1)


R1_Tot<-cbind(Atm_R1, Ex_R1, Mine_R1)


write.csv(R1_Tot, "R1_Sens.csv")