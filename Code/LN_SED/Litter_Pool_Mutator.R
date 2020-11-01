

###Total Litter Pool Script
library(dplyr)
library(lubridate)

rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data")

Litter_Pool<-read.csv2("~/NutsForSEDLN/Output data/Litter/Litter pool kg_ha data.csv")

Litter_Pool<- Litter_Pool %>% select(c(1:9)) %>% row_to_names(row_number = 1) %>%  
  mutate(Date = make_date(YEAR, Month)) %>% rename(Ca=`Ca kg/ha`) %>% rename(Mg=`Mg kg/ha`) %>%
  rename(C=`C kg/ha`) %>% rename(K=`K kg/ha`) %>% rename(N=`N kg/ha`) %>% rename(P= `P kg/ha`) %>%
  rename(S= `S kg/ha`)

Litter_Pool[c(3:9)]<-lapply(Litter_Pool[c(3:9)], as.numeric)

write.csv2(Litter_Pool, "Litter_Pool.csv")