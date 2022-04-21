rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)

#Reads all files in folder at once, then 
files <- list.files(path = "~/NutsforSEDLN/40_BO/Output data/SOM", pattern = "*.csv", full.names = TRUE)

files<-files[-c(1)]

SOM<- sapply(files, read.csv2, simplify=FALSE) %>% 
  bind_rows(.id = "id")

#The below codes don't like being thrown into a function (x) type arguement, likely because lapply is a loop 
#(although, I'm not sure what's wrong with the indexing)
SOM[,c(3:21)] <- lapply(SOM[,c(3:21)], as.numeric)


SOM<- SOM %>%
  mutate(Date = make_date(YEAR, Month))

SOM$group_id <- SOM %>% 
  group_by(id)%>%
  group_indices(id) 

SOM_Mut<- SOM %>%
 group_by(YEAR, group_id, Month) %>%
  rename(C= 'C.mol.m²') %>% rename(N='N.mol.m²') %>%rename(Ca= 'Ca.mol.m²') %>% rename(Mg= 'Mg.mol.m²') %>%
  rename(K= 'K.mol.m²') %>% rename(S= 'S.mol.m²') %>%
  rename(P= 'P.mol.m²') %>% rename(Year=YEAR) %>%
  select(C, N, Ca, Mg, K, S, P, Date)


write.csv2(SOM_Mut, "SOM.csv", row.names=TRUE)

