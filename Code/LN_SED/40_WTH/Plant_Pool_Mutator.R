rm(list = ls())


library(dplyr)
library(lubridate)
library(ggplot2)

### Plant Pool Script ###

setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data")


source("~/Project_Master/Test_Rep/Code/Functions/Uptake_Diff.R")

Plant_Pool<-read.csv2("~/NutsForSEDLN/40_WTH/Output data/Biomass/Plant pool.csv", header=FALSE)

Plant_Pool[c(1:32)]<-lapply(Plant_Pool[c(1:32)], as.numeric)

Plant_Pool<-na.omit(Plant_Pool)

Plant_Pool<-Plant_Pool %>% rename (Year="V1", Month="V2", N_PP="V3", Ca_PP="V4", Mg_PP="V5", K_PP="V6", S_PP="V7", P_PP="V8",
                                   N_PU="V9", Ca_PU="V10", Mg_PU="V11", K_PU="V12", S_PU="V13", P_PU="V14", N_AU="V15", Ca_AU="V16",
                                   Mg_AU="V17", K_AU="V18", S_AU="V19", P_AU="V20") %>%
  select(Year:P_AU) %>%
  group_by(Year) %>%
  summarise(across(N_PP:P_AU, ~sum(.x, na.rm=TRUE)))


Plant_Pool$N_Diff<-Uptake_Diff(Plant_Pool$N_PU, Plant_Pool$N_AU)
Plant_Pool$Ca_Diff<-Uptake_Diff(Plant_Pool$Ca_PU, Plant_Pool$Ca_AU)
Plant_Pool$Mg_Diff<-Uptake_Diff(Plant_Pool$Mg_PU, Plant_Pool$Mg_AU)
Plant_Pool$K_Diff<-Uptake_Diff(Plant_Pool$K_PU, Plant_Pool$K_AU)
Plant_Pool$S_Diff<-Uptake_Diff(Plant_Pool$S_PU, Plant_Pool$S_AU)
Plant_Pool$P_Diff<-Uptake_Diff(Plant_Pool$P_PU, Plant_Pool$P_AU)

write.csv2(Plant_Pool, "Plant_Pool.csv")