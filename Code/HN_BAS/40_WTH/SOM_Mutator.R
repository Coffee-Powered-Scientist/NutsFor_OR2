rm(list = ls())


setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)

#Reads all files in folder at once, then 
files <- list.files(path = "~/NutsforBASHN/40_WTH/Output data/SOM", pattern = "SOM", full.names = TRUE)
SOM<- sapply(files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")


SOM_Min<-read.csv2("~/NutsforBASHN/40_WTH/Output data/SOM/OM mineralization.csv")

SOM_Min<-SOM_Min  %>% 
  rename(Litter_N_Min = 3, Litter_Ca_Min = 4, Litter_Mg_Min= 5, Litter_K_Min=6, Litter_S_Min=7, 
         Litter_P_Min=8, SOM_N_Min=9, SOM_Ca_Min=10, SOM_Mg_Min=11, SOM_K_Min=12, SOM_S_Min=13, 
         SOM_P_Min=14, MB_NUP_SOM=15, MB_CaUP_SOM= 16, MB_MgUP_SOM=17, MB_KUP_SOM=18,  MB_SUP_SOM=19,  MB_PUP_SOM=20,MB_NUP_DOC=21, MB_CaUP_DOC= 22, MB_MgUP_DOC= 23, 
         MB_KUP_DOC=24,  MB_SUP_DOC=25,  MB_PUP_DOC=26,  MB_NT=27, MB_CaT=28, MB_MgT=29, MB_KT=30, MB_ST=31, MB_PT=32)

SOM_Min[1:32]<-lapply(SOM_Min[1:32], as.numeric)

SOM_Min$Net_N_Minz<-(SOM_Min$Litter_N_Min+SOM_Min$SOM_N_Min-SOM_Min$MB_NUP_DOC)*14*.01
SOM_Min$Net_P_Minz<-(SOM_Min$Litter_P_Min+SOM_Min$SOM_P_Min-SOM_Min$MB_PUP_DOC)*30.97*.01
SOM_Min$Net_Ca_Minz<-(SOM_Min$Litter_Ca_Min+SOM_Min$SOM_Ca_Min-SOM_Min$MB_CaUP_DOC)*40.076*.01
SOM_Min$Net_K_Minz<-(SOM_Min$Litter_K_Min+SOM_Min$SOM_K_Min-SOM_Min$MB_KUP_DOC)*39.098*.01
SOM_Min$Net_Mg_Minz<-(SOM_Min$Litter_Mg_Min+SOM_Min$SOM_Mg_Min-SOM_Min$MB_MgUP_DOC)*24.305*.01
SOM_Min$Net_S_Minz<-(SOM_Min$Litter_S_Min+SOM_Min$SOM_S_Min-SOM_Min$MB_SUP_DOC)*32.06*.01

SOM_Min<-SOM_Min %>% group_by(YEAR) %>% summarise(across(Litter_N_Min:Net_S_Minz, ~sum(.x, na.rm = TRUE)))


#The below codes don't like being thrown into a function (x) type arguement, likely because lapply is a loop 
#(although, I'm not sure what's wrong with the indexing)
SOM[,c(2, 4:21)] <- lapply(SOM[,c(2, 4:21)], as.numeric)


SOM<- SOM %>%
  mutate(Date = make_date(V1, V2))

SOM$group_id <- SOM %>% 
  group_by(id)%>%
  group_indices(id) 

SOM$group_id<-as.factor(SOM$group_id)

SOM_Mut<- SOM %>%
  mutate(group_id=recode_factor(group_id, '1'='Layer 1' , '2'='Layer 2' , 
                                '3'='Layer 3' , '4'='Layer 4', '5'='Layer 5', '6'='Layer 6', 
                                '7'='Layer 7', '8'='Layer 8'))%>% group_by(V1, group_id, V2) %>%
  rename(C= 'V3') %>% rename(N='V4') %>%rename(Ca= 'V5') %>% rename(Mg= 'V6') %>%
  rename(K= 'V7') %>% rename(S= 'V8') %>%
  rename(P= 'V9')  %>% rename(MB_N= 'V18')  %>% rename(Year=V1, Month=V2) %>%
  select(C, N, Ca, Mg, K, S, P , MB_N,Date)


SOM_Mut<-na.omit(SOM_Mut)



write.csv2(SOM_Mut, "SOM.csv", row.names=TRUE)
write.csv2(SOM_Min, "SOM_Min.csv", row.names=TRUE)

