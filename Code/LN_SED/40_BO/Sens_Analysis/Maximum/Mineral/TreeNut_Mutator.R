
rm(list = ls())
#Set wd to edited data in mutator files; that way writecsv always deposits it in one place
setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Min/Upper")

#This File Specifically mutates data for stacked plots, as per request!


#Set wd to edited data in mutator files; that way writecsv always deposits it in one place
library(dplyr)
library(janitor)
library(lubridate)
library(reshape2)
library(ggplot2)

#Maybe have a function script-maybe have a script library of individual scripts
Tree_Nut<-read.csv2("~/Sens_Parent/Sens_Min/LN_SED/40_BO/Maximum/Output data/Biomass/Tree data.csv", header=FALSE)

Tree_Nut_2<-Tree_Nut %>%
  select(V1:V3, V10:V15, V16, V23:V29, V36:V42, V49:V61)

Tree_Foliage<-Tree_Nut_2 %>% select(V1:V3, V10:V15) %>% row_to_names (row_number=2) %>%
  rename(K_F='K kg/ha', Ca_F="Ca kg/ha", N_F="N kg/ha", Mg_F="Mg kg/ha", S_F="S kg/ha", P_F="P kg/ha", DW_F="Dry weight")

Tree_Foliage[c(1:9)]<-lapply(Tree_Foliage[c(1:9)], as.numeric)

Tree_Wood<-Tree_Nut_2 %>% select(V16:V28) %>% row_to_names (row_number=2) %>%
  rename(K_Bol='K kg/ha', Ca_Bol="Ca kg/ha", N_Bol="N kg/ha", Mg_Bol="Mg kg/ha", S_Bol="S kg/ha", P_Bol="P kg/ha", DW_Bol="Dry weight")
Tree_Wood[c(1:7)]<-lapply(Tree_Wood[c(1:7)], as.numeric)

Tree_Bark<-Tree_Nut_2 %>% select(V29:V41) %>% row_to_names (row_number=2) %>%
  rename(K_Brk='K kg/ha', Ca_Brk="Ca kg/ha", N_Brk="N kg/ha", Mg_Brk="Mg kg/ha", S_Brk="S kg/ha", P_Brk="P kg/ha", DW_Brk="Dry weight")
Tree_Bark[c(1:7)]<-lapply(Tree_Bark[c(1:7)], as.numeric)

Tree_Branch<-Tree_Nut_2 %>% select(V42:V54) %>% row_to_names (row_number=2) %>%
  rename(K_Brh='K kg/ha', Ca_Brh="Ca kg/ha", Mg_Brh="Mg kg/ha", S_Brh="S kg/ha", P_Brh="P kg/ha", DW_Brh="Dry weight", N_Brh="N kg/ha")

Tree_Branch[c(1:6)]<-lapply(Tree_Branch[c(1:6)], as.numeric)



Tree_Nutrients_All<-cbind(Tree_Foliage, Tree_Bark, Tree_Branch, Tree_Wood)

write.csv2(Tree_Nutrients_All, "Tree_Nut_All.csv")
