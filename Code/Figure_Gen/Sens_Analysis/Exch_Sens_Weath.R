#--------------------------#
#---Sensitivity Analysis---#
#$---Mineral Weathering---$#
#%------Exchangeable Pool------%#
#--------------------------#

rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)
library(RColorBrewer)
library(ggpattern)


# Update 40_BO Sites, Use Sens_Updater.R seperate to update Sens files!
source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Weathering_LN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Maximum/Exchanger/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Minimum/Exchanger/Weathering_Mutator.R")


source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")
source("~/Project_Master/Test_Rep/Code/Functions/Sens_Coeff.R")

# SET WD

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

# Original

Orig_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Weathering_All.csv")

Orig_LNSED_Ca<-sum(Orig_LNSED$Ca, na.rm = TRUE)
Orig_LNSED_K<-sum(Orig_LNSED$K, na.rm = TRUE)

Orig_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Weathering_All.csv")


Orig_HNSED_Ca<-sum(Orig_HNSED$Ca, na.rm = TRUE)
Orig_HNSED_K<-sum(Orig_HNSED$K, na.rm = TRUE)

Orig_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Weathering_All.csv")

Orig_LNBAS_Ca<-sum(Orig_LNBAS$Ca, na.rm = TRUE)
Orig_LNBAS_K<-sum(Orig_LNBAS$K, na.rm = TRUE)

Orig_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Weathering_All.csv")

Orig_HNBAS_Ca<-sum(Orig_HNBAS$Ca, na.rm = TRUE)
Orig_HNBAS_K<-sum(Orig_HNBAS$K, na.rm = TRUE)

# Maximum

Mine_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Ex/Upper/Weathering_All.csv")

Mine_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Ex/Upper/Weathering_All.csv")

Mine_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Ex/Upper/Weathering_All.csv")

Mine_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Ex/Upper/Weathering_All.csv")

LNSED_Mine_Max_Ca<-sum(Mine_10_Plus_LNSED$Ca, na.rm = TRUE)

HNSED_Mine_Max_Ca<-sum(Mine_10_Plus_HNSED$Ca, na.rm = TRUE)

LNBAS_Mine_Max_Ca<-sum(Mine_10_Plus_LNBAS$Ca, na.rm = TRUE)

HNBAS_Mine_Max_Ca<-sum(Mine_10_Plus_HNBAS$Ca, na.rm = TRUE)

LNSED_Mine_Max_K<-sum(Mine_10_Plus_LNSED$K, na.rm = TRUE)

HNSED_Mine_Max_K<-sum(Mine_10_Plus_HNSED$K, na.rm = TRUE)

LNBAS_Mine_Max_K<-sum(Mine_10_Plus_LNBAS$K, na.rm = TRUE)

HNBAS_Mine_Max_K<-sum(Mine_10_Plus_HNBAS$K, na.rm = TRUE)

# Minimum

Mine_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Ex/Lower/Weathering_All.csv")

Mine_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Ex/Lower/Weathering_All.csv")

Mine_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Ex/Lower/Weathering_All.csv")

Mine_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Ex/Lower/Weathering_All.csv")


LNSED_Mine_Min_Ca<-sum(Mine_10_Minus_LNSED$Ca, na.rm = TRUE)

HNSED_Mine_Min_Ca<-sum(Mine_10_Minus_HNSED$Ca, na.rm = TRUE)

LNBAS_Mine_Min_Ca<-sum(Mine_10_Minus_LNBAS$Ca, na.rm = TRUE)

HNBAS_Mine_Min_Ca<-sum(Mine_10_Minus_HNBAS$Ca, na.rm = TRUE)

LNSED_Mine_Min_K<-sum(Mine_10_Minus_LNSED$K, na.rm = TRUE)

HNSED_Mine_Min_K<-sum(Mine_10_Minus_HNSED$K, na.rm = TRUE)

LNBAS_Mine_Min_K<-sum(Mine_10_Minus_LNBAS$K, na.rm = TRUE)

HNBAS_Mine_Min_K<-sum(Mine_10_Minus_HNBAS$K, na.rm = TRUE)


