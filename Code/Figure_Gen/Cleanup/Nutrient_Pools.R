
rm(list = ls())

library(dplyr)
library(lubridate)
library(ggplot2)
library(ggpubr)
library(RColorBrewer)

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/CEC_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/SOM_Mutator.R")

setwd("~/Project_Master/Test_Rep/Manuscript/Images/LN_SED/40_BO")

SOM_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/SOM.csv")


SOM_LNS<-SOM %>%group_by(Year, Month)%>% select(-Date) %>% summarize(across(C:P, ~sum(.x, na.rm = TRUE))) %>%
  mutate(Date = make_date(Year, Month)) %>% filter(Month %in% 1)




CEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/CEC_All.csv", header=TRUE)
Litter_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Litter_Pool.csv", header=TRUE)

Litter_All_LNS<-Litter_All %>% filter(Month %in% 1)


CEC_All_LNS$Date<-as.Date(CEC_All$Date)

CEC_All_LNS[, "year"] <- format(CEC_All[,"Date"], "%Y")
CEC_All_LNS[, "month"] <- format(CEC_All[,"Date"], "%m")

CEC_LNS<-CEC_All %>% group_by(year, month) %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Date=make_date(year, month))%>% 
  filter(month %in% "01")

CE_LNSC$Date<-as.Date(CEC$Date)

ggplot(CEC_LNS, aes(x=Date, y=CEC_LNS$Ca/6230.915+Litter_All_LNS$Ca/6230.915, color="Ca", linetype="Ca")) + geom_line()+
  geom_line(aes(y=CEC_LNS$Mg/2448.663+Litter_All_LNS$Mg/2448.663, color="Mg", linetype="Mg"))+
  geom_line(aes(y=CEC_LNS$K/1325.840+Litter_All_LNS$K/1325.840, color="K", linetype="K"))+
  geom_line(SOM_LNS, mapping=aes(y=N*14*10/8263+Litter_All$N/8263, color="N", linetype="N"))+
  geom_line(SOM_LNS, mapping=aes(y=P*30.974*10/586.2+Litter_All_LNS$P/586.2, color="P", linetype="P"))+
  geom_line(SOM_LNS, mapping=aes(y=S*32.065*10/754+Litter_All_LNS$S/754, color="S", linetype="S"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"))+
  theme_classic2()+
  labs(color  = "Species", linetype="Species")+
  geom_hline(yintercept= 1)+
  ggtitle("LN Sedimentary")+
  labs(x="Year", y="Change in Nutrient Pool Size")+
  theme(plot.title = element_text(hjust = 0.5))
  

  