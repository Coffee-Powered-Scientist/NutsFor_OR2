
#Reads monthly hydrology file

rm(list = ls())


library(dplyr)
library(ggplot2)
library(lubridate)

setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data")

Hydro<-read.csv2("~/NutsForSEDLN/Base/Output data/Hydrology/Hydrology Monthly Output.csv")

Hydro<-Hydro %>% rename(Year="X", Month="X.1", RF="X.2", PET="X.3", AET="X.4", TF="X.5", In="X.6", SM_L1="Soil.Moisture", SM_L2="X.7",
                        SM_L3="X.8", SM_L4="X.9", SM_L5="X.10", SM_L6="X.11", SM_L7="X.12", SM_L8="X.13")

Hydro_X<-Hydro[c(1:7)]

Hydro_X[c(1:7)]<-lapply(Hydro_X[c(1:7)], as.numeric)

Hydro_X<-na.omit(Hydro_X)

Hydro_X<-Hydro_X %>%
  mutate(Date=make_date(Year, Month))


write.csv2(Hydro_X, "Hydrology.csv")

