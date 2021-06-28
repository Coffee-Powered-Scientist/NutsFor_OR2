rm(list = ls())


library(dplyr)
library(lubridate)
library(ggplot2)

### Plant Pool Script ###

setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data")


source("~/Project_Master/Test_Rep/Code/Functions/Uptake_Diff.R")

Plant_Pool<-read.csv2("~/Ghost_Simulations/NutsForSEDLN/40_WTH/Output data/Biomass/Plant pool.csv", header=FALSE)

Plant_Pool[c(1:32)]<-lapply(Plant_Pool[c(1:32)], as.numeric)

Plant_Pool<-na.omit(Plant_Pool)

Plant_Pool<-Plant_Pool %>% rename (Year="V1", Month="V2", NG_PP="V3", CaG_PP="V4", MgG_PP="V5", KG_PP="V6", SG_PP="V7", PG_PP="V8",
                                   NG_PU="V9", CaG_PU="V10", MgG_PU="V11", KG_PU="V12", SG_PU="V13", PG_PU="V14", NG_AU="V15", CaG_AU="V16",
                                   MgG_AU="V17", KG_AU="V18", SG_AU="V19", PG_AU="V20") %>%
  select(Year:PG_AU) %>%
  group_by(Year) %>%
  summarise(across(NG_PP:PG_AU, ~sum(.x, na.rm=TRUE)))


Plant_Pool$NG_Diff<-Uptake_Diff(Plant_Pool$NG_PU, Plant_Pool$NG_AU)
Plant_Pool$CaG_Diff<-Uptake_Diff(Plant_Pool$CaG_PU, Plant_Pool$CaG_AU)
Plant_Pool$MgG_Diff<-Uptake_Diff(Plant_Pool$MgG_PU, Plant_Pool$MgG_AU)
Plant_Pool$KG_Diff<-Uptake_Diff(Plant_Pool$KG_PU, Plant_Pool$KG_AU)
Plant_Pool$SG_Diff<-Uptake_Diff(Plant_Pool$SG_PU, Plant_Pool$SG_AU)
Plant_Pool$PG_Diff<-Uptake_Diff(Plant_Pool$PG_PU, Plant_Pool$PG_AU)

write.csv2(Plant_Pool, "Plant_Pool_Ghost.csv")