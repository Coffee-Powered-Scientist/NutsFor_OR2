rm(list = ls())
###Total Litter Pool Script
library(dplyr)
library(lubridate)


setwd("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Edited Data")

Litter_Pool<-read.csv2("~/NutsForBASLN/Base/Output data/Litter/Litter pool kg_ha data.csv")
Litter_Amount<-read.csv2("~/NutsForBASLN/Base/Output data/Litter/Litterfall.csv",header=FALSE)


Litter_Coarse<-Litter_Pool %>% select(c(17:23)) %>% row_to_names(row_number = 1) %>% 
  rename(Ca_CL=`Ca kg/ha`) %>% rename(Mg_CL=`Mg kg/ha`) %>%
  rename(C_CL=`C kg/ha`) %>% rename(K_CL=`K kg/ha`) %>% rename(N_CL=`N kg/ha`) %>% rename(P_CL= `P kg/ha`) %>%
  rename(S_CL= `S kg/ha`)

Litter_Fine<-Litter_Pool %>% select(c(24:30))%>% row_to_names(row_number = 1) %>%
  rename(Ca_F=`Ca kg/ha`) %>% rename(Mg_F=`Mg kg/ha`) %>%
  rename(C_F=`C kg/ha`) %>% rename(K_F=`K kg/ha`) %>% rename(N_F=`N kg/ha`) %>% rename(P_F= `P kg/ha`) %>%
  rename(S_F= `S kg/ha`)

Litter_Humus<-Litter_Pool %>% select(c(31:37))%>% row_to_names(row_number = 1) %>%
  rename(Ca_H=`Ca kg/ha`) %>% rename(Mg_H=`Mg kg/ha`) %>%
  rename(C_H=`C kg/ha`) %>% rename(K_H=`K kg/ha`) %>% rename(N_H=`N kg/ha`) %>% rename(P_H= `P kg/ha`) %>%
  rename(S_H= `S kg/ha`)

Litter_All<- Litter_Pool %>% select(c(1:9)) %>% row_to_names(row_number = 1) %>%  
  mutate(Date = make_date(YEAR, Month)) %>% rename(Ca=`Ca kg/ha`) %>% rename(Mg=`Mg kg/ha`) %>%
  rename(C=`C kg/ha`) %>% rename(K=`K kg/ha`) %>% rename(N=`N kg/ha`) %>% rename(P= `P kg/ha`) %>%
  rename(S= `S kg/ha`)


Litter_Pool<-cbind(Litter_Coarse, Litter_Fine, Litter_Humus, Litter_All)

Litter_Pool[c(1:30)]<-lapply(Litter_Pool[c(1:30)], as.numeric)
Litter_Amount[c(1:9)]<-lapply(Litter_Amount[c(1:9)], as.numeric)


Litter_Amount<-Litter_Amount %>% rename(Dry.weight=V3) %>% rename(Ca=V4) %>% rename(Mg=V5) %>%
  rename(K=V6) %>% rename(N=V7) %>% rename(P= V8) %>%
  rename(S= V9)%>% rename(Date=V1)


Litter_Amount<- Litter_Amount%>% filter(!is.na(Date))



write.csv2(Litter_Pool, "Litter_Pool.csv")
write.csv2(Litter_Amount, "Litter_Fall.csv")