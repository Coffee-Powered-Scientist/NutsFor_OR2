
#--------------------------#
#---Sensitivity Analysis---#
#$---Mineral Weathering---$#
#%------Nitrification------%#
#--------------------------#

rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)



# Update Base Sites, Use Sens_Updater.R seperate to update Sens files!
source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Weathering_LN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Maximum/Nit/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Maximum/Nit/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Maximum/Nit/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Maximum/Nit/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Minimum/Nit/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Minimum/Nit/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Minimum/Nit/Weathering_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Minimum/Nit/Weathering_Mutator.R")


source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")

# SET WD

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

# Original

Orig_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Weathering_All.csv")

Orig_LNSED<-sum(Orig_LNSED$Ca, na.rm=TRUE)

Orig_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Weathering_All.csv")

Orig_HNSED<-sum(Orig_HNSED$Ca, na.rm=TRUE)

Orig_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Weathering_All.csv")

Orig_LNBAS<-sum(Orig_LNBAS$Ca, na.rm=TRUE)

Orig_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Weathering_All.csv")

Orig_HNBAS<-sum(Orig_HNBAS$Ca, na.rm=TRUE)

# Maximum

Nit_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Nit/Upper/Weathering_All.csv")

Nit_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Nit/Upper/Weathering_All.csv")

Nit_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Nit/Upper/Weathering_All.csv")

Nit_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Nit/Upper/Weathering_All.csv")


LNSED_Nit_Max<-sum(Nit_10_Plus_LNSED$Ca, na.rm=TRUE)

HNSED_Nit_Max<-sum(Nit_10_Plus_HNSED$Ca, na.rm=TRUE)

LNBAS_Nit_Max<-sum(Nit_10_Plus_LNBAS$Ca, na.rm=TRUE)

HNBAS_Nit_Max<-sum(Nit_10_Plus_HNBAS$Ca, na.rm=TRUE)

# Minimum

Nit_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Nit/Lower/Weathering_All.csv")

Nit_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Nit/Lower/Weathering_All.csv")

Nit_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Nit/Lower/Weathering_All.csv")

Nit_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Nit/Lower/Weathering_All.csv")


LNSED_Nit_Min<-sum(Nit_10_Minus_LNSED$Ca, na.rm=TRUE)

HNSED_Nit_Min<-sum(Nit_10_Minus_HNSED$Ca, na.rm=TRUE)

LNBAS_Nit_Min<-sum(Nit_10_Minus_LNBAS$Ca, na.rm=TRUE)

HNBAS_Nit_Min<-sum(Nit_10_Minus_HNBAS$Ca, na.rm=TRUE)


# Percent difference is 100*(Final-Initial/initial)

PerChange_LNSED_Min<-Diff(LNSED_Nit_Min, Orig_LNSED)
PerChange_HNSED_Min<-Diff(HNSED_Nit_Min, Orig_HNSED)
PerChange_LNBAS_Min<-Diff(LNBAS_Nit_Min, Orig_LNBAS)
PerChange_HNBAS_Min<-Diff(HNBAS_Nit_Min, Orig_HNBAS)

PerChange_LNSED_Max<-Diff(LNSED_Nit_Max, Orig_LNSED)
PerChange_HNSED_Max<-Diff(HNSED_Nit_Max, Orig_HNSED)
PerChange_LNBAS_Max<-Diff(LNBAS_Nit_Max, Orig_LNBAS)
PerChange_HNBAS_Max<-Diff(HNBAS_Nit_Max, Orig_HNBAS)

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
  labs(x="Nitrification Increment % Change", y="Percent Difference from Original", fill="Increment")+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"))+
  theme(legend.position = c(0.925, 0.85))

png("Ca_Nit.png", width=1000, height=500, res=115)
plot(G)
dev.off()