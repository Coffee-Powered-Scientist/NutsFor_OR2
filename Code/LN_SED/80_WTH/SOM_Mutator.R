rm(list = ls())


setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)

#Reads all files in folder at once, then 
files <- list.files(path = "~/NutsforSEDLN/80_WTH/Output data/SOM", pattern = "*.csv", full.names = TRUE)
SOM<- sapply(files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")


#The below codes don't like being thrown into a function (x) type arguement, likely because lapply is a loop 
#(although, I'm not sure what's wrong with the indexing)
SOM[,c(2, 4:21)] <- lapply(SOM[,c(2, 4:21)], as.numeric)


SOM<- SOM %>%
  mutate(Date = make_date(V1, V2))

SOM$group_id <- SOM %>% 
  group_by(id)%>%
  group_indices(id) 

SOM_Mut<- SOM %>%
  mutate(group_id=recode(group_id, '1'='Layer 1' , '2'='Layer 2' , 
                         '3'='Layer 3' , '4'='Layer 4', '5'='Layer 5', '6'='Layer 6', 
                         '7'='Layer 7', '8'='Layer 8'))%>% group_by(V1, group_id, V2) %>%
  rename(C= 'V3') %>% rename(N='V4') %>%rename(Ca= 'V5') %>% rename(Mg= 'V6') %>%
  rename(K= 'V7') %>% rename(S= 'V8') %>%
  rename(P= 'V9') %>% rename(Year=V1, Month=V2) %>%
  select(C, N, Ca, Mg, K, S, P ,Date)

SOM_Mut<-na.omit(SOM_Mut)



write.csv2(SOM_Mut, "SOM.csv", row.names=TRUE)

