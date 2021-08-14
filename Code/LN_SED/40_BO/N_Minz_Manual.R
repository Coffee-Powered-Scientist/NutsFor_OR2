
rm(list = ls())


setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)
library(janitor)


YEAR<-seq(2005, 2529, 1)


# SOM




SOM_Pre<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/SOM.csv")

SOM_SUM<-SOM_Pre %>% group_by(Year, Month) %>%
    summarise(across(C:P, ~sum(.x, na.rm=TRUE)))

SOM_1_12<-SOM_SUM %>% filter(Month %in% c(1,12))

SOM_1<- SOM_1_12 %>%  filter(Month %in% 1)

SOM_12<- SOM_1_12 %>% filter(Month %in% 12)

SOM_Minz<-(SOM_12-SOM_1)


# Litter

Litter_Pre <- read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Litter_Pool.csv")

Litter_SUM<-Litter_Pre %>% group_by(YEAR, Month) %>%
  summarise(across(C:P, ~sum(.x, na.rm=TRUE)))

Litter_1_12<-Litter_SUM %>% filter(Month %in% c(1,12))

Litter_1<- Litter_1_12 %>%  filter(Month %in% 1)

Litter_12<- Litter_1_12 %>% filter(Month %in% 12)

Litter_Minz<-(Litter_12-Litter_1)


# manz stands for manual mineralization, can add other elements if desired, although N is really the only one necesary 


N_Manz<-(Litter_Minz$N+ SOM_Minz$N*10/14)*-1
P_Manz<-(Litter_Minz$P+ SOM_Minz$P*10/30.97)*-1

N_Mineralization<-as.data.frame(N_Manz)
N_Mineralization$YEAR<-YEAR


write.csv2(N_Mineralization, "N_Minz.csv", row.names=TRUE)