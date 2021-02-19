## 40_WTH BITCH

## This code generates figures for AVERAGE nutrient fluxes (per roation)

# Update Output

source("~/Project_Master/Test_Rep/Code/LN_BAS/40_WTH/Analysis_1_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_WTH/Analysis_1_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_WTH/Analysis_1_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_WTH/Analysis_1_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_WTH/Soil_Soln_LN_BAS_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_WTH/Soil_Soln_HN_BAS_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_WTH/Soil_Soln_LN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_WTH/Soil_Soln_HN_SED_Mutator.R")

# Source codes



rm(list = ls())

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_WTH")


# Load necessary libraries
library(dplyr)
library(ggplot2)


# HN BAS File Read

Cal_Pretable_Parent_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_LL_HNB<-Cal_Pretable_Parent_HNB %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
Cal_Pretable_LL_HNB$group_id<-as.character(Cal_Pretable_LL$group_id)


Cal_Pretable_LL_Yr_HNB<-Cal_Pretable_LL_HNB %>% group_by(group_id) %>% summarise(across(Ca:HR, ~mean(.x, na.rm=TRUE)))
Cal_Pretable_LL_1M_HNB<-Cal_Pretable_LL_HNB %>% filter(group_id %in% c("8")) %>% summarize(across(Ca:HR, ~mean(.x, na.rm = TRUE)))

Analysis_1_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Analysis_1.csv", header=TRUE)
Analysis_1_HNB<- Analysis_1_HNB %>% summarize(across(Ca_Wet:P_SOM_Min, ~mean(.x, na.rm = TRUE)))

Analysis_Bound_HNB<- cbind(Cal_Pretable_LL_1M_HNB, Analysis_1_HNB)


