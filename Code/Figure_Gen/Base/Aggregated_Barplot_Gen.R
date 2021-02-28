#Aggregated Graph File

#Pulls from all NutsFor Data directories to make bar graphs for the Base Case Scenaios

rm(list = ls())



library(dplyr)
library(ggplot2)
library(reshape2)


source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Analysis_1_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Soil_Soln_LN_BAS_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Soil_Soln_HN_BAS_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Soil_Soln_LN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/Base/Soil_Soln_HN_SED_Mutator.R")

rm(list = ls())

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Base")

# HN BAS File Read

Cal_Pretable_Parent_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_BAS/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_LL_HNB<-Cal_Pretable_Parent_HNB %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
Cal_Pretable_LL_HNB$group_id<-as.character(Cal_Pretable_LL$group_id)


Cal_Pretable_LL_Yr_HNB<-Cal_Pretable_LL_HNB %>% group_by(group_id) %>% summarise(across(Ca:HR, ~mean(.x, na.rm=TRUE)))
Cal_Pretable_LL_1M_HNB<-Cal_Pretable_LL_HNB %>% filter(group_id %in% c("8")) %>% summarize(across(Ca:HR, ~mean(.x, na.rm = TRUE)))

Analysis_1_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_BAS/Edited Data/Analysis_1.csv", header=TRUE)
Analysis_1_HNB<- Analysis_1_HNB %>% summarize(across(Ca_Wet:P_SOM_Min, ~mean(.x, na.rm = TRUE)))

Analysis_Bound_HNB<- cbind(Cal_Pretable_LL_1M_HNB, Analysis_1_HNB)



# LN BAS File Read


Cal_Pretable_Parent_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_LL_LNB<-Cal_Pretable_Parent_LNB %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
Cal_Pretable_LL_LNB$group_id<-as.character(Cal_Pretable_LL$group_id)


Cal_Pretable_LL_Yr_LNB<-Cal_Pretable_LL_LNB %>% group_by(group_id) %>% summarise(across(Ca:HR, ~mean(.x, na.rm=TRUE)))
Cal_Pretable_LL_1M_LNB<-Cal_Pretable_LL_LNB %>% filter(group_id %in% c("8")) %>% summarize(across(Ca:HR, ~mean(.x, na.rm = TRUE)))

Analysis_1_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_BAS/Edited Data/Analysis_1.csv", header=TRUE)
Analysis_1_LNB<- Analysis_1_LNB %>% summarize(across(Ca_Wet:P_SOM_Min, ~mean(.x, na.rm = TRUE)))

Analysis_Bound_LNB<- cbind(Cal_Pretable_LL_1M_LNB, Analysis_1_LNB)


# HN SED File Read


Cal_Pretable_Parent_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_LL_HNS<-Cal_Pretable_Parent_HNS %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
Cal_Pretable_LL_HNS$group_id<-as.character(Cal_Pretable_LL$group_id)


Cal_Pretable_LL_Yr_HNS<-Cal_Pretable_LL_HNS %>% group_by(group_id) %>% summarise(across(Ca:HR, ~mean(.x, na.rm=TRUE)))
Cal_Pretable_LL_1M_HNS<-Cal_Pretable_LL_HNS %>% filter(group_id %in% c("8")) %>% summarize(across(Ca:HR, ~mean(.x, na.rm = TRUE)))

Analysis_1_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Edited Data/Analysis_1.csv", header=TRUE)
Analysis_1_HNS<- Analysis_1_HNS %>% summarize(across(Ca_Wet:P_SOM_Min, ~mean(.x, na.rm = TRUE)))

Analysis_Bound_HNS<- cbind(Cal_Pretable_LL_1M_HNS, Analysis_1_HNS)




# LN SED File Read


Cal_Pretable_Parent_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_LL_LNS<-Cal_Pretable_Parent_LNS %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
Cal_Pretable_LL_LNS$group_id<-as.character(Cal_Pretable_LL$group_id)


Cal_Pretable_LL_Yr_LNS<-Cal_Pretable_LL_LNS %>% group_by(group_id) %>% summarise(across(Ca:HR, ~mean(.x, na.rm=TRUE)))
Cal_Pretable_LL_1M_LNS<-Cal_Pretable_LL_LNS %>% filter(group_id %in% c("8")) %>% summarize(across(Ca:HR, ~mean(.x, na.rm = TRUE)))

Analysis_1_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Edited Data/Analysis_1.csv", header=TRUE)
Analysis_1_LNS<- Analysis_1_LNS %>% summarize(across(Ca_Wet:P_SOM_Min, ~mean(.x, na.rm = TRUE)))

