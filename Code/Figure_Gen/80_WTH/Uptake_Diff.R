
# Compares Uptake Lim. Line Graphs to one another, this file is for 80_WTH case
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

source("~/Project_Master/Test_Rep/Code/HN_BAS/80_WTH/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/80_WTH/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/80_WTH/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/80_WTH/Plant_Pool_Mutator.R")


source("~/Project_Master/Test_Rep/Code/HN_BAS/80_WTH/Plant_Pool_Ghost.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/80_WTH/Plant_Pool_Ghost.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/80_WTH/Plant_Pool_Ghost.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/80_WTH/Plant_Pool_Ghost.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/80_WTH/Above_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/80_WTH/Above_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/80_WTH/Above_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/80_WTH/Above_Mutator.R")


source("~/Project_Master/Test_Rep/Code/HN_BAS/80_WTH/Above_Ghost.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/80_WTH/Above_Ghost.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/80_WTH/Above_Ghost.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/80_WTH/Above_Ghost.R")

# HN BAS File Reading

Plant_Pool_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_HNBAS_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_HNBAS$ID<-"HNBAS"

Above_FluxGHOST_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Abov_Flux.csv")

Plant_Pool_HNBAS$Year<-as.Date(paste(Plant_Pool_HNBAS$Year, 1, 1, sep = "-"))

# LN BAS File Reading

Plant_Pool_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_LNBAS_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_LNBAS$ID<-"LNBAS"

Above_FluxGHOST_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Abov_Flux.csv")

Plant_Pool_LNBAS$Year<-as.Date(paste(Plant_Pool_LNBAS$Year, 1, 1, sep = "-"))


# HN SED File Reading

Plant_Pool_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Plant_Pool.csv")

Plant_Pool_HNSED_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_HNSED$ID<-"HNSED"

Above_FluxGHOST_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Abov_Flux.csv")

Plant_Pool_HNSED$Year<-as.Date(paste(Plant_Pool_HNSED$Year, 1, 1, sep = "-"))

# LN SED File Reading

Plant_Pool_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_LNSED_Ghost<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Plant_Pool_Ghost.csv")
Plant_Pool_LNSED$ID<-"LNSED"

Above_FluxGHOST_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Abov_Flux_Ghost.csv")
Above_Flux_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Abov_Flux.csv")

Plant_Pool_LNSED$Year<-as.Date(paste(Plant_Pool_LNSED$Year, 1, 1, sep = "-"))


# rbind

All_Df<-cbind(Plant_Pool_HNBAS, Plant_Pool_LNBAS, Plant_Pool_LNSED, Plant_Pool_HNSED)

# SET WD (Needs to ve here)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_WTH")


# Graphing 

P_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=P_Diff*30.97*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=P_Diff*30.97*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=P_Diff*30.97*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=P_Diff*30.97*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="P Potential-Actual Uptake Difference (kg/ha)")





png('P_Diff.png', height=480, width=600)
plot(P_Diff)
dev.off()

N_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=N_Diff*14.0067*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="N Potential-Actual Uptake Difference (kg/ha)")

png('N_Diff.png', height=480, width=600)
plot(N_Diff)
dev.off()

Ca_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=Ca_Diff*40.078*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="Ca Potential-Actual Uptake Difference (kg/ha)")

png('Ca_Diff.png', height=480, width=600)
plot(Ca_Diff)
dev.off()

Mg_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=Mg_Diff*24.305*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="Mg Potential-Actual Uptake Difference (kg/ha)")

png('Mg_Diff.png', height=480, width=600)
plot(Mg_Diff)
dev.off()

K_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=K_Diff*39.0983*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="K Potential-Actual Uptake Difference (kg/ha)")

png('K_Diff.png', height=480, width=600)
plot(K_Diff)
dev.off()

S_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="S Potential-Actual Uptake Difference (kg/ha)")

png('S_Diff.png', height=480, width=600)
plot(S_Diff)
dev.off()

