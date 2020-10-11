#This Code will take soil solution concentration data from all 8 layers of simulated ecosystem
#This code will then stich the needed data together into a single .csv, and export to "Edited Data"
#The code will then source to another 2 graphing codes, which tend to be very slow
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output_LN_BAS/Edited Data")
library(dplyr)
Nuts_For_SSL1<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 1.csv", sep=";", header=TRUE)
Nuts_For_SSL3<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 3.csv", sep=";", header=TRUE)
Nuts_For_SSL2<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 2.csv", sep=";", header=TRUE)
Nuts_For_SSL4<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 4.csv", sep=";", header=TRUE)
Nuts_For_SSL5<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 5.csv", sep=";", header=TRUE)
Nuts_For_SSL6<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 6.csv", sep=";", header=TRUE)
Nuts_For_SSL7<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 7.csv", sep=";", header=TRUE)
Nuts_For_SSL8<-read.csv("~/NutsForBASLN/Output data/Soil solution/Soil solution chemistry Layer 8.csv", sep=";", header=TRUE)
Nuts_For_Leaching<-read.csv("~/NutsForBASLN/Output data/Soil solution/Leaching Layer 8.csv", sep=";", header=TRUE)

Nuts_For_SSL1$Ca_L1<-Nuts_For_SSL1$Ca
Nuts_For_SSL1$Mg_L1<-Nuts_For_SSL1$Mg
Nuts_For_SSL1$K_L1<-Nuts_For_SSL1$K
Nuts_For_SSL1$Na_L1<-Nuts_For_SSL1$Na
Nuts_For_SSL1$NO3_L1<-Nuts_For_SSL1$NO3
Nuts_For_SSL1$K_L1<-Nuts_For_SSL1$K
Nuts_For_SSL1$NH4_L1<-Nuts_For_SSL1$NH4
Nuts_For_SSL1$SO4_L1<-Nuts_For_SSL1$SO4
Nuts_For_SSL1$Cl_L1<-Nuts_For_SSL1$Cl
Nuts_For_SSL1$P_L1<-Nuts_For_SSL1$P
Nuts_For_SSL1$DOC_L1<-Nuts_For_SSL1$DOC
Nuts_For_SSL1$pH_L1<-Nuts_For_SSL1$pH
Nuts_For_SSL1$Al_L1<-Nuts_For_SSL1$Al
Nuts_For_SSL1$R_L1<-Nuts_For_SSL1$R
Nuts_For_SSL1$HR_L1<-Nuts_For_SSL1$HR
Nuts_For_SSL1$Si_L1<-Nuts_For_SSL1$Si


Nuts_For_SSL2$Ca_L2<-Nuts_For_SSL2$Ca
Nuts_For_SSL2$Mg_L2<-Nuts_For_SSL2$Mg
Nuts_For_SSL2$K_L2<-Nuts_For_SSL2$K
Nuts_For_SSL2$Na_L2<-Nuts_For_SSL2$Na
Nuts_For_SSL2$NO3_L2<-Nuts_For_SSL2$NO3
Nuts_For_SSL2$K_L2<-Nuts_For_SSL2$K
Nuts_For_SSL2$NH4_L2<-Nuts_For_SSL2$NH4
Nuts_For_SSL2$SO4_L2<-Nuts_For_SSL2$SO4
Nuts_For_SSL2$Cl_L2<-Nuts_For_SSL2$Cl
Nuts_For_SSL2$P_L2<-Nuts_For_SSL2$P
Nuts_For_SSL2$DOC_L2<-Nuts_For_SSL2$DOC
Nuts_For_SSL2$pH_L2<-Nuts_For_SSL2$pH
Nuts_For_SSL2$Al_L2<-Nuts_For_SSL2$Al
Nuts_For_SSL2$R_L2<-Nuts_For_SSL2$R
Nuts_For_SSL2$HR_L2<-Nuts_For_SSL2$HR
Nuts_For_SSL2$Si_L2<-Nuts_For_SSL2$Si