Analysis_Bound_LNS<- cbind(Cal_Pretable_LL_1M_LNS, Analysis_1_LNS)




# Calcium

Ca_Flux_HNB<-Analysis_Bound_HNB %>% select (Ca, Ca_Wet, Ca_WTH, Ca_TU, Ca_LF, Ca_L_Min)
Ca_Flux_HNB$Ca_LF<-Ca_Flux_HNB$Ca_LF*10

Ca_Flux_HNB$ID<-"HNBAS"

Ca_Melt_HNB<-melt(Ca_Flux_HNB, id.vars = c("ID"))


Ca_Flux_LNB<-Analysis_Bound_LNB %>% select (Ca, Ca_Wet, Ca_WTH, Ca_TU, Ca_LF, Ca_L_Min)
Ca_Flux_LNB$Ca_LF<-Ca_Flux_LNB$Ca_LF*10

Ca_Flux_LNB$ID<-"LNBAS"

Ca_Melt_LNB<-melt(Ca_Flux_LNB, id.vars = c("ID"))


Ca_Flux_HNS<-Analysis_Bound_HNS %>% select (Ca, Ca_Wet, Ca_WTH, Ca_TU, Ca_LF, Ca_L_Min)
Ca_Flux_HNS$Ca_LF<-Ca_Flux_HNS$Ca_LF*10

Ca_Flux_HNS$ID<-"HNSED"

Ca_Melt_HNS<-melt(Ca_Flux_HNS, id.vars = c("ID"))



Ca_Flux_LNS<-Analysis_Bound_LNS %>% select (Ca, Ca_Wet, Ca_WTH, Ca_TU, Ca_LF, Ca_L_Min)
Ca_Flux_LNS$Ca_LF<-Ca_Flux_LNS$Ca_LF*10

Ca_Flux_LNS$ID<-"LNSED"

Ca_Melt_LNS<-melt(Ca_Flux_LNS, id.vars = c("ID"))


Ca_Base<-rbind(Ca_Melt_HNB, Ca_Melt_HNS, Ca_Melt_LNB, Ca_Melt_LNS)


Ca_Stacked<-ggplot(Ca_Base, aes(x=ID, y=value, fill=variable))+geom_col()+labs(y="Ca Flux From Ecosystem Pools: kg/ha/yr")+
  scale_fill_discrete(name = "Legend", labels = c("Leaching Flux", "Deposition", "Weathering Flux", "Total Uptake", "Litterfall Return", "Litter Mineralization"))

png("Ca_Base_Barplot.png")
plot(Ca_Stacked)
dev.off()



# Magnesium

Mg_Flux_HNB<-Analysis_Bound_HNB %>% select (Mg, Mg_Wet, Mg_WTH, Mg_TU, Mg_LF, Mg_L_Min)
Mg_Flux_HNB$Mg_LF<-Mg_Flux_HNB$Mg_LF*10

Mg_Flux_HNB$ID<-"HNBAS"

Mg_Melt_HNB<-melt(Mg_Flux_HNB, id.vars = c("ID"))


Mg_Flux_LNB<-Analysis_Bound_LNB %>% select (Mg, Mg_Wet, Mg_WTH, Mg_TU, Mg_LF, Mg_L_Min)
Mg_Flux_LNB$Mg_LF<-Mg_Flux_LNB$Mg_LF*10

Mg_Flux_LNB$ID<-"LNBAS"

Mg_Melt_LNB<-melt(Mg_Flux_LNB, id.vars = c("ID"))


Mg_Flux_HNS<-Analysis_Bound_HNS %>% select (Mg, Mg_Wet, Mg_WTH, Mg_TU, Mg_LF, Mg_L_Min)
Mg_Flux_HNS$Mg_LF<-Mg_Flux_HNS$Mg_LF*10

Mg_Flux_HNS$ID<-"HNSED"

Mg_Melt_HNS<-melt(Mg_Flux_HNS, id.vars = c("ID"))



Mg_Flux_LNS<-Analysis_Bound_LNS %>% select (Mg, Mg_Wet, Mg_WTH, Mg_TU, Mg_LF, Mg_L_Min)
Mg_Flux_LNS$Mg_LF<-Mg_Flux_LNS$Mg_LF*10

Mg_Flux_LNS$ID<-"LNSED"

Mg_Melt_LNS<-melt(Mg_Flux_LNS, id.vars = c("ID"))

Mg_Base<-rbind(Mg_Melt_HNB, Mg_Melt_HNS, Mg_Melt_LNB, Mg_Melt_LNS)