# Percent difference is 100*(Final-Initial/initial)

PerChange_LNSED_Min_Ca<-Diff(LNSED_Mine_Min_Ca, Orig_LNSED_Ca)
PerChange_HNSED_Min_Ca<-Diff(HNSED_Mine_Min_Ca, Orig_HNSED_Ca)
PerChange_LNBAS_Min_Ca<-Diff(LNBAS_Mine_Min_Ca, Orig_LNBAS_Ca)
PerChange_HNBAS_Min_Ca<-Diff(HNBAS_Mine_Min_Ca, Orig_HNBAS_Ca)

PerChange_LNSED_Max_Ca<-Diff(LNSED_Mine_Max_Ca, Orig_LNSED_Ca)
PerChange_HNSED_Max_Ca<-Diff(HNSED_Mine_Max_Ca, Orig_HNSED_Ca)
PerChange_LNBAS_Max_Ca<-Diff(LNBAS_Mine_Max_Ca, Orig_LNBAS_Ca)
PerChange_HNBAS_Max_Ca<-Diff(HNBAS_Mine_Max_Ca, Orig_HNBAS_Ca)

PerChange_LNSED_Min_K<-Diff(LNSED_Mine_Min_K, Orig_LNSED_K)
PerChange_HNSED_Min_K<-Diff(HNSED_Mine_Min_K, Orig_HNSED_K)
PerChange_LNBAS_Min_K<-Diff(LNBAS_Mine_Min_K, Orig_LNBAS_K)
PerChange_HNBAS_Min_K<-Diff(HNBAS_Mine_Min_K, Orig_HNBAS_K)

PerChange_LNSED_Max_K<-Diff(LNSED_Mine_Max_K, Orig_LNSED_K)
PerChange_HNSED_Max_K<-Diff(HNSED_Mine_Max_K, Orig_HNSED_K)
PerChange_LNBAS_Max_K<-Diff(LNBAS_Mine_Max_K, Orig_LNBAS_K)
PerChange_HNBAS_Max_K<-Diff(HNBAS_Mine_Max_K, Orig_HNBAS_K)

LNS_Ca_Min<-Sens_Coeff(LNSED_Mine_Min_Ca,Orig_LNSED_Ca, .5, 1)
LNS_Ca_Max<-Sens_Coeff(LNSED_Mine_Max_Ca,Orig_LNSED_Ca, 1.5, 1)
LNB_Ca_Min<-Sens_Coeff(LNBAS_Mine_Min_Ca,Orig_LNBAS_Ca, .5, 1)
LNB_Ca_Max<-Sens_Coeff(LNBAS_Mine_Max_Ca,Orig_LNBAS_Ca, 1.5, 1)
HNB_Ca_Min<-Sens_Coeff(HNBAS_Mine_Min_Ca,Orig_HNBAS_Ca, .5, 1)
HNB_Ca_Max<-Sens_Coeff(HNBAS_Mine_Max_Ca,Orig_HNBAS_Ca, 1.5, 1)
HNS_Ca_Max<-Sens_Coeff(HNSED_Mine_Max_Ca,Orig_HNSED_Ca, 1.5, 1)
HNS_Ca_Min<-Sens_Coeff(HNSED_Mine_Min_Ca,Orig_HNSED_Ca, 1.5, 1)


LNS_K_Min<-Sens_Coeff(LNSED_Mine_Min_K,Orig_LNSED_K, .5, 1)
LNS_K_Max<-Sens_Coeff(LNSED_Mine_Max_K,Orig_LNSED_K, 1.5, 1)
LNB_K_Min<-Sens_Coeff(LNBAS_Mine_Min_K,Orig_LNBAS_K, .5, 1)
LNB_K_Max<-Sens_Coeff(LNBAS_Mine_Max_K,Orig_LNBAS_K, 1.5, 1)
HNB_K_Min<-Sens_Coeff(HNBAS_Mine_Min_K,Orig_HNBAS_K, .5, 1)
HNB_K_Max<-Sens_Coeff(HNBAS_Mine_Max_K,Orig_HNBAS_K, 1.5, 1)
HNS_K_Max<-Sens_Coeff(HNSED_Mine_Max_K,Orig_HNSED_K, 1.5, 1)
HNS_K_Min<-Sens_Coeff(HNSED_Mine_Min_K,Orig_HNSED_K, 1.5, 1)


