#--------------------------#
#---Sensitivity Analysis---#
#$---Mineral Weathering---$#
#%------Exchangeable Pool------%#
#--------------------------#

rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)

# Update 40_WTH Sites, Use Sens_Updater.R seperate to update Sens files!
source("~/Project_Master/Test_Rep/Code/LN_SED/40_WTH/Weathering_LN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_WTH/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_WTH/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_WTH/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_WTH/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_WTH/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_WTH/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_WTH/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_WTH/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_WTH/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_WTH/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_WTH/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")


source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")

# SET WD

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

# Original

Orig_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data/Weathering_All.csv")

Orig_LNSED<-sum(Orig_LNSED$Ca, na.rm = TRUE)

Orig_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data/Weathering_All.csv")


Orig_HNSED<-sum(Orig_HNSED$Ca, na.rm = TRUE)

Orig_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Edited Data/Weathering_All.csv")

Orig_LNBAS<-sum(Orig_LNBAS$Ca, na.rm = TRUE)

Orig_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Weathering_All.csv")

Orig_HNBAS<-sum(Orig_HNBAS$Ca, na.rm = TRUE)

# Maximum

Mine_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Sens/Ex/Upper/Weathering_All.csv")

Mine_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Sens/Ex/Upper/Weathering_All.csv")

Mine_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Sens/Ex/Upper/Weathering_All.csv")

Mine_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Sens/Ex/Upper/Weathering_All.csv")

LNSED_Mine_Max<-sum(Mine_10_Plus_LNSED$Ca, na.rm = TRUE)

HNSED_Mine_Max<-sum(Mine_10_Plus_HNSED$Ca, na.rm = TRUE)

LNBAS_Mine_Max<-sum(Mine_10_Plus_LNBAS$Ca, na.rm = TRUE)

HNBAS_Mine_Max<-sum(Mine_10_Plus_HNBAS$Ca, na.rm = TRUE)

# Minimum

Mine_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Sens/Ex/Lower/Weathering_All.csv")

Mine_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Sens/Ex/Lower/Weathering_All.csv")

Mine_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Sens/Ex/Lower/Weathering_All.csv")

Mine_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Sens/Ex/Lower/Weathering_All.csv")


LNSED_Mine_Min<-sum(Mine_10_Minus_LNSED$Ca, na.rm = TRUE)

HNSED_Mine_Min<-sum(Mine_10_Minus_HNSED$Ca, na.rm = TRUE)

LNBAS_Mine_Min<-sum(Mine_10_Minus_LNBAS$Ca, na.rm = TRUE)

HNBAS_Mine_Min<-sum(Mine_10_Minus_HNBAS$Ca, na.rm = TRUE)


# Percent difference is 100*(Final-Initial/initial)

PerChange_LNSED_Min<-Diff(LNSED_Mine_Min, Orig_LNSED)
PerChange_HNSED_Min<-Diff(HNSED_Mine_Min, Orig_HNSED)
PerChange_LNBAS_Min<-Diff(LNBAS_Mine_Min, Orig_LNBAS)
PerChange_HNBAS_Min<-Diff(HNBAS_Mine_Min, Orig_HNBAS)

PerChange_LNSED_Max<-Diff(LNSED_Mine_Max, Orig_LNSED)
PerChange_HNSED_Max<-Diff(HNSED_Mine_Max, Orig_HNSED)
PerChange_LNBAS_Max<-Diff(LNBAS_Mine_Max, Orig_LNBAS)
PerChange_HNBAS_Max<-Diff(HNBAS_Mine_Max, Orig_HNBAS)

PerChange_Df<-cbind(PerChange_LNSED_Min, PerChange_HNSED_Min,PerChange_LNBAS_Min,PerChange_HNBAS_Min,PerChange_LNSED_Max,PerChange_HNSED_Max,
                    PerChange_LNBAS_Max,PerChange_HNBAS_Max)

X<-melt(PerChange_Df)

# Reorder Factorv

Y<-as.data.frame(X)
Y$Var2 <- factor(Y$Var2,levels = c("PerChange_LNSED_Min", "PerChange_LNSED_Max",
                                   "PerChange_HNSED_Min", "PerChange_HNSED_Max", 
                                   "PerChange_LNBAS_Min", "PerChange_LNBAS_Max",
                                   "PerChange_HNBAS_Min", "PerChange_HNBAS_Max"))

G<-ggplot(Y, aes(x=Var2, y=value))+geom_col()+scale_x_discrete(labels=c("PerChange_LNSED_Min"="LN SED -50%", "PerChange_LNSED_Max"="LN SED +50%",
                                                                        "PerChange_HNSED_Min"="HN SED -50%", "PerChange_HNSED_Max"="HN SED +50%", 
                                                                        "PerChange_LNBAS_Min"="LN BAS -50%", "PerChange_LNBAS_Max"="LN BAS +50%",
                                                                        "PerChange_HNBAS_Min"="HN BAS -50%", "PerChange_HNBAS_Max"="HN BAS +50%"))+
  theme_bw()+
  labs(x="Exchangeable Cation Pool % Change", y="Percent Difference from Original")

png("Ca_Ex.png", width=1000, height=500, res=115)
plot(G)
dev.off()