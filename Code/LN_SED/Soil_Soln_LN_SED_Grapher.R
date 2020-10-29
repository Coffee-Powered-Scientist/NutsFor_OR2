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


L1<-Ca_SS_L1(Soil_Solution_All)
L2<-Ca_SS_L2(Soil_Solution_All)

All_Cations_All_Layers_L1<- multi_panel_figure(columns = 3, rows = 2, panel_label_type = "none")
All_Cations_All_Layers_L1<-All_Cations_All_Layers_L1 %<>%
  fill_panel(Ca_SS_L1_TOT, column = 1, row = 1) %<>%
  fill_panel(Mg_SS_L1_TOT, column = 2, row = 1)%<>%
  fill_panel(K_SS_L1_TOT, column = 3, row = 1)%<>%
  fill_panel(Na_SS_L1_TOT, column = 1, row = 2)%<>%
  fill_panel(Al_SS_L1_TOT, column = 2, row = 2)%<>%
  fill_panel(NH4_SS_L1_TOT, column = 3, row = 2)
pdf("All_Cations_All_Layers_L1.pdf", height=10, width=20)
plot(All_Cations_All_Layers_L1)
dev.off()


All_Cations_All_Layers_L2<- multi_panel_figure(columns = 3, rows = 2, panel_label_type = "none")
All_Cations_All_Layers_L2<-All_Cations_All_Layers_L2 %<>%
  fill_panel(Ca_SS_L2_TOT, column = 1, row = 1) %<>%
  fill_panel(Mg_SS_L2_TOT, column = 2, row = 1)%<>%
  fill_panel(K_SS_L2_TOT, column = 3, row = 1)%<>%
  fill_panel(Na_SS_L2_TOT, column = 1, row = 2)%<>%
  fill_panel(Al_SS_L2_TOT, column = 2, row = 2)%<>%
  fill_panel(NH4_SS_L2_TOT, column = 3, row = 2)
pdf("All_Cations_All_Layers_L2.pdf", height=10, width=20)
plot(All_Cations_All_Layers_L2)
dev.off()


All_Cations_1<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none", row_spacing = 5)

All_Cations_1<-All_Cations_1 %<>%
  fill_panel(SSL1Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL1Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL1K.G, column = 3, row = 1)%<>%
  fill_panel(SSL1Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL1Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL1pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL1NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL1Cl.G, column=1, row=3)%<>%
  fill_panel(SSL1R.G, column=3, row=3)%<>%
  fill_panel(SSL1NO3.G, column=1, row=4)%<>%
  fill_panel(SSL1SO4.G, column=3, row=4)
pdf("All_Cations_1.pdf", height=10, width=20)
plot(All_Cations_1)
dev.off()

All_Cations_2<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_2<-All_Cations_2 %<>%
  fill_panel(SSL2Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL2Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL2K.G, column = 3, row = 1)%<>%
  fill_panel(SSL2Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL2Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL2pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL2NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL2Cl.G, column=1, row=3)%<>%
  fill_panel(SSL2R.G, column=3, row=3)%<>%
  fill_panel(SSL2NO3.G, column=1, row=4)%<>%
  fill_panel(SSL2SO4.G, column=3, row=4)
pdf("All_Cations_2.pdf", height=10, width=20)
plot(All_Cations_2)
dev.off()

All_Cations_3<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_3<-All_Cations_3 %<>%
  fill_panel(SSL3Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL3Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL3K.G, column = 3, row = 1)%<>%
  fill_panel(SSL3Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL3Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL3pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL3NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL3Cl.G, column=1, row=3)%<>%
  fill_panel(SSL3R.G, column=3, row=3)%<>%
  fill_panel(SSL3NO3.G, column=1, row=4)%<>%
  fill_panel(SSL3SO4.G, column=3, row=4)
pdf("All_Cations_3.pdf", height=10, width=20)
plot(All_Cations_3)
dev.off()

All_Cations_4<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_4<-All_Cations_4 %<>%
  fill_panel(SSL4Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL4Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL4K.G, column = 3, row = 1)%<>%
  fill_panel(SSL4Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL4Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL4pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL4NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL4Cl.G, column=1, row=3)%<>%
  fill_panel(SSL4R.G, column=3, row=3)%<>%
  fill_panel(SSL4NO3.G, column=1, row=4)%<>%
  fill_panel(SSL4SO4.G, column=3, row=4)
pdf("All_Cations_4.pdf", height=10, width=20)
plot(All_Cations_4)
dev.off()

All_Cations_5<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_5<-All_Cations_5 %<>%
  fill_panel(SSL5Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL5Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL5K.G, column = 3, row = 1)%<>%
  fill_panel(SSL5Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL5Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL5pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL5NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL5Cl.G, column=1, row=3)%<>%
  fill_panel(SSL5R.G, column=3, row=3)%<>%
  fill_panel(SSL5NO3.G, column=1, row=4)%<>%
  fill_panel(SSL5SO4.G, column=3, row=4)
pdf("All_Cations_5.pdf", height=10, width=20)
plot(All_Cations_5)
dev.off()

All_Cations_6<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_6<-All_Cations_6 %<>%
  fill_panel(SSL6Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL6Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL6K.G, column = 3, row = 1)%<>%
  fill_panel(SSL6Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL6Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL6pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL6NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL6Cl.G, column=1, row=3)%<>%
  fill_panel(SSL6R.G, column=3, row=3)%<>%
  fill_panel(SSL6NO3.G, column=1, row=4)%<>%
  fill_panel(SSL6SO4.G, column=3, row=4)
pdf("All_Cations_6.pdf", height=10, width=20)
plot(All_Cations_6)
dev.off()

All_Cations_7<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_7<-All_Cations_7 %<>%
  fill_panel(SSL7Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL7Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL7K.G, column = 3, row = 1)%<>%
  fill_panel(SSL7Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL7Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL7pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL7NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL7Cl.G, column=1, row=3)%<>%
  fill_panel(SSL7R.G, column=3, row=3)%<>%
  fill_panel(SSL7NO3.G, column=1, row=4)%<>%
  fill_panel(SSL7SO4.G, column=3, row=4)
pdf("All_Cations_7.pdf", height=10, width=20)
plot(All_Cations_7)
dev.off()

All_Cations_8<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_8<-All_Cations_8 %<>%
  fill_panel(SSL8Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL8Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL8K.G, column = 3, row = 1)%<>%
  fill_panel(SSL8Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL8Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL8pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL8NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL8Cl.G, column=1, row=3)%<>%
  fill_panel(SSL8R.G, column=3, row=3)%<>%
  fill_panel(SSL8NO3.G, column=1, row=4)%<>%
  fill_panel(SSL8SO4.G, column=3, row=4)
pdf("All_Cations_8.pdf", height=10, width=20)
plot(All_Cations_8)
dev.off()



  

