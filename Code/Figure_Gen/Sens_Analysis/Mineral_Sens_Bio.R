
#---------------------#
#Sensitivity Analysis#
#$---Tree Biomass---$#
#%---Mineral Area---%#
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

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Maximum/Mineral/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Maximum/Mineral/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Maximum/Mineral/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Maximum/Mineral/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Minimum/Mineral/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Minimum/Mineral/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Minimum/Mineral/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Minimum/Mineral/TreeNut_Mutator.R")

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")
source("~/Project_Master/Test_Rep/Code/Functions/Sens_Coeff.R")

Df_Originals<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/All_Biomass.csv")


# Maximum

Mine_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

Mine_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

Mine_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

Mine_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Min/Upper/Tree_Nut_All.csv")

LNSED_Mine_Max<-Mine_10_Plus_LNSED %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Mine_Max1<-sum(LNSED_Mine_Max$DW_Bol, LNSED_Mine_Max$DW_Brh,LNSED_Mine_Max$DW_Brk, LNSED_Mine_Max$DW_F)

HNSED_Mine_Max<-Mine_10_Plus_HNSED %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Mine_Max1<-sum(HNSED_Mine_Max$DW_Bol, HNSED_Mine_Max$DW_Brh,HNSED_Mine_Max$DW_Brk, HNSED_Mine_Max$DW_F)

LNBAS_Mine_Max<-Mine_10_Plus_LNBAS %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Mine_Max1<-sum(LNBAS_Mine_Max$DW_Bol, LNBAS_Mine_Max$DW_Brh,LNBAS_Mine_Max$DW_Brk, LNBAS_Mine_Max$DW_F)

HNBAS_Mine_Max<-Mine_10_Plus_HNBAS %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Mine_Max1<-sum(HNBAS_Mine_Max$DW_Bol, HNBAS_Mine_Max$DW_Brh,HNBAS_Mine_Max$DW_Brk, HNBAS_Mine_Max$DW_F)
# Minimum

Mine_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Min/Lower/Tree_Nut_All.csv")

Mine_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Min/Lower/Tree_Nut_All.csv")

Mine_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Min/Lower/Tree_Nut_All.csv")

Mine_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Min/Lower/Tree_Nut_All.csv")

LNSED_Mine_Min<-Mine_10_Minus_LNSED %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_SED_Mine_Min1<-sum(LNSED_Mine_Min$DW_Bol, LNSED_Mine_Min$DW_Brh,LNSED_Mine_Min$DW_Brk, LNSED_Mine_Min$DW_F)

HNSED_Mine_Min<-Mine_10_Minus_HNSED %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_SED_Mine_Min1<-sum(HNSED_Mine_Min$DW_Bol, HNSED_Mine_Min$DW_Brh,HNSED_Mine_Min$DW_Brk, HNSED_Mine_Min$DW_F)

LNBAS_Mine_Min<-Mine_10_Minus_LNBAS %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

LN_BAS_Mine_Min1<-sum(LNBAS_Mine_Min$DW_Bol, LNBAS_Mine_Min$DW_Brh,LNBAS_Mine_Min$DW_Brk, LNBAS_Mine_Min$DW_F)

HNBAS_Mine_Min<-Mine_10_Minus_HNBAS %>% 
  filter(YEAR %in%  c("2025" , "2067", "2109" , "2151" , "2193" , "2235" , "2277" , "2319" , "2361" , "2403", "2445", "2487") & Month %in% 8) %>% 
  select(DW_Bol, DW_F, DW_Brh, DW_Brk)

HN_BAS_Mine_Min1<-sum(HNBAS_Mine_Min$DW_Bol, HNBAS_Mine_Min$DW_Brh,HNBAS_Mine_Min$DW_Brk, HNBAS_Mine_Min$DW_F)


# Percent difference is 100*(Final-Initial/initial)

PerChange_LNSED_Min<-Diff(LN_SED_Mine_Min1, Df_Originals$BO_40_LNSED_SUM)
PerChange_HNSED_Min<-Diff(HN_SED_Mine_Min1, Df_Originals$BO_40_HNSED_SUM)
PerChange_LNBAS_Min<-Diff(LN_BAS_Mine_Min1, Df_Originals$BO_40_LNBAS_SUM)
PerChange_HNBAS_Min<-Diff(HN_BAS_Mine_Min1, Df_Originals$BO_40_HNBAS_SUM)

PerChange_LNSED_Max<-Diff(LN_SED_Mine_Max1, Df_Originals$BO_40_LNSED_SUM)
PerChange_HNSED_Max<-Diff(HN_SED_Mine_Max1, Df_Originals$BO_40_HNSED_SUM)
PerChange_LNBAS_Max<-Diff(LN_BAS_Mine_Max1, Df_Originals$BO_40_LNBAS_SUM)
PerChange_HNBAS_Max<-Diff(HN_BAS_Mine_Max1, Df_Originals$BO_40_HNBAS_SUM)

LNS_Min<-Sens_Coeff(LN_SED_Mine_Min1,Df_Originals$BO_40_LNSED_SUM, .5, 1)
LNS_Max<-Sens_Coeff(LN_SED_Mine_Max1,Df_Originals$BO_40_LNSED_SUM, 1.5, 1)
LNB_Min<-Sens_Coeff(LN_BAS_Mine_Min1,Df_Originals$BO_40_LNBAS_SUM, .5, 1)
LNB_Max<-Sens_Coeff(LN_BAS_Mine_Max1,Df_Originals$BO_40_LNBAS_SUM, 1.5, 1)
HNB_Min<-Sens_Coeff(HN_BAS_Mine_Min1,Df_Originals$BO_40_HNBAS_SUM, .5, 1)
HNB_Max<-Sens_Coeff(HN_BAS_Mine_Max1,Df_Originals$BO_40_HNBAS_SUM, 1.5, 1)
HNS_Max<-Sens_Coeff(HN_SED_Mine_Max1,Df_Originals$BO_40_HNSED_SUM, 1.5, 1)
HNS_Min<-Sens_Coeff(HN_SED_Mine_Min1,Df_Originals$BO_40_HNSED_SUM, 1.5, 1)

Sens_Coef_Tbl<-cbind(LNS_Min, LNS_Max, LNB_Min, LNB_Max,
                     HNB_Min, HNB_Max, HNS_Max, HNS_Min)

Sens_Coef_Tbl<-as.data.frame(Sens_Coef_Tbl)

Sens_Coef_Tbl$ID<-"Mineral"


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
Y$Sens<-"Min"
Y$Response<-"Bio"



Y$value2<-c(" ", " ", "", "*", " ", " ", " ", "NR")

Y$value2<-ifelse(abs(Y$value)<=1, "NR", " ")


G_BioMin<-ggplot(Y, aes(x=factor(Site), y=value, fill=Inc))+geom_col(position = "dodge", width=.75)+
  
  theme_bw()+
  labs(x="Atmospheric Deposition % Change", y="Percent Difference from Original", fill="Increment")+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"))+
  theme(legend.position = c(0.925, 0.85))+
  geom_text(aes(label =value2, y=2.5, color=Site), position = position_dodge(0.9), size=5, show.legend = FALSE)

png("Bio_Min.png", width=1000, height=500, res=115)
plot(G_BioMin)
dev.off()

write.csv2(Sens_Coef_Tbl, "Sens_Tbl_Mineral_Bio.csv")
write.csv2(Y, "Min_Bio.csv")
write.csv(PerChange_Df, "MinBio_Per.csv")