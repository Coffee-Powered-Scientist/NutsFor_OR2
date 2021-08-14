
# Compares Uptake Lim. Line Graphs to one another, this file is for 40_BO case
rm(list = ls())

library(ggplot2)
library(dplyr)
library(reshape2)
library(lubridate)
library(ggpubr)
library(gridExtra)
library(grid)
library(cowplot)
library(scales)
library(RColorBrewer)

# Working directory set below




# Update

source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Plant_Pool_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Plant_Pool_Ghost.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Plant_Pool_Ghost.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Plant_Pool_Ghost.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Plant_Pool_Ghost.R")

# HN BAS File Reading

TimeSteps<-seq(1, 525, 1)

Plant_Pool_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Plant_Pool.csv")
Plant_Pool_HNBAS_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_HNBAS$ID<-"HNBAS"

Above_FluxGHOST_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Abov_Flux.csv")

Plant_Pool_HNBAS$Year<-as.Date(paste(Plant_Pool_HNBAS$Year, 1, 1, sep = "-"))


# LN BAS File Reading

Plant_Pool_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Plant_Pool.csv")
Plant_Pool_LNBAS_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_LNBAS$ID<-"LNBAS"

Above_FluxGHOST_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Abov_Flux.csv")

Plant_Pool_LNBAS$Year<-as.Date(paste(Plant_Pool_LNBAS$Year, 1, 1, sep = "-"))



# HN SED File Reading

Plant_Pool_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Plant_Pool.csv")

Plant_Pool_HNSED_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_HNSED$ID<-"HNSED"

Above_FluxGHOST_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Abov_Flux.csv")

Plant_Pool_HNSED$Year<-as.Date(paste(Plant_Pool_HNSED$Year, 1, 1, sep = "-"))

# LN SED File Reading

Plant_Pool_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Plant_Pool.csv")
Plant_Pool_LNSED_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_LNSED$ID<-"LNSED"

Above_FluxGHOST_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Abov_Flux.csv")

Plant_Pool_LNSED$Year<-as.Date(paste(Plant_Pool_LNSED$Year, 1, 1, sep = "-"))

# rbind

All_Df<-cbind(Plant_Pool_HNBAS, Plant_Pool_LNBAS, Plant_Pool_LNSED, Plant_Pool_HNSED)

# SET WD (Needs to ve here)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_BO")


Plant_Pool_HNBAS$TS<-TimeSteps
Above_Flux_HNB$TS<-TimeSteps
Above_FluxGHOST_HNB$TS<-TimeSteps

Plant_Pool_LNBAS$TS<-TimeSteps
Above_Flux_LNB$TS<-TimeSteps
Above_FluxGHOST_LNB$TS<-TimeSteps

Plant_Pool_LNSED$TS<-TimeSteps
Above_Flux_LNSED$TS<-TimeSteps
Above_FluxGHOST_LNS$TS<-TimeSteps

Plant_Pool_HNSED$TS<-TimeSteps
Above_Flux_HNS$TS<-TimeSteps
Above_FluxGHOST_HNS$TS<-TimeSteps

# Graphing 

P_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=P_Diff*30.97*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=TS, y=P_Diff*30.97*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=TS, y=P_Diff*30.97*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=TS, y=P_Diff*30.97*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  
  labs(x="Year", y="P Potential-Actual Uptake Difference (kg/ha)")





png('P_Diff.png', height=480, width=600)
plot(P_Diff)
dev.off()

N_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=TS, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=TS, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=TS, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  
  labs(x="Year", y="N Potential-Actual Uptake Difference (kg/ha)")

png('N_Diff.png', height=480, width=600)
plot(N_Diff)
dev.off()

Ca_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=TS, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=TS, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=TS, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  
  labs(x="Year", y="Ca Potential-Actual Uptake Difference (kg/ha)")

png('Ca_Diff.png', height=480, width=600)
plot(Ca_Diff)
dev.off()

Mg_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=TS, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=TS, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=TS, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  
  labs(x="Year", y="Mg Potential-Actual Uptake Difference (kg/ha)")

png('Mg_Diff.png', height=480, width=600)
plot(Mg_Diff)
dev.off()

K_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=TS, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=TS, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=TS, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  
  labs(x="Year", y="K Potential-Actual Uptake Difference (kg/ha)")

png('K_Diff.png', height=480, width=600)
plot(K_Diff)
dev.off()

S_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  
  labs(x="Year", y="S Potential-Actual Uptake Difference (kg/ha)")

png('S_Diff.png', height=480, width=600)
plot(S_Diff)
dev.off()


THRU_Flux_LNS<-Above_Flux_LNS %>% select (c("K_THRU",  "Mg_THRU", "Ca_THRU"))

Plant_Pool_LNSED<-cbind(Plant_Pool_LNSED, THRU_Flux_LNS)

THRU_Flux_HNS<-Above_Flux_HNS %>% select (c("K_THRU",  "Mg_THRU", "Ca_THRU"))

Plant_Pool_HNSED<-cbind(Plant_Pool_HNSED, THRU_Flux_HNS)

THRU_Flux_LNB<-Above_Flux_LNB %>% select (c("K_THRU",  "Mg_THRU", "Ca_THRU"))

Plant_Pool_LNBAS<-cbind(Plant_Pool_LNBAS, THRU_Flux_LNB)