LNSED_All_Nut<- ggplot(Plant_Pool_LNSED, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(-5, -10, -15,-20, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(-20, 20))

LNSED_REL<-ggplot(Plant_Pool_LNSED, mapping= aes(x=Year, y=(S_Diff*32.065*10000/1e6/1000)/(Plant_Pool_LNSED_Ghost$SG_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=((K_Diff*39.0983*10000/1e6/1000)+Above_Flux_LNS$K_THRU)/((Plant_Pool_LNSED_Ghost$KG_PU*39.0983*10000/1e6/1000)+Above_FluxGHOST_LNS$K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=((Mg_Diff*24.305*10000/1e6/1000)+Above_Flux_LNS$Mg_THRU)/((Plant_Pool_LNSED_Ghost$MgG_PU*24.305*10000/1e6/1000)+Above_FluxGHOST_LNS$Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=((Ca_Diff*40.078*10000/1e6/1000)+Above_Flux_LNS$Ca_THRU)/((Plant_Pool_LNSED_Ghost$CaG_PU*40.078*10000/1e6/1000)+Above_FluxGHOST_LNS$Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=(N_Diff*14.0067*10000/1e6/1000)/(Plant_Pool_LNSED_Ghost$NG_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=(P_Diff*30.97*10000/1e6/1000)/(Plant_Pool_LNSED_Ghost$PG_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(.25,.5, .75, 1))+
  coord_cartesian(ylim = c(0, 1))

png('LNSED_All_Nut.png', height=480, width=650, res=125)
plot(LNSED_All_Nut)
dev.off()


HNSED_All_Nut<- ggplot(Plant_Pool_HNSED, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(-5, -10, -15,-20, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(-20, 20))

HNSED_REL<-ggplot(Plant_Pool_HNSED, mapping= aes(x=Year, y=(S_Diff*32.065*10000/1e6/1000)/(Plant_Pool_HNSED_Ghost$SG_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=((K_Diff*39.0983*10000/1e6/1000)+Above_Flux_HNS$K_THRU)/((Plant_Pool_HNSED_Ghost$KG_PU*39.0983*10000/1e6/1000)+Above_FluxGHOST_HNS$K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=((Mg_Diff*24.305*10000/1e6/1000)+Above_Flux_HNS$Mg_THRU)/((Plant_Pool_HNSED_Ghost$MgG_PU*24.305*10000/1e6/1000)+Above_FluxGHOST_HNS$Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=((Ca_Diff*40.078*10000/1e6/1000)+Above_Flux_HNS$Ca_THRU)/((Plant_Pool_HNSED_Ghost$CaG_PU*40.078*10000/1e6/1000)+Above_FluxGHOST_HNS$Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=(N_Diff*14.0067*10000/1e6/1000)/(Plant_Pool_HNSED_Ghost$NG_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=(P_Diff*30.97*10000/1e6/1000)/(Plant_Pool_HNSED_Ghost$PG_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Sedimentary", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(.25,.5, .75, 1))+
  coord_cartesian(ylim = c(0, 1))


png('HNSED_All_Nut.png', height=480, width=650, res=125)
plot(HNSED_All_Nut)
dev.off()


LNBAS_All_Nut<- ggplot(Plant_Pool_LNBAS, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(-5, -10, -15,-20, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(-20, 20))

LNBAS_REL<-ggplot(Plant_Pool_LNBAS, mapping= aes(x=Year, y=(S_Diff*32.065*10000/1e6/1000)/(Plant_Pool_LNBAS_Ghost$SG_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=((K_Diff*39.0983*10000/1e6/1000)+Above_Flux_LNB$K_THRU)/((Plant_Pool_LNBAS_Ghost$KG_PU*39.0983*10000/1e6/1000)+Above_FluxGHOST_LNB$K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=((Mg_Diff*24.305*10000/1e6/1000)+Above_Flux_LNB$Mg_THRU)/((Plant_Pool_LNBAS_Ghost$MgG_PU*24.305*10000/1e6/1000)+Above_FluxGHOST_LNB$Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=((Ca_Diff*40.078*10000/1e6/1000)+Above_Flux_LNB$Ca_THRU)/((Plant_Pool_LNBAS_Ghost$CaG_PU*40.078*10000/1e6/1000)+Above_FluxGHOST_LNB$Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=(N_Diff*14.0067*10000/1e6/1000)/(Plant_Pool_LNBAS_Ghost$NG_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=(P_Diff*30.97*10000/1e6/1000)/(Plant_Pool_LNBAS_Ghost$PG_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="Low N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(-.25,.25,.5, .75, 1))+
  coord_cartesian(ylim = c(0, 1))




png('LNBAS_All_Nut.png', height=480, width=650, res=125)
plot(LNBAS_All_Nut)
dev.off()


HNBAS_All_Nut<- ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=S_Diff*32.065*10000/1e6/1000, color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=K_Diff*39.0983*10000/1e6/1000, color="K", linetype="K"))+
  geom_line(aes(y=Mg_Diff*24.305*10000/1e6/1000, color="Mg", linetype="Mg"))+
  geom_line(aes(y=Ca_Diff*40.078*10000/1e6/1000, color="Ca", linetype="Ca"))+
  geom_line(aes(y=N_Diff*14.0067*10000/1e6/1000, color="N", linetype="N"))+
  geom_line(aes(y=P_Diff*30.97*10000/1e6/1000, color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(-5, -10, -15,-20, 5, 10, 15, 20))+
  coord_cartesian(ylim = c(-20, 20))


HNBAS_REL<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=(S_Diff*32.065*10000/1e6/1000)/(Plant_Pool_HNBAS_Ghost$SG_PU*32.065*10000/1e6/1000), color="S", linetype="S"))+geom_line()+ 
  geom_line(aes(y=((K_Diff*39.0983*10000/1e6/1000)+Above_Flux_HNB$K_THRU)/((Plant_Pool_HNBAS_Ghost$KG_PU*39.0983*10000/1e6/1000)+Above_FluxGHOST_HNB$K_THRU), color="K", linetype="K"))+
  geom_line(aes(y=((Mg_Diff*24.305*10000/1e6/1000)+Above_Flux_HNB$Mg_THRU)/((Plant_Pool_HNBAS_Ghost$MgG_PU*24.305*10000/1e6/1000)+Above_FluxGHOST_HNB$Mg_THRU), color="Mg", linetype="Mg"))+
  geom_line(aes(y=((Ca_Diff*40.078*10000/1e6/1000)+Above_Flux_HNB$Ca_THRU)/((Plant_Pool_HNBAS_Ghost$CaG_PU*40.078*10000/1e6/1000)+Above_FluxGHOST_HNB$Ca_THRU), color="Ca", linetype="Ca"))+
  geom_line(aes(y=(N_Diff*14.0067*10000/1e6/1000)/(Plant_Pool_HNBAS_Ghost$NG_PU*14.0067*10000/1e6/1000), color="N", linetype="N"))+
  geom_line(aes(y=(P_Diff*30.97*10000/1e6/1000)/(Plant_Pool_HNBAS_Ghost$PG_PU*30.97*10000/1e6/1000), color="P", linetype="P"))+
  scale_x_date(labels = date_format("%Y"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  labs(x=NULL, y=NULL, color="Nutrient", title="High N Basalt", linetype="Nutrient")+
  theme_bw()+theme(plot.title = element_text(hjust = 0.5),  text=element_text(family="A", size=15), strip.text.x = element_text(size = 15))+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"))+
  scale_y_continuous(breaks=c(.25,.5, .75, 1))+
  coord_cartesian(ylim = c(0, 1))



png('HNBAS_All_Nut.png', height=480, width=650, res=125)
plot(HNBAS_All_Nut)
dev.off()

ggarrange(LNSED_All_Nut, HNSED_All_Nut ,LNBAS_All_Nut,HNBAS_All_Nut, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1) %>%
  annotate_figure(left = textGrob(expression("Uptake Deficit ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="QuadDiff.png", height=1000, width=1000, res=100)


ggarrange(LNSED_REL, HNSED_REL ,LNBAS_REL,HNBAS_REL, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1) %>%
  annotate_figure(left = textGrob(expression("Uptake Deficit : Potential Uptake"), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="REL_Diff.png", height=1000, width=1000, res=100)
