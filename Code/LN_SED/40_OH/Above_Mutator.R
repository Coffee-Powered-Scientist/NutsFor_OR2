

rm(list = ls())


setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_OH/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)
library(janitor)

Abov_Cycle<-read.csv2("~/NutsForSEDLN/40_OH/Output data/Budgets/Above ground fluxes.csv")

Abov<-Abov_Cycle %>% rename(N_WET='X.4', Ca_WET='Wet.Deposition.kg.ha.yr', Mg_WET='X', K_WET='X.1', S_WET='X.5',
                                  Ca_THRU='Net.Foliar.exhanges.kg.ha.yr', Mg_THRU='X.36', K_THRU='X.37', N_THRU='X.40', 
                                  S_THRU='X.41', Ca_WTH='Weathering.flux.kg.ha.yr', Mg_WTH='X.63', K_WTH='X.64', P_WTH='X.68')

Abov<-Abov %>% mutate_if(is.character,as.numeric) %>% select(-X.69)

Abov<-drop_na(Abov)



write.csv2(Abov, "Abov_Flux.csv")