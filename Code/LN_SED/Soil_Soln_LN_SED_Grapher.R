rm(list = ls())
library(ggplot2)
library(scales)



setwd("~/Project_Master/Test_Rep/Output_LN_SED/Soil_Solution")

Soil_Solution_All<-read.csv2("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Soil_Solution_All$group_id<-as.character(Soil_Solution_All$group_id)
Soil_Solution_All$Date<-as.Date(Soil_Solution_All$Date)

#Leaching Fluxes

All_Leaching_Flux<-ggplot(subset(Soil_Solution_All, group_id %in% c("1" , "2", "3", "4", "5", "6", "7", "8")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+facet_wrap(~group_id, ncol=2)+theme(panel.spacing.x = unit(4, "mm"))+
  scale_x_date(labels = date_format("%m-%Y"))+labs(y="Ca Leaching Flux Per Soil Layer (kg/ha/yr)")


#Litterfow


#Soil Solution

Ca_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y="Ca Leaching Flux Per Soil Layer (kg/ha/yr)")

Ca_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y="Ca Leaching Flux Per Soil Layer (kg/ha/yr)")


Mg_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y="Mg Leaching Flux Per Soil Layer (kg/ha/yr)")

Mg_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y="Mg Leaching Flux Per Soil Layer (kg/ha/yr)")