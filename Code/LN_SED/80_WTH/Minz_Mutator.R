# Mineralization Mutator

rm(list = ls())


setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)
library(janitor)

Bio_Cycle<-read.csv2("~/NutsForSEDLN/80_WTH/Output data/Budgets/Biological cycle.csv")

Bio_Cycle2<-Bio_Cycle %>% rename(N_UP='Total.Uptake.kg.ha.yr', Ca_UP='X', Mg_UP='X.1', K_UP='X.2', S_UP='X.3', P_UP='X.4',
                    N_LF='Litterfall.kg.ha.yr', Ca_LF='X.5',Mg_LF='X.6', K_LF='X.7', S_LF='X.8', P_LF='X.9',
                    N_Minz='Litter.mineralisation.kg.ha.yr', Ca_Minz='X.10', Mg_Minz='X.11', K_Minz='X.12', S_Minz='X.13',
                    P_Minz='X.14', N_SOMZ='SOM.mineralisation.kg.ha.yr', Ca_SOMZ='X.15', Mg_SOMZ='X.16', K_SOMZ='X.17', S_SOMZ='X.18',
                    P_SOMZ='X.19')

Bio_Cycle3<-Bio_Cycle2 %>% mutate_if(is.character,as.numeric) %>% select(-X.20)

Bio_Cycle_Final<-drop_na(Bio_Cycle3)

Bio_Cycle_Final$N_MinSUM<-Bio_Cycle_Final$N_Minz+Bio_Cycle_Final$N_SOMZ
Bio_Cycle_Final$P_MinSUM<-Bio_Cycle_Final$P_Minz+Bio_Cycle_Final$P_SOMZ
Bio_Cycle_Final$S_MinSUM<-Bio_Cycle_Final$S_Minz+Bio_Cycle_Final$S_SOMZ

write.csv2(Bio_Cycle_Final, "Bio_Cycle.csv")