Sens_Coeff_tbl<-cbind(LNS_Ca_Min, LNS_Ca_Max, LNB_Ca_Min, LNB_Ca_Max, HNS_Ca_Min, HNS_Ca_Max, HNB_Ca_Min, HNB_Ca_Min, 
                      LNS_K_Min, LNS_K_Max, LNB_K_Min, LNB_K_Max, HNS_K_Min, HNS_K_Max, HNB_K_Min, HNB_K_Max)

Sens_Coeff_tbl<-data.frame(Sens_Coeff_tbl)

Sens_Coeff_tbl$ID<-"Exch"


PerChange_Df<-cbind(PerChange_LNSED_Min_Ca, PerChange_HNSED_Min_Ca,PerChange_LNBAS_Min_Ca,PerChange_HNBAS_Min_Ca,
                    PerChange_LNSED_Min_K, PerChange_HNSED_Min_K,PerChange_LNBAS_Min_K,PerChange_HNBAS_Min_K,
                    PerChange_LNSED_Max_Ca, PerChange_HNSED_Max_Ca,PerChange_LNBAS_Max_Ca,PerChange_HNBAS_Max_Ca,
                    PerChange_LNSED_Max_K, PerChange_HNSED_Max_K,PerChange_LNBAS_Max_K,PerChange_HNBAS_Max_K)

PerChange_Df<-as.data.frame(PerChange_Df)

PerChange_Df<-na.omit(PerChange_Df)


X<-melt(PerChange_Df)

X$Inc<-c("Lower", "Lower", "Lower", "Lower",
         "Lower", "Lower", "Lower", "Lower",
         "Upper", "Upper", "Upper", "Upper",
         "Upper", "Upper", "Upper", "Upper")

X$Site<-c("LN SED", "HN SED",
          "LN BAS", "HN BAS",
          "LN SED", "HN SED",
          "LN BAS", "HN BAS",
          "LN SED", "HN SED",
          "LN BAS", "HN BAS",
          "LN SED", "HN SED",
          "LN BAS", "HN BAS")

X$ID<-c("Ca", "Ca", "Ca", "Ca", "K", "K", "K", "K", "Ca", "Ca", "Ca", "Ca", "K", "K", "K", "K")

# Reorder Factorv



Y<-as.data.frame(X)

Y$Site <- factor(Y$Site,levels = c("LN SED", "HN SED", "LN BAS", "HN BAS"))

Y$Sens<-"Ex"
Y$Response<-"Weath"

Y$value2<-ifelse(abs(Y$value)<=1, "NR", " ")


G_Ex_W<-ggplot(data = Y, aes(x = Site, y = value, fill=Inc, pattern = ID, width=.75)) +
  geom_col_pattern(position = position_dodge(preserve = "single"),
                   color = "black", 
                   pattern_fill = "black",
                   pattern_angle = 45,
                   pattern_density = 0.1,
                   pattern_spacing = 0.025,
                   pattern_key_scale_factor = 0.6) + 
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange1"), labels=c("Lower"="Lower (-50%)", "Upper"="Upper (+50%)")) +
  scale_pattern_manual(values = c(Ca = "stripe", K = "none")) +
  labs(x = "Site", y = "Total Weathering Flux % Change", pattern = "ID", fill="Increment") + 
  guides(pattern = guide_legend(override.aes = list(fill = "white")),
         fill = guide_legend(override.aes = list(pattern = "none")))+ theme_bw()+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+ggtitle("Exchangeable Pool")+
  theme(plot.title = element_text(hjust = 0.5, size=14))

png("Ca_Ex.png", width=1000, height=500, res=115)
plot(G_Ex_W)
dev.off()


write.csv2(Sens_Coeff_tbl, "Sens_Tbl_Exch_Weath.csv")
write.csv2(Y, "Ex_Weath.csv")
write.csv(PerChange_Df, "ExWeath_Per.csv")