Nuts_For_SSL3$Ca_L3<-Nuts_For_SSL3$Ca
Nuts_For_SSL3$Mg_L3<-Nuts_For_SSL3$Mg
Nuts_For_SSL3$K_L3<-Nuts_For_SSL3$K
Nuts_For_SSL3$Na_L3<-Nuts_For_SSL3$Na
Nuts_For_SSL3$NO3_L3<-Nuts_For_SSL3$NO3
Nuts_For_SSL3$K_L3<-Nuts_For_SSL3$K
Nuts_For_SSL3$NH4_L3<-Nuts_For_SSL3$NH4
Nuts_For_SSL3$SO4_L3<-Nuts_For_SSL3$SO4
Nuts_For_SSL3$Cl_L3<-Nuts_For_SSL3$Cl
Nuts_For_SSL3$P_L3<-Nuts_For_SSL3$P
Nuts_For_SSL3$DOC_L3<-Nuts_For_SSL3$DOC
Nuts_For_SSL3$pH_L3<-Nuts_For_SSL3$pH
Nuts_For_SSL3$Al_L3<-Nuts_For_SSL3$Al
Nuts_For_SSL3$R_L3<-Nuts_For_SSL3$R
Nuts_For_SSL3$HR_L3<-Nuts_For_SSL3$HR
Nuts_For_SSL3$Si_L3<-Nuts_For_SSL3$Si


Nuts_For_SSL4$Ca_L4<-Nuts_For_SSL4$Ca
Nuts_For_SSL4$Mg_L4<-Nuts_For_SSL4$Mg
Nuts_For_SSL4$K_L4<-Nuts_For_SSL4$K
Nuts_For_SSL4$Na_L4<-Nuts_For_SSL4$Na
Nuts_For_SSL4$NO3_L4<-Nuts_For_SSL4$NO3
Nuts_For_SSL4$K_L4<-Nuts_For_SSL4$K
Nuts_For_SSL4$NH4_L4<-Nuts_For_SSL4$NH4
Nuts_For_SSL4$SO4_L4<-Nuts_For_SSL4$SO4
Nuts_For_SSL4$Cl_L4<-Nuts_For_SSL4$Cl
Nuts_For_SSL4$P_L4<-Nuts_For_SSL4$P
Nuts_For_SSL4$DOC_L4<-Nuts_For_SSL4$DOC
Nuts_For_SSL4$pH_L4<-Nuts_For_SSL4$pH
Nuts_For_SSL4$Al_L4<-Nuts_For_SSL4$Al
Nuts_For_SSL4$R_L4<-Nuts_For_SSL4$R
Nuts_For_SSL4$HR_L4<-Nuts_For_SSL4$HR
Nuts_For_SSL4$Si_L4<-Nuts_For_SSL4$Si


Nuts_For_SSL5$Ca_L5<-Nuts_For_SSL5$Ca
Nuts_For_SSL5$Mg_L5<-Nuts_For_SSL5$Mg
Nuts_For_SSL5$K_L5<-Nuts_For_SSL5$K
Nuts_For_SSL5$Na_L5<-Nuts_For_SSL5$Na
Nuts_For_SSL5$NO3_L5<-Nuts_For_SSL5$NO3
Nuts_For_SSL5$K_L5<-Nuts_For_SSL5$K
Nuts_For_SSL5$NH4_L5<-Nuts_For_SSL5$NH4
Nuts_For_SSL5$SO4_L5<-Nuts_For_SSL5$SO4
Nuts_For_SSL5$Cl_L5<-Nuts_For_SSL5$Cl
Nuts_For_SSL5$P_L5<-Nuts_For_SSL5$P
Nuts_For_SSL5$DOC_L5<-Nuts_For_SSL5$DOC
Nuts_For_SSL5$pH_L5<-Nuts_For_SSL5$pH
Nuts_For_SSL5$Al_L5<-Nuts_For_SSL5$Al
Nuts_For_SSL5$R_L5<-Nuts_For_SSL5$R
Nuts_For_SSL5$HR_L5<-Nuts_For_SSL5$HR
Nuts_For_SSL5$Si_L5<-Nuts_For_SSL5$Si


