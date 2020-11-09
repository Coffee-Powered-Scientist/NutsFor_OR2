rm(list = ls())
###Total Litter Pool Script
library(dplyr)
library(lubridate)


setwd("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Edited Data")

Litter_Pool<-read.csv2("~/NutsForBASLN/Output data/Litter/Litter pool kg_ha data.csv")
Litter_Amount<-read.csv2("~/NutsForBASLN/Output data/Litter/Litterfall.csv",header=FALSE)

Litter_Pool<- Litter_Pool %>% select(c(1:9)) %>% row_to_names(row_number = 1) %>%  
  mutate(Date = make_date(YEAR, Month)) %>% rename(Ca=`Ca kg/ha`) %>% rename(Mg=`Mg kg/ha`) %>%
  rename(C=`C kg/ha`) %>% rename(K=`K kg/ha`) %>% rename(N=`N kg/ha`) %>% rename(P= `P kg/ha`) %>%
  rename(S= `S kg/ha`)

Litter_Pool[c(3:9)]<-lapply(Litter_Pool[c(3:9)], as.numeric)
Litter_Amount[c(1:9)]<-lapply(Litter_Amount[c(1:9)], as.numeric)


Litter_Amount<-Litter_Amount %>% rename(Dry.weight=V3) %>% rename(Ca=V4) %>% rename(Mg=V5) %>%
  rename(K=V6) %>% rename(N=V7) %>% rename(P= V8) %>%
  rename(S= V9)%>% rename(Date=V1)


Litter_Amount<- Litter_Amount%>% filter(!is.na(Date))



write.csv2(Litter_Pool, "Litter_Pool.csv")
write.csv2(Litter_Amount, "Litter_Fall.csv")