THRU_Flux_HNB<-Above_Flux_HNB %>% select (c("K_THRU",  "Mg_THRU", "Ca_THRU"))

Plant_Pool_HNBAS<-cbind(Plant_Pool_HNBAS, THRU_Flux_HNB)

LNSED_All_Nut<- ggplot(Plant_Pool_LNSED, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_THRU+K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_THRU+Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_THRU+Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))

LNSED_REL<-ggplot(Plant_Pool_LNSED, mapping= aes(x=TS, y=100*(S_Diff*32.065*10000/1e6/1000)/(S_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=100*((K_Diff*39.0983*10000/1e6/1000)+K_THRU)/((K_PU*39.0983*10000/1e6/1000)+K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=100*((Mg_Diff*24.305*10000/1e6/1000)+Mg_THRU)/((Mg_PU*24.305*10000/1e6/1000)+Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=100*((Ca_Diff*40.078*10000/1e6/1000)+Ca_THRU)/((Ca_PU*40.078*10000/1e6/1000)+Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=100*(N_Diff*14.0067*10000/1e6/1000)/(N_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=100*(P_Diff*30.97*10000/1e6/1000)/(P_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 25,50, 75, 100))+
  coord_cartesian(ylim = c(0, 100))

png('LNSED_All_Nut.png', height=480, width=650, res=125)
plot(LNSED_All_Nut)
dev.off()


HNSED_All_Nut<- ggplot(Plant_Pool_HNSED, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_THRU+K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_THRU+Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_THRU+Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))

HNSED_REL<-ggplot(Plant_Pool_HNSED, mapping= aes(x=TS, y=100*(S_Diff*32.065*10000/1e6/1000)/(S_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=100*((K_Diff*39.0983*10000/1e6/1000)+K_THRU)/((K_PU*39.0983*10000/1e6/1000)+K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=100*((Mg_Diff*24.305*10000/1e6/1000)+Mg_THRU)/((Mg_PU*24.305*10000/1e6/1000)+Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=100*((Ca_Diff*40.078*10000/1e6/1000)+Ca_THRU)/((Ca_PU*40.078*10000/1e6/1000)+Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=100*(N_Diff*14.0067*10000/1e6/1000)/(N_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=100*(P_Diff*30.97*10000/1e6/1000)/(P_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 25,50, 75, 100))+
  coord_cartesian(ylim = c(0, 100))


png('HNSED_All_Nut.png', height=480, width=650, res=125)
plot(HNSED_All_Nut)
dev.off()


LNBAS_All_Nut<- ggplot(Plant_Pool_LNBAS, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_THRU+K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_THRU+Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_THRU+Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))

LNBAS_REL<-ggplot(Plant_Pool_LNBAS, mapping= aes(x=TS, y=100*(S_Diff*32.065*10000/1e6/1000)/(S_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=100*((K_Diff*39.0983*10000/1e6/1000)+Above_Flux_LNB$K_THRU)/((K_PU*39.0983*10000/1e6/1000)+K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=100*((Mg_Diff*24.305*10000/1e6/1000)+Above_Flux_LNB$Mg_THRU)/((Mg_PU*24.305*10000/1e6/1000)+Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=100*((Ca_Diff*40.078*10000/1e6/1000)+Above_Flux_LNB$Ca_THRU)/((Ca_PU*40.078*10000/1e6/1000)+Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=100*(N_Diff*14.0067*10000/1e6/1000)/(N_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=100*(P_Diff*30.97*10000/1e6/1000)/(P_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 25,50, 75, 100))+
  coord_cartesian(ylim = c(0, 100))



png('LNBAS_All_Nut.png', height=480, width=650, res=125)
plot(LNBAS_All_Nut)
dev.off()


HNBAS_All_Nut<- ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_THRU+K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_THRU+Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_THRU+Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))


HNBAS_REL<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=TS, y=100*(S_Diff*32.065*10000/1e6/1000)/(S_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=100*((K_Diff*39.0983*10000/1e6/1000)+K_THRU)/((K_PU*39.0983*10000/1e6/1000)+K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=100*((Mg_Diff*24.305*10000/1e6/1000)+Mg_THRU)/((Mg_PU*24.305*10000/1e6/1000)+Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=100*((Ca_Diff*40.078*10000/1e6/1000)+Ca_THRU)/((Ca_PU*40.078*10000/1e6/1000)+Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=100*(N_Diff*14.0067*10000/1e6/1000)/(N_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=100*(P_Diff*30.97*10000/1e6/1000)/(P_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(0, 25,50, 75, 100))+
  coord_cartesian(ylim = c(0, 100))




png('HNBAS_All_Nut.png', height=480, width=650, res=125)
plot(HNBAS_All_Nut)
dev.off()

ggarrange(LNSED_All_Nut, HNSED_All_Nut ,LNBAS_All_Nut,HNBAS_All_Nut, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1) %>%
  annotate_figure(left = textGrob(expression("Uptake Deficit ( kg"~'⋅'~ha^{-1}~'⋅'~year^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                                    font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3)), top=textGrob("40 BO")) %>%
  ggexport(filename="QuadDiff.png", height=1000, width=1000, res=100)


ggarrange(LNSED_REL, HNSED_REL ,LNBAS_REL,HNBAS_REL, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1) %>%
  annotate_figure(left = textGrob(expression("Relative Uptake Deficit (%)"), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3)), top=textGrob("40 BO")) %>%
  ggexport(filename="REL_Diff.png", height=1000, width=1000, res=100)