Nuts_For_SSL6$Ca_L6<-Nuts_For_SSL6$Ca
Nuts_For_SSL6$Mg_L6<-Nuts_For_SSL6$Mg
Nuts_For_SSL6$K_L6<-Nuts_For_SSL6$K
Nuts_For_SSL6$Na_L6<-Nuts_For_SSL6$Na
Nuts_For_SSL6$NO3_L6<-Nuts_For_SSL6$NO3
Nuts_For_SSL6$K_L6<-Nuts_For_SSL6$K
Nuts_For_SSL6$NH4_L6<-Nuts_For_SSL6$NH4
Nuts_For_SSL6$SO4_L6<-Nuts_For_SSL6$SO4
Nuts_For_SSL6$Cl_L6<-Nuts_For_SSL6$Cl
Nuts_For_SSL6$P_L6<-Nuts_For_SSL6$P
Nuts_For_SSL6$DOC_L6<-Nuts_For_SSL6$DOC
Nuts_For_SSL6$pH_L6<-Nuts_For_SSL6$pH
Nuts_For_SSL6$Al_L6<-Nuts_For_SSL6$Al
Nuts_For_SSL6$R_L6<-Nuts_For_SSL6$R
Nuts_For_SSL6$HR_L6<-Nuts_For_SSL6$HR
Nuts_For_SSL6$Si_L6<-Nuts_For_SSL6$Si


Nuts_For_SSL7$Ca_L7<-Nuts_For_SSL7$Ca
Nuts_For_SSL7$Mg_L7<-Nuts_For_SSL7$Mg
Nuts_For_SSL7$K_L7<-Nuts_For_SSL7$K
Nuts_For_SSL7$Na_L7<-Nuts_For_SSL7$Na
Nuts_For_SSL7$NO3_L7<-Nuts_For_SSL7$NO3
Nuts_For_SSL7$K_L7<-Nuts_For_SSL7$K
Nuts_For_SSL7$NH4_L7<-Nuts_For_SSL7$NH4
Nuts_For_SSL7$SO4_L7<-Nuts_For_SSL7$SO4
Nuts_For_SSL7$Cl_L7<-Nuts_For_SSL7$Cl
Nuts_For_SSL7$P_L7<-Nuts_For_SSL7$P
Nuts_For_SSL7$DOC_L7<-Nuts_For_SSL7$DOC
Nuts_For_SSL7$pH_L7<-Nuts_For_SSL7$pH
Nuts_For_SSL7$Al_L7<-Nuts_For_SSL7$Al
Nuts_For_SSL7$R_L7<-Nuts_For_SSL7$R
Nuts_For_SSL7$HR_L7<-Nuts_For_SSL7$HR
Nuts_For_SSL7$Si_L7<-Nuts_For_SSL7$Si

Nuts_For_SSL8$Ca_L8<-Nuts_For_SSL8$Ca
Nuts_For_SSL8$Mg_L8<-Nuts_For_SSL8$Mg
Nuts_For_SSL8$K_L8<-Nuts_For_SSL8$K
Nuts_For_SSL8$Na_L8<-Nuts_For_SSL8$Na
Nuts_For_SSL8$NO3_L8<-Nuts_For_SSL8$NO3
Nuts_For_SSL8$K_L8<-Nuts_For_SSL8$K
Nuts_For_SSL8$NH4_L8<-Nuts_For_SSL8$NH4
Nuts_For_SSL8$SO4_L8<-Nuts_For_SSL8$SO4
Nuts_For_SSL8$Cl_L8<-Nuts_For_SSL8$Cl
Nuts_For_SSL8$P_L8<-Nuts_For_SSL8$P
Nuts_For_SSL8$DOC_L8<-Nuts_For_SSL8$DOC
Nuts_For_SSL8$pH_L8<-Nuts_For_SSL8$pH
Nuts_For_SSL8$Al_L8<-Nuts_For_SSL8$Al
Nuts_For_SSL8$R_L8<-Nuts_For_SSL8$R
Nuts_For_SSL8$HR_L8<-Nuts_For_SSL8$HR
Nuts_For_SSL8$Si_L8<-Nuts_For_SSL8$Si



#Cut out half of data
Nuts_For_SSL1<-Nuts_For_SSL1[-c(1:18)]
Nuts_For_SSL2<-Nuts_For_SSL2[-c(1:18)]
Nuts_For_SSL3<-Nuts_For_SSL3[-c(1:18)]
Nuts_For_SSL4<-Nuts_For_SSL4[-c(1:18)]
Nuts_For_SSL5<-Nuts_For_SSL5[-c(1:18)]
Nuts_For_SSL6<-Nuts_For_SSL6[-c(1:18)]
Nuts_For_SSL7<-Nuts_For_SSL7[-c(1:18)]
Nuts_For_SSL8<-Nuts_For_SSL8[-c(1:18)]

#Combine Data Sets

Nuts_For_All_Layers<-cbind(Nuts_For_SSL1, Nuts_For_SSL2, Nuts_For_SSL3, Nuts_For_SSL4
                           ,Nuts_For_SSL5,Nuts_For_SSL6,Nuts_For_SSL7, Nuts_For_SSL8)

