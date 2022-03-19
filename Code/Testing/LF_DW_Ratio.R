
# Find ratio between litterfall and canopy biomass each year

rm(list = ls())

# Source Code

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Litter_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Litter_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Litter_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/TreeNut_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Litter_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/TreeNut_Mutator.R")

setwd("~/NutsFor_Meeting")

library(ggplot2)
library(dplyr)
library(lubridate)
library(reshape2)


LNS_Biomass<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")
LNS_Litterfall<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Litter_Fall.csv")

HNS_Biomass<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")
HNS_Litterfall<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Litter_Fall.csv")

LNB_Biomass<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")
LNB_Litterfall<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Litter_Fall.csv")

HNB_Biomass<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")
HNB_Litterfall<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Litter_Fall.csv")

LNS_Ratio<-LNS_Litterfall$Dry.weight/LNS_Biomass$DW_F
HNS_Ratio<-HNS_Litterfall$Dry.weight/HNS_Biomass$DW_F
LNB_Ratio<-LNB_Litterfall$Dry.weight/LNB_Biomass$DW_F
HNB_Ratio<-HNB_Litterfall$Dry.weight/HNB_Biomass$DW_F

Ratios<-as.data.frame(cbind(LNS_Ratio, HNS_Ratio, LNB_Ratio, HNB_Ratio))

Ratios$Year<-LNB_Litterfall$Year
Ratios$Month<-LNB_Litterfall$Month

Ratios<-Ratios %>% group_by(Year) %>% summarize(across(LNS_Ratio:HNB_Ratio, ~sum(.x, na.rm=TRUE)))


LNS<-ggplot(Ratios, aes(x=Year, y=LNS_Ratio, color="LNS_Ratio"))+geom_line()+ ylim(0, 3)+ 
  scale_y_continuous(breaks=c(0, .25, .5, .75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5))+
  labs(y="LNS LF:Canopy Biomass")

HNS<-ggplot(Ratios, aes(x= Year, y=HNS_Ratio, color="HNS_Ratio")) +geom_line() + ylim(0, 3)+ 
  scale_y_continuous(breaks=c(0, .25, .5, .75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5))+
  labs(y="HNS LF:Canopy Biomass")

LNB<-ggplot(Ratios, aes(x=Year, y=LNB_Ratio, color="LNB_Ratio"))+geom_line() + ylim(0, 3)+ 
  scale_y_continuous(breaks=c(0, .25, .5, .75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5))+
  labs(y="LNB LF:Canopy Biomass")

HNB<-ggplot(Ratios, aes(x= Year, y=HNB_Ratio, color="HNB_Ratio"))+geom_line() + ylim(0, 3)+ 
  scale_y_continuous(breaks=c(0, .25, .5, .75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5))+
  labs(y="HNB LF:Canopy Biomass")

png(filename="LNS_Ratio.png", height = 500, width= 1000, res= 90)
plot(LNS)
dev.off()

png(filename="HNS_Ratio.png", height = 500, width= 1000, res= 90)
plot(HNS)
dev.off()

png(filename="LNB_Ratio.png", height = 500, width= 1000, res= 90)
plot(LNB)
dev.off()

png(filename="HNB_Ratio.png", height = 500, width= 1000, res= 90)
plot(HNB)
dev.off()
