rm(list = ls())
library(ggplot2)
library(multipanelfigure)

setwd("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Soil_Solution")

Soil_Solution_All<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)

#Pass Date through as.Date; some error in code which causes Date to output as character, switch group_id to character
Soil_Solution_All$group_id<-as.character(Soil_Solution_All$group_id)
Soil_Solution_All$Date<-as.Date(Soil_Solution_All$Date)


#Source Functions
source("~/Project_Master/Test_Rep/Code/Functions/Grapher_Cal_Soil_R.R")
#This part of the code is very slow; lots of objects being moved around. 


Ca_L1<-Ca_SS_L1(Soil_Solution_All)
Ca_L2<-Ca_SS_L2(Soil_Solution_All)

Mg_L1<-Mg_SS_L1(Soil_Solution_All)
Mg_L2<-Mg_SS_L2(Soil_Solution_All)


