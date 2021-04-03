#---------------------#
#Sensitivity Analysis#
#$---Tree Biomass---$#
#%---Exchangerangeable Pool---%#
#--------------------#

rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)

# Update

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Maximum/Exchanger/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Maximum/Exchanger/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Maximum/Exchanger/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Maximum/Exchanger/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Minimum/Exchanger/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Minimum/Exchanger/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Minimum/Exchanger/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Minimum/Exchanger/TreeNut_Mutator.R")

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")

Df_Originals<-read.csv("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/All_Biomass.csv", sep=";")


# Maximum

Mine_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

Mine_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

Mine_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

Mine_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Ex/Upper/Tree_Nut_All.csv")

LNSED_Mine_Max<-Mine_10_Plus_LNSED %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Mine_Max1<-sum(LNSED_Mine_Max$DW_Bol, LNSED_Mine_Max$DW_Brh,LNSED_Mine_Max$DW_Brk, LNSED_Mine_Max$DW_F)

HNSED_Mine_Max<-Mine_10_Plus_HNSED %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Mine_Max1<-sum(HNSED_Mine_Max$DW_Bol, HNSED_Mine_Max$DW_Brh,HNSED_Mine_Max$DW_Brk, HNSED_Mine_Max$DW_F)

LNBAS_Mine_Max<-Mine_10_Plus_LNBAS %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Mine_Max1<-sum(LNBAS_Mine_Max$DW_Bol, LNBAS_Mine_Max$DW_Brh,LNBAS_Mine_Max$DW_Brk, LNBAS_Mine_Max$DW_F)

HNBAS_Mine_Max<-Mine_10_Plus_HNBAS %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Mine_Max1<-sum(HNBAS_Mine_Max$DW_Bol, HNBAS_Mine_Max$DW_Brh,HNBAS_Mine_Max$DW_Brk, HNBAS_Mine_Max$DW_F)
# Minimum

Mine_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Ex/Lower/Tree_Nut_All.csv")

Mine_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Ex/Lower/Tree_Nut_All.csv")

Mine_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Ex/Lower/Tree_Nut_All.csv")

Mine_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Ex/Lower/Tree_Nut_All.csv")

LNSED_Mine_Min<-Mine_10_Minus_LNSED %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Mine_Min1<-sum(LNSED_Mine_Min$DW_Bol, LNSED_Mine_Min$DW_Brh,LNSED_Mine_Min$DW_Brk, LNSED_Mine_Min$DW_F)

HNSED_Mine_Min<-Mine_10_Minus_HNSED %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Mine_Min1<-sum(HNSED_Mine_Min$DW_Bol, HNSED_Mine_Min$DW_Brh,HNSED_Mine_Min$DW_Brk, HNSED_Mine_Min$DW_F)

LNBAS_Mine_Min<-Mine_10_Minus_LNBAS %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Mine_Min1<-sum(LNBAS_Mine_Min$DW_Bol, LNBAS_Mine_Min$DW_Brh,LNBAS_Mine_Min$DW_Brk, LNBAS_Mine_Min$DW_F)

HNBAS_Mine_Min<-Mine_10_Minus_HNBAS %>% 
  filter(YEAR %in%  c("2025" , "2068", "2498" , "2154" , "2197" , "2240" , "2283" , "2326" , "2369" , "2412" , "2455") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Mine_Min1<-sum(HNBAS_Mine_Min$DW_Bol, HNBAS_Mine_Min$DW_Brh,HNBAS_Mine_Min$DW_Brk, HNBAS_Mine_Min$DW_F)


# Percent difference is 100*(Final-IExchangerial/iExchangerial)

PerChange_LNSED_Min<-Diff(LN_SED_Mine_Min1, Df_Originals$BO_40_LNSED_SUM)
PerChange_HNSED_Min<-Diff(HN_SED_Mine_Min1, Df_Originals$BO_40_HNSED_SUM)
PerChange_LNBAS_Min<-Diff(LN_BAS_Mine_Min1, Df_Originals$BO_40_LNBAS_SUM)
PerChange_HNBAS_Min<-Diff(HN_BAS_Mine_Min1, Df_Originals$BO_40_HNBAS_SUM)

PerChange_LNSED_Max<-Diff(LN_SED_Mine_Max1, Df_Originals$BO_40_LNSED_SUM)
PerChange_HNSED_Max<-Diff(HN_SED_Mine_Max1, Df_Originals$BO_40_HNSED_SUM)
PerChange_LNBAS_Max<-Diff(LN_BAS_Mine_Max1, Df_Originals$BO_40_LNBAS_SUM)
PerChange_HNBAS_Max<-Diff(HN_BAS_Mine_Max1, Df_Originals$BO_40_HNBAS_SUM)

PerChange_Df<-cbind(PerChange_LNSED_Min, PerChange_HNSED_Min,PerChange_LNBAS_Min,PerChange_HNBAS_Min,PerChange_LNSED_Max,PerChange_HNSED_Max,
                    PerChange_LNBAS_Max,PerChange_HNBAS_Max)
PerChange_Df<-as.data.frame(PerChange_Df)

PerChange_Df<-na.omit(PerChange_Df)


X<-melt(PerChange_Df)

X$Inc<-c("Lower", "Lower", "Lower", "Lower",
         "Upper", "Upper", "Upper", "Upper")

X$Site<-c("LN SED", "HN SED",
          "LN BAS", "HN BAS")

# Reorder Factorv



Y<-as.data.frame(X)

Y$Site <- factor(Y$Site,levels = c("LN SED", "HN SED", "LN BAS", "HN BAS"))


G<-ggplot(Y, aes(x=factor(Site), y=value, fill=Inc))+geom_col(position = "dodge", width=.75)+
  theme_bw()+
  labs(x="Exchangeable Pool % Change", y="Percent Difference from Original", fill="Increment")+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"))+
  theme(legend.position = c(0.925, 0.85))


png("Bio_Ex.png", width=1000, height=500, res=115)
plot(G)
dev.off()