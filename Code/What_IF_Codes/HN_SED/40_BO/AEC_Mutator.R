#AEC Mutator File, reads all files in AEC output directory and ranks them by layer

rm(list = ls())

library(dplyr)
library(lubridate)

setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data")

files <- list.files(path = "~/NutsforSEDHN/40_BO/Output data/AEC", pattern = "AEC", full.names = TRUE)

AEC_All<- sapply(files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")

AEC_All[c(2:9)]<-lapply(AEC_All[c(2:9)], as.numeric)

AEC_All$group_id <- AEC_All %>% 
  group_by(id)%>%
  group_indices(id)

#Only want kg/ha, get rid of umol/kg units
AEC_All<-AEC_All[-c(4:6)]

AEC_All<-AEC_All %>% rename(Year=V1, Month=V2, SO4=V6, PO4=V7, Cl=V8) %>% filter(!is.na(Year))

AEC_All<-AEC_All %>% mutate(Date=make_date(Year, Month)) %>% select(-Year, -Month, -id)

AEC_All$group_id<-as.factor(AEC_All$group_id)


write.csv2(AEC_All, "AEC_All.csv")