Mg_Stacked<-ggplot(Mg_Base, aes(x=ID, y=value, fill=variable))+geom_col()+labs(y="Mg Flux From Ecosystem Pools: kg/ha/yr")+
  scale_fill_discrete(name = "Legend", labels = c("Leaching Flux", "Deposition", "Weathering Flux", "Total Uptake", "Litterfall Return", "Litter Mineralization"))

png("Mg_Base_Barplot.png")
plot(Mg_Stacked)
dev.off()

# Magnesium

K_Flux_HNB<-Analysis_Bound_HNB %>% select (K, K_Wet, K_WTH, K_TU, K_LF, K_L_Min)
K_Flux_HNB$K_LF<-K_Flux_HNB$K_LF*10

K_Flux_HNB$ID<-"HNBAS"

K_Melt_HNB<-melt(K_Flux_HNB, id.vars = c("ID"))


K_Flux_LNB<-Analysis_Bound_LNB %>% select (K, K_Wet, K_WTH, K_TU, K_LF, K_L_Min)
K_Flux_LNB$K_LF<-K_Flux_LNB$K_LF*10

K_Flux_LNB$ID<-"LNBAS"

K_Melt_LNB<-melt(K_Flux_LNB, id.vars = c("ID"))


K_Flux_HNS<-Analysis_Bound_HNS %>% select (K, K_Wet, K_WTH, K_TU, K_LF, K_L_Min)
K_Flux_HNS$K_LF<-K_Flux_HNS$K_LF*10

K_Flux_HNS$ID<-"HNSED"

K_Melt_HNS<-melt(K_Flux_HNS, id.vars = c("ID"))



K_Flux_LNS<-Analysis_Bound_LNS %>% select (K, K_Wet, K_WTH, K_TU, K_LF, K_L_Min)
K_Flux_LNS$K_LF<-K_Flux_LNS$K_LF*10

K_Flux_LNS$ID<-"LNSED"

K_Melt_LNS<-melt(K_Flux_LNS, id.vars = c("ID"))

K_Base<-rbind(K_Melt_HNB, K_Melt_HNS, K_Melt_LNB, K_Melt_LNS)


K_Stacked<-ggplot(K_Base, aes(x=ID, y=value, fill=variable))+geom_col()+labs(y="K Flux From Ecosystem Pools: kg/ha/yr")+
  scale_fill_discrete(name = "Legend", labels = c("Leaching Flux", "Deposition", "Weathering Flux", "Total Uptake", "Litterfall Return", "Litter Mineralization"))

png("K_Base_Barplot.png")
plot(K_Stacked)
dev.off()

# Sulfur/Sulfate

SO4_Flux_HNB<-Analysis_Bound_HNB %>% select (SO4, SO4_Wet, S_TU, S_LF, S_L_Min)
SO4_Flux_HNB$SO4_LF<-SO4_Flux_HNB$SO4_LF*10

SO4_Flux_HNB$ID<-"HNBAS"

SO4_Melt_HNB<-melt(SO4_Flux_HNB, id.vars = c("ID"))


SO4_Flux_LNB<-Analysis_Bound_LNB %>% select (SO4, SO4_Wet, S_TU, S_LF, S_L_Min)
SO4_Flux_LNB$SO4_LF<-SO4_Flux_LNB$SO4_LF*10

SO4_Flux_LNB$ID<-"LNBAS"

SO4_Melt_LNB<-melt(SO4_Flux_LNB, id.vars = c("ID"))


SO4_Flux_HNS<-Analysis_Bound_HNS %>% select (SO4, SO4_Wet, S_TU, S_LF, S_L_Min)
SO4_Flux_HNS$SO4_LF<-SO4_Flux_HNS$SO4_LF*10

SO4_Flux_HNS$ID<-"HNSED"

SO4_Melt_HNS<-melt(SO4_Flux_HNS, id.vars = c("ID"))



SO4_Flux_LNS<-Analysis_Bound_LNS %>% select (SO4, SO4_Wet, S_TU, S_LF, S_L_Min)
SO4_Flux_LNS$SO4_LF<-SO4_Flux_LNS$SO4_LF*10

SO4_Flux_LNS$ID<-"LNSED"

SO4_Melt_LNS<-melt(SO4_Flux_LNS, id.vars = c("ID"))

SO4_Base<-rbind(SO4_Melt_HNB, SO4_Melt_HNS, SO4_Melt_LNB, SO4_Melt_LNS)


SO4_Stacked<-ggplot(SO4_Base, aes(x=ID, y=value, fill=variable))+geom_col()+labs(y="SO4 Flux From Ecosystem Pools: kg/ha/yr")+
  scale_fill_discrete(name = "Legend", labels = c("Leaching Flux", "Deposition", "Weathering Flux", "Total UptaSO4e", "Litterfall Return", "Litter Mineralization"))

