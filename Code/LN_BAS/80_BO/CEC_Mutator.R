#CEC Mutator File, reads all files in CEC output directory and ranks them by layer

rm(list = ls())

library(dplyr)
library(lubridate)

setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data")

files <- list.files(path = "~/NutsforBASLN/80_BO/Output data/CEC", pattern = "CEC", full.names = TRUE)

CEC_All<- sapply(files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")

CEC_All[c(2:16)]<-lapply(CEC_All[c(2:16)], as.numeric)

CEC_All$group_id <- CEC_All %>% 
  group_by(id)%>%
  group_indices(id)

#Only want kg/ha, get rid of umol/kg units
CEC_All<-CEC_All[-c(4:10)]

CEC_All<-CEC_All %>% rename(Year=V1, Month=V2, Ca=V10, Mg=V11, K=V12, Na=V13, NH4=V14, Al=V15) %>% filter(!is.na(Year))

CEC_All<-CEC_All %>% mutate(Date=make_date(Year, Month)) %>% select(-Year, -Month, -id)

CEC_All$group_id<-as.factor(CEC_All$group_id)


write.csv2(CEC_All, "CEC_All.csv")
