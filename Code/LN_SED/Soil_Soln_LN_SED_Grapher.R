rm(list = ls())
library(ggplot2)
library(scales)



setwd("~/Project_Master/Test_Rep/Output_LN_SED/Soil_Solution")

Soil_Solution_All<-read.csv2("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Soil_Solution_All$group_id<-as.character(Soil_Solution_All$group_id)
Soil_Solution_All$Date<-as.Date(Soil_Solution_All$Date)

Test_Plot<-ggplot(subset(Soil_Solution_All, group_id %in% c("1" , "2", "3", "4", "5", "6", "7", "8")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+facet_wrap(~group_id, ncol=2)+theme(panel.spacing.x = unit(8, "mm"))+
  scale_x_date(labels = date_format("%m-%Y"))