#Get rid of unit designation row
Nuts_For_All_Layers<-Nuts_For_All_Layers[-c(1),]
Nuts_For_Leaching<-Nuts_For_Leaching[-c(1),]



#Fix characters to numeric
Nuts_For_All_Layers[,c(1:120)] <- lapply(Nuts_For_All_Layers[,c(1:120)], as.character)
Nuts_For_All_Layers[,c(1:120)] <- lapply(Nuts_For_All_Layers[,c(1:120)], as.numeric)

Nuts_For_Leaching[,c(1:13)]<-lapply(Nuts_For_Leaching[,c(1:13)], as.character)
Nuts_For_Leaching[,c(1:13)]<-lapply(Nuts_For_Leaching [,c(1:13)], as.numeric)


#Add date column
Nuts_For_All_Layers$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)


Mean_Ca1<-mean(Nuts_For_All_Layers$Ca_L1)
Mean_Ca2<-mean(Nuts_For_All_Layers$Ca_L2)
Mean_Ca3<-mean(Nuts_For_All_Layers$Ca_L3)
Mean_Ca4<-mean(Nuts_For_All_Layers$Ca_L4)
Mean_Ca5<-mean(Nuts_For_All_Layers$Ca_L5)
Mean_Ca6<-mean(Nuts_For_All_Layers$Ca_L6)
Mean_Ca7<-mean(Nuts_For_All_Layers$Ca_L7)
Mean_Ca8<-mean(Nuts_For_All_Layers$Ca_L8)

Mean_Mg1<-mean(Nuts_For_All_Layers$Mg_L1)
Mean_Mg2<-mean(Nuts_For_All_Layers$Mg_L2)
Mean_Mg3<-mean(Nuts_For_All_Layers$Mg_L3)
Mean_Mg4<-mean(Nuts_For_All_Layers$Mg_L4)
Mean_Mg5<-mean(Nuts_For_All_Layers$Mg_L5)
Mean_Mg6<-mean(Nuts_For_All_Layers$Mg_L6)
Mean_Mg7<-mean(Nuts_For_All_Layers$Mg_L7)
Mean_Mg8<-mean(Nuts_For_All_Layers$Mg_L8)

Mean_K1<-mean(Nuts_For_All_Layers$K_L1)
Mean_K2<-mean(Nuts_For_All_Layers$K_L2)
Mean_K3<-mean(Nuts_For_All_Layers$K_L3)
Mean_K4<-mean(Nuts_For_All_Layers$K_L4)
Mean_K5<-mean(Nuts_For_All_Layers$K_L5)
Mean_K6<-mean(Nuts_For_All_Layers$K_L6)
Mean_K7<-mean(Nuts_For_All_Layers$K_L7)
Mean_K8<-mean(Nuts_For_All_Layers$K_L8)

Mean_Na1<-mean(Nuts_For_All_Layers$Na_L1)
Mean_Na2<-mean(Nuts_For_All_Layers$Na_L2)
Mean_Na3<-mean(Nuts_For_All_Layers$Na_L3)
Mean_Na4<-mean(Nuts_For_All_Layers$Na_L4)
Mean_Na5<-mean(Nuts_For_All_Layers$Na_L5)
Mean_Na6<-mean(Nuts_For_All_Layers$Na_L6)
Mean_Na7<-mean(Nuts_For_All_Layers$Na_L7)
Mean_Na8<-mean(Nuts_For_All_Layers$Na_L8)

Mean_Al1<-mean(Nuts_For_All_Layers$Al_L1)
Mean_Al2<-mean(Nuts_For_All_Layers$Al_L2)
Mean_Al3<-mean(Nuts_For_All_Layers$Al_L3)
Mean_Al4<-mean(Nuts_For_All_Layers$Al_L4)
Mean_Al5<-mean(Nuts_For_All_Layers$Al_L5)
Mean_Al6<-mean(Nuts_For_All_Layers$Al_L6)
Mean_Al7<-mean(Nuts_For_All_Layers$Al_L7)
Mean_Al8<-mean(Nuts_For_All_Layers$Al_L8)

