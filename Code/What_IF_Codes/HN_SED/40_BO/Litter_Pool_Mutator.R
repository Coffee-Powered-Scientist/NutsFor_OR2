
rm(list = ls())
###Total Litter Pool Script
library(dplyr)
library(lubridate)
library(janitor)


setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data")

#Can't use above ground flux file, wrong time-step!
source("~/Project_Master/Test_Rep/Code/Functions/Conversion_Func.R")


Litter_Pool<-read.csv2("~/NutsForSEDHN/40_BO/Output data/Litter/Litter pool kg_ha data.csv")
Litter_Amount<-read.csv2("~/NutsForSEDHN/40_BO/Output data/Litter/Litterfall.csv",header=FALSE)

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


Litter_Amount<-Litter_Amount %>% rename(Dry.weight=V3) %>% rename(N=V4) %>% rename(Ca=V5) %>%
  rename(Mg=V6) %>% rename(K=V7) %>% rename(S= V8) %>%
  rename(P= V9)%>% rename(Year=V1, Month=V2) 


Litter_Amount<- Litter_Amount %>% filter(!is.na(Year)) 

Litter_Amount<-Litter_Amount %>% mutate(Date=make_date(Year,Month))

#Conversion
Litter_Amount$N<-LF_Lit_N(Litter_Amount$N, Litter_Amount$Dry.weight)
Litter_Amount$Ca<-LF_Lit_Ca(Litter_Amount$Ca, Litter_Amount$Dry.weight)
Litter_Amount$Mg<-LF_Lit_Mg(Litter_Amount$Mg, Litter_Amount$Dry.weight)
Litter_Amount$K<-LF_Lit_K(Litter_Amount$K, Litter_Amount$Dry.weight)
Litter_Amount$S<-LF_Lit_S(Litter_Amount$S, Litter_Amount$Dry.weight)
Litter_Amount$P<-LF_Lit_P(Litter_Amount$P, Litter_Amount$Dry.weight)

write.csv2(Litter_Pool, "Litter_Pool.csv")
write.csv2(Litter_Amount, "Litter_Fall.csv")