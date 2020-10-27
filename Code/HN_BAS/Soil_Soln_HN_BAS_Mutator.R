#This Code will take soil solution concentration data from all 8 layers of simulated ecosystem
#This code will then stich the needed data together into a single .csv, and export to "Edited Data"
#The code will then source to another 2 graphing codes, which tend to be very slow
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output_HN_BAS/Edited Data")
library(dplyr)
library(multipanelfigure)
Nuts_For_SSL1<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 1.csv", sep=";", header=TRUE)

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



Nuts_For_SSL2<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 2.csv", sep=";", header=TRUE)

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



Nuts_For_SSL3<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 3.csv", sep=";", header=TRUE)

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



Nuts_For_SSL4<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 4.csv", sep=";", header=TRUE)

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


Nuts_For_SSL5<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 5.csv", sep=";", header=TRUE)

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



Nuts_For_SSL6<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 6.csv", sep=";", header=TRUE)

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



Nuts_For_SSL7<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 7.csv", sep=";", header=TRUE)

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


Nuts_For_SSL8<-read.csv("~/NutsForBASHN/Output data/Soil solution/Soil solution chemistry Layer 8.csv", sep=";", header=TRUE)



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

#Fix characters to numeric
Nuts_For_All_Layers[,c(1:120)] <- lapply(Nuts_For_All_Layers[,c(1:120)], as.character)
Nuts_For_All_Layers[,c(1:120)] <- lapply(Nuts_For_All_Layers[,c(1:120)], as.numeric)

#Add date column
Nuts_For_All_Layers$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)




#write csv

write.csv2(Nuts_For_All_Layers, "Soil_Solution_All.csv", row.names=TRUE)
