png("SO4_Base_Barplot.png")
plot(SO4_Stacked)
dev.off()

# Nitrogen

N_Flux_HNB<-Analysis_Bound_HNB %>% select (NO3, NH4, Ntot_Wet, N_TU, N_LF, N_L_Min, N_SOM_Min)
N_Flux_HNB$N_LF<-N_Flux_HNB$N_LF*10

N_Flux_HNB$ID<-"HNBAS"

N_Melt_HNB<-melt(N_Flux_HNB, id.vars = c("ID"))


N_Flux_LNB<-Analysis_Bound_LNB %>% select (NO3, NH4, Ntot_Wet, N_TU, N_LF, N_L_Min, N_SOM_Min)
N_Flux_LNB$N_LF<-N_Flux_LNB$N_LF*10

N_Flux_LNB$ID<-"LNBAS"

N_Melt_LNB<-melt(N_Flux_LNB, id.vars = c("ID"))


N_Flux_HNS<-Analysis_Bound_HNS %>% select (NO3, NH4, Ntot_Wet, N_TU, N_LF, N_L_Min, N_SOM_Min)
N_Flux_HNS$N_LF<-N_Flux_HNS$N_LF*10

N_Flux_HNS$ID<-"HNSED"

N_Melt_HNS<-melt(N_Flux_HNS, id.vars = c("ID"))



N_Flux_LNS<-Analysis_Bound_LNS %>% select (NO3, NH4, Ntot_Wet, N_TU, N_LF, N_L_Min, N_SOM_Min)
N_Flux_LNS$N_LF<-N_Flux_LNS$N_LF*10

N_Flux_LNS$ID<-"LNSED"

N_Melt_LNS<-melt(N_Flux_LNS, id.vars = c("ID"))

N_Base<-rbind(N_Melt_HNB, N_Melt_HNS, N_Melt_LNB, N_Melt_LNS)


N_Stacked<-ggplot(N_Base, aes(x=ID, y=value, fill=variable))+geom_col()+labs(y="N Flux From Ecosystem Pools: kg/ha/yr")+
  scale_fill_discrete(name = "Legend", labels = c("Leaching Flux", "Deposition", "Weathering Flux", "Total UptaNe", "Litterfall Return", "Litter Mineralization", "SOM Mineralization"))

png("N_Base_Barplot.png")
plot(N_Stacked)
dev.off()



# Phosphate

P_Flux_HNB<-Analysis_Bound_HNB %>% select (P, P_TU, P_LF, P_L_Min, P_WTH, P_SOM_Min)
P_Flux_HNB$P_LF<-P_Flux_HNB$P_LF*10

P_Flux_HNB$ID<-"HNBAS"

P_Melt_HNB<-melt(P_Flux_HNB, id.vars = c("ID"))


P_Flux_LNB<-Analysis_Bound_LNB %>% select (P, P_TU, P_LF, P_L_Min, P_WTH, P_SOM_Min)
P_Flux_LNB$P_LF<-P_Flux_LNB$P_LF*10

P_Flux_LNB$ID<-"LNBAS"

P_Melt_LNB<-melt(P_Flux_LNB, id.vars = c("ID"))


P_Flux_HNS<-Analysis_Bound_HNS %>% select (P, P_TU, P_LF, P_L_Min, P_WTH, P_SOM_Min)
P_Flux_HNS$P_LF<-P_Flux_HNS$P_LF*10

P_Flux_HNS$ID<-"HNSED"

P_Melt_HNS<-melt(P_Flux_HNS, id.vars = c("ID"))



P_Flux_LNS<-Analysis_Bound_LNS %>% select (P, P_TU, P_LF, P_L_Min, P_WTH, P_SOM_Min)
P_Flux_LNS$P_LF<-P_Flux_LNS$P_LF*10

P_Flux_LNS$ID<-"LNSED"

P_Melt_LNS<-melt(P_Flux_LNS, id.vars = c("ID"))

P_Base<-rbind(P_Melt_HNB, P_Melt_HNS, P_Melt_LNB, P_Melt_LNS)


P_Stacked<-ggplot(P_Base, aes(x=ID, y=value, fill=variable))+geom_col()+labs(y="P Flux From Ecosystem Pools: kg/ha/yr")+
  scale_fill_discrete(name = "Legend", labels = c("Leaching Flux", "Total Uptake", "Litterfall Return", "Litter Mineralization", "Weathering Flux", "SOM Mineralization"))

png("P_Base_Barplot.png")
plot(P_Stacked)
dev.off()
