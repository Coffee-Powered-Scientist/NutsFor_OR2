
# Compares Uptake Lim. Line Graphs to one another, this file is for 80_WTH case
rm(list = ls())

library(ggplot2)
library(dplyr)
library(reshape2)
library(scales)

# Working directory set below




# Update

source("~/Project_Master/Test_Rep/Code/HN_BAS/80_WTH/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/80_WTH/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/80_WTH/Plant_Pool_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/80_WTH/Plant_Pool_Mutator.R")

# HN BAS File Reading\

Plant_Pool_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_HNBAS$ID<-"HNBAS"

Plant_Pool_HNBAS$Year<-as.Date(paste(Plant_Pool_HNBAS$Year, 1, 1, sep = "-"))

# LN BAS File Reading

Plant_Pool_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_LNBAS$ID<-"LNBAS"

Plant_Pool_LNBAS$Year<-as.Date(paste(Plant_Pool_LNBAS$Year, 1, 1, sep = "-"))


# HN SED File Reading

Plant_Pool_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_HNSED$ID<-"HNSED"

Plant_Pool_HNSED$Year<-as.Date(paste(Plant_Pool_HNSED$Year, 1, 1, sep = "-"))

# LN SED File Reading

Plant_Pool_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Plant_Pool.csv")
Plant_Pool_LNSED$ID<-"LNSED"

Plant_Pool_LNSED$Year<-as.Date(paste(Plant_Pool_LNSED$Year, 1, 1, sep = "-"))

# rbind

All_Df<-cbind(Plant_Pool_HNBAS, Plant_Pool_LNBAS, Plant_Pool_LNSED, Plant_Pool_HNSED)

# SET WD (Needs to ve here)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_WTH")
# Graphing 

P_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=P_Diff, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=P_Diff, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=P_Diff, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=P_Diff, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="P Potential-Actual Uptake Difference")

png('P_Diff.png', height=480, width=600)
plot(P_Diff)
dev.off()

N_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=N_Diff, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=N_Diff, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=N_Diff, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=N_Diff, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="N Potential-Actual Uptake Difference")

png('N_Diff.png', height=480, width=600)
plot(N_Diff)
dev.off()

Ca_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=Ca_Diff, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=Ca_Diff, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=Ca_Diff, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=Ca_Diff, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="Ca Potential-Actual Uptake Difference")

png('Ca_Diff.png', height=480, width=600)
plot(Ca_Diff)
dev.off()

Mg_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=Mg_Diff, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=Mg_Diff, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=Mg_Diff, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=Mg_Diff, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="Mg Potential-Actual Uptake Difference")

png('Mg_Diff.png', height=480, width=600)
plot(Mg_Diff)
dev.off()

K_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=K_Diff, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=K_Diff, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=K_Diff, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=K_Diff, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="K Potential-Actual Uptake Difference")

png('K_Diff.png', height=480, width=600)
plot(K_Diff)
dev.off()

S_Diff<-ggplot(Plant_Pool_HNBAS, mapping= aes(x=Year, y=S_Diff, color=ID))+geom_line()+ 
  geom_point(Plant_Pool_HNBAS, mapping= aes(shape=ID, color=ID),size= 2)+
  geom_line(Plant_Pool_LNBAS, mapping= aes(x=Year, y=S_Diff, color=ID))+
  geom_point(Plant_Pool_LNBAS, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_LNSED, mapping= aes(x=Year, y=S_Diff, color=ID))+
  geom_point(Plant_Pool_LNSED, mapping= aes(shape=ID, color=ID), size=2)+
  geom_line(Plant_Pool_HNSED, mapping= aes(x=Year, y=S_Diff, color=ID))+
  geom_point(Plant_Pool_HNSED, mapping= aes(shape=ID, color=ID), size=2)+
  scale_x_date(labels = date_format("%Y"))+
  labs(x="Year", y="S Potential-Actual Uptake Difference")

png('S_Diff.png', height=480, width=600)
plot(S_Diff)
dev.off()