Mean_SO41<-mean(Nuts_For_All_Layers$SO4_L1)
Mean_SO42<-mean(Nuts_For_All_Layers$SO4_L2)
Mean_SO43<-mean(Nuts_For_All_Layers$SO4_L3)
Mean_SO44<-mean(Nuts_For_All_Layers$SO4_L4)
Mean_SO45<-mean(Nuts_For_All_Layers$SO4_L5)
Mean_SO46<-mean(Nuts_For_All_Layers$SO4_L6)
Mean_SO47<-mean(Nuts_For_All_Layers$SO4_L7)
Mean_SO48<-mean(Nuts_For_All_Layers$SO4_L8)

Mean_NO31<-mean(Nuts_For_All_Layers$NO3_L1)
Mean_NO32<-mean(Nuts_For_All_Layers$NO3_L2)
Mean_NO33<-mean(Nuts_For_All_Layers$NO3_L3)
Mean_NO34<-mean(Nuts_For_All_Layers$NO3_L4)
Mean_NO35<-mean(Nuts_For_All_Layers$NO3_L5)
Mean_NO36<-mean(Nuts_For_All_Layers$NO3_L6)
Mean_NO37<-mean(Nuts_For_All_Layers$NO3_L7)
Mean_NO38<-mean(Nuts_For_All_Layers$NO3_L8)

Mean_NH41<-mean(Nuts_For_All_Layers$NH4_L1)
Mean_NH42<-mean(Nuts_For_All_Layers$NH4_L2)
Mean_NH43<-mean(Nuts_For_All_Layers$NH4_L3)
Mean_NH44<-mean(Nuts_For_All_Layers$NH4_L4)
Mean_NH45<-mean(Nuts_For_All_Layers$NH4_L5)
Mean_NH46<-mean(Nuts_For_All_Layers$NH4_L6)
Mean_NH47<-mean(Nuts_For_All_Layers$NH4_L7)
Mean_NH48<-mean(Nuts_For_All_Layers$NH4_L8)

Mean_Cl1<-mean(Nuts_For_All_Layers$Cl_L1)
Mean_Cl2<-mean(Nuts_For_All_Layers$Cl_L2)
Mean_Cl3<-mean(Nuts_For_All_Layers$Cl_L3)
Mean_Cl4<-mean(Nuts_For_All_Layers$Cl_L4)
Mean_Cl5<-mean(Nuts_For_All_Layers$Cl_L5)
Mean_Cl6<-mean(Nuts_For_All_Layers$Cl_L6)
Mean_Cl7<-mean(Nuts_For_All_Layers$Cl_L7)
Mean_Cl8<-mean(Nuts_For_All_Layers$Cl_L8)

Mean_Concentrations<-cbind(Mean_Ca1, Mean_Ca2, Mean_Ca3, Mean_Ca4, Mean_Ca5, Mean_Ca6,
                           Mean_Ca7, Mean_Ca8, Mean_Mg1, Mean_Mg2, Mean_Mg3, Mean_Mg4, 
                           Mean_Mg5, Mean_Mg6, Mean_Mg7, Mean_Mg8, Mean_K1, Mean_K2, Mean_K3, 
                           Mean_K4, Mean_K5, Mean_K6,Mean_K7, Mean_K8, Mean_Na1, Mean_Na2, Mean_Na3,
                           Mean_Na4, Mean_Na5, Mean_Na6,Mean_Na7, Mean_Na8, Mean_Al1, Mean_Al2, Mean_Al3,
                           Mean_Al4, Mean_Al5, Mean_Al6,Mean_Al7, Mean_Al8, Mean_SO41, Mean_SO42, Mean_SO43,
                           Mean_SO44, Mean_SO45, Mean_SO46, Mean_SO47, Mean_SO48,
                           Mean_NO31, Mean_NO32, Mean_NO33,
                           Mean_NO34, Mean_NO35, Mean_NO36, Mean_NO37, Mean_NO38,
                           Mean_NH41, Mean_NH42, Mean_NH43,
                           Mean_NH44, Mean_NH45, Mean_NH46, Mean_NH47, Mean_NH48,
                           Mean_Cl1, Mean_Cl2, Mean_Cl3,
                           Mean_Cl4, Mean_Cl5, Mean_Cl6, Mean_Cl7, Mean_Cl8)




#write csv2
write.csv2(Nuts_For_Leaching, "Leaching.csv", row.names=TRUE)
write.csv2(Nuts_For_All_Layers, "Soil_Solution_All.csv", row.names=TRUE)
write.csv2(Mean_Concentrations, "Mean_Concentrations_SS.csv", row.names=TRUE)