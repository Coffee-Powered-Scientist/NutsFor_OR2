#---------------------#
#Sensitivity Analysis#
#$---Tree Biomass---$#
#%---Nitrification---%#
#--------------------#

rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)

# Update Base Sites, Use Sens_Updater.R seperate to update Sens files!
source("~/Project_Master/Test_Rep/Code/LN_SED/Base/TreeNut_LN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/Base/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

# Original

Orig_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Tree_Nut_All.csv")

Orig_LNSED<-Orig_LNSED %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

Orig_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Edited Data/Tree_Nut_All.csv")

Orig_HNSED<-Orig_HNSED %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

Orig_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Edited Data/Tree_Nut_All.csv")

Orig_LNBAS<-Orig_LNBAS %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

Orig_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_BAS/Edited Data/Tree_Nut_All.csv")

Orig_HNBAS<-Orig_HNBAS %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

# Maximum

Nit_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Sens/Nit/Lower/Tree_Nut_All.csv")

Nit_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Sens/Nit/Lower/Tree_Nut_All.csv")

Nit_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Sens/Nit/Lower/Tree_Nut_All.csv")

Nit_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_BAS/Sens/Nit/Lower/Tree_Nut_All.csv")

LNSED_Nit_Max<-Nit_10_Plus_LNSED %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

HNSED_Nit_Max<-Nit_10_Plus_HNSED %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

LNBAS_Nit_Max<-Nit_10_Plus_LNBAS %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

HNBAS_Nit_Max<-Nit_10_Plus_HNBAS %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

# Minimum

Nit_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Sens/Nit/Lower/Tree_Nut_All.csv")

Nit_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Sens/Nit/Lower/Tree_Nut_All.csv")

Nit_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Sens/Nit/Lower/Tree_Nut_All.csv")

Nit_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_BAS/Sens/Nit/Lower/Tree_Nut_All.csv")

LNSED_Nit_Min<-Nit_10_Minus_LNSED %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

HNSED_Nit_Min<-Nit_10_Minus_HNSED %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

LNBAS_Nit_Min<-Nit_10_Minus_LNBAS %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

HNBAS_Nit_Min<-Nit_10_Minus_HNBAS %>% filter(YEAR %in% 2500 & Month %in% 12) %>% select(DW_Bol)

# Percent difference is 100*(Final-Initial/initial)

PerChange_LNSED_Min<-Diff(LNSED_Nit_Min$DW_Bol, Orig_LNSED$DW_Bol)
PerChange_HNSED_Min<-Diff(HNSED_Nit_Min$DW_Bol, Orig_HNSED$DW_Bol)
PerChange_LNBAS_Min<-Diff(LNBAS_Nit_Min$DW_Bol, Orig_LNBAS$DW_Bol)
PerChange_HNBAS_Min<-Diff(HNBAS_Nit_Min$DW_Bol, Orig_HNBAS$DW_Bol)

PerChange_LNSED_Max<-Diff(LNSED_Nit_Max$DW_Bol, Orig_LNSED$DW_Bol)
PerChange_HNSED_Max<-Diff(HNSED_Nit_Max$DW_Bol, Orig_HNSED$DW_Bol)
PerChange_LNBAS_Max<-Diff(LNBAS_Nit_Max$DW_Bol, Orig_LNBAS$DW_Bol)
PerChange_HNBAS_Max<-Diff(HNBAS_Nit_Max$DW_Bol, Orig_HNBAS$DW_Bol)

PerChange_Df<-cbind(PerChange_LNSED_Min, PerChange_HNSED_Min,PerChange_LNBAS_Min,PerChange_HNBAS_Min,PerChange_LNSED_Max,PerChange_HNSED_Max,
                    PerChange_LNBAS_Max,PerChange_HNBAS_Max)

X<-melt(PerChange_Df)

# Reorder Factorv

Y<-as.data.frame(X)
Y$Var2 <- factor(Y$Var2,levels = c("PerChange_LNSED_Min", "PerChange_LNSED_Max",
                                   "PerChange_HNSED_Min", "PerChange_HNSED_Max", 
                                   "PerChange_LNBAS_Min", "PerChange_LNBAS_Max",
                                   "PerChange_HNBAS_Min", "PerChange_HNBAS_Max"))

G<-ggplot(Y, aes(x=Var2, y=value))+geom_col()+scale_x_discrete(labels=c("PerChange_LNSED_Min"="LN SED -10%", "PerChange_LNSED_Max"="LN SED +10%",
                                                                        "PerChange_HNSED_Min"="HN SED -10%", "PerChange_HNSED_Max"="HN SED +10%", 
                                                                        "PerChange_LNBAS_Min"="LN BAS -10%", "PerChange_LNBAS_Max"="LN BAS +10%",
                                                                        "PerChange_HNBAS_Min"="HN BAS -10%", "PerChange_HNBAS_Max"="HN BAS +10%"))+
  theme_bw()+
  labs(x="Sensitivity Scenario", y="Percent Difference from Original")

png("Bio_Nit.png", width=1000, height=500, res=115)
plot(G)
dev.off()
