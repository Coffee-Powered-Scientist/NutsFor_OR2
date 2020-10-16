#This code edits data from the CEC and AEC codes, and combines them

rm(list = ls())




setwd("~/Project_Master/Test_Rep/Output_LN_BAS/Edited Data")

#Read all files
AEC1<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 1.csv", sep=";", header=TRUE)
AEC2<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 2.csv", sep=";", header=TRUE)
AEC3<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 3.csv", sep=";", header=TRUE)
AEC4<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 4.csv", sep=";", header=TRUE)
AEC5<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 5.csv", sep=";", header=TRUE)
AEC6<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 6.csv", sep=";", header=TRUE)
AEC7<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 7.csv", sep=";", header=TRUE)
AEC8<-read.csv("~/NutsForBASLN/Output data/AEC/AEC Layer 8.csv", sep=";", header=TRUE)

#Already Numeric and Edited
Soil_Solution<-read.csv2("~/Project_Master/Test_Rep/Output_LN_BAS/Edited Data/Soil_Solution_All.csv", header=TRUE)

CEC1<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 1.csv", sep=";", header=TRUE)
CEC2<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 2.csv", sep=";", header=TRUE)
CEC3<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 3.csv", sep=";", header=TRUE)
CEC4<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 4.csv", sep=";", header=TRUE)
CEC5<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 5.csv", sep=";", header=TRUE)
CEC6<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 6.csv", sep=";", header=TRUE)
CEC7<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 7.csv", sep=";", header=TRUE)
CEC8<-read.csv("~/NutsForBASLN/Output data/CEC/CEC Layer 8.csv", sep=";", header=TRUE)

#Rename Variables for every file, use umol/kg soil unit for AEC
AEC1<-AEC1[-c(1:2)]
AEC1$AEC_SO4_L1<-AEC1$µmol.kg
AEC1$AEC_PO4_L1<-AEC1$X.2
AEC1$AEC_Cl_L1<-AEC1$X.3
AEC1<-AEC1[-c(4:6)]
AEC1<-AEC1[-c(1:3)]

AEC2<-AEC2[-c(1:2)]
AEC2$AEC_SO4_L2<-AEC2$µmol.kg
AEC2$AEC_PO4_L2<-AEC2$X.2
AEC2$AEC_Cl_L2<-AEC2$X.3
AEC2<-AEC2[-c(4:6)]
AEC2<-AEC2[-c(1:3)]

AEC3<-AEC3[-c(1:2)]
AEC3$AEC_SO4_L3<-AEC3$µmol.kg
AEC3$AEC_PO4_L3<-AEC3$X.2
AEC3$AEC_Cl_L3<-AEC3$X.3
AEC3<-AEC3[-c(4:6)]
AEC3<-AEC3[-c(1:3)]

AEC4<-AEC4[-c(1:2)]
AEC4$AEC_SO4_L4<-AEC4$µmol.kg
AEC4$AEC_PO4_L4<-AEC4$X.2
AEC4$AEC_Cl_L4<-AEC4$X.3
AEC4<-AEC4[-c(4:6)]
AEC4<-AEC4[-c(1:3)]

AEC5<-AEC5[-c(1:2)]
AEC5$AEC_SO4_L5<-AEC5$µmol.kg
AEC5$AEC_PO4_L5<-AEC5$X.2
AEC5$AEC_Cl_L5<-AEC5$X.3
AEC5<-AEC5[-c(4:6)]
AEC5<-AEC5[-c(1:3)]

AEC6<-AEC6[-c(1:2)]
AEC6$AEC_SO4_L6<-AEC6$µmol.kg
AEC6$AEC_PO4_L6<-AEC6$X.2
AEC6$AEC_Cl_L6<-AEC6$X.3
AEC6<-AEC6[-c(4:6)]
AEC6<-AEC6[-c(1:3)]

AEC7<-AEC7[-c(1:2)]
AEC7$AEC_SO4_L7<-AEC7$µmol.kg
AEC7$AEC_PO4_L7<-AEC7$X.2
AEC7$AEC_Cl_L7<-AEC7$X.3
AEC7<-AEC7[-c(4:6)]
AEC7<-AEC7[-c(1:3)]

AEC8<-AEC8[-c(1:2)]
AEC8$AEC_SO4_L8<-AEC8$µmol.kg
AEC8$AEC_PO4_L8<-AEC8$X.2
AEC8$AEC_Cl_L8<-AEC8$X.3
AEC8<-AEC8[-c(4:6)]
AEC8<-AEC8[-c(1:3)]

AEC_All<-cbind(AEC1, AEC2, AEC3, AEC4, AEC5, AEC6, AEC7, AEC8)

AEC_All<-AEC_All[-c(1),]

#Rename and Edit variables in CEC data
CEC1<-CEC1[-c(1:2)]
CEC1$CEC_Ca_L1<-CEC1$µmol.kg
CEC1$CEC_Mg_L1<-CEC1$X.2
CEC1$CEC_K_L1<-CEC1$X.3
CEC1$CEC_Na_L1<-CEC1$X.4
CEC1$CEC_NH4_L1<-CEC1$X.5
CEC1$CEC_Al_L1<-CEC1$X.6
CEC1$CEC_H_L1<-CEC1$X.7
CEC1<-CEC1[-c(1:13)]

CEC2<-CEC2[-c(1:2)]
CEC2$CEC_Ca_L2<-CEC2$µmol.kg
CEC2$CEC_Mg_L2<-CEC2$X.2
CEC2$CEC_K_L2<-CEC2$X.3
CEC2$CEC_Na_L2<-CEC2$X.4
CEC2$CEC_NH4_L2<-CEC2$X.5
CEC2$CEC_Al_L2<-CEC2$X.6
CEC2$CEC_H_L2<-CEC2$X.7
CEC2<-CEC2[-c(1:13)]

CEC3<-CEC3[-c(1:2)]
CEC3$CEC_Ca_L3<-CEC3$µmol.kg
CEC3$CEC_Mg_L3<-CEC3$X.2
CEC3$CEC_K_L3<-CEC3$X.3
CEC3$CEC_Na_L3<-CEC3$X.4
CEC3$CEC_NH4_L3<-CEC3$X.5
CEC3$CEC_Al_L3<-CEC3$X.6
CEC3$CEC_H_L3<-CEC3$X.7
CEC3<-CEC3[-c(1:13)]

CEC4<-CEC4[-c(1:2)]
CEC4$CEC_Ca_L4<-CEC4$µmol.kg
CEC4$CEC_Mg_L4<-CEC4$X.2
CEC4$CEC_K_L4<-CEC4$X.3
CEC4$CEC_Na_L4<-CEC4$X.4
CEC4$CEC_NH4_L4<-CEC4$X.5
CEC4$CEC_Al_L4<-CEC4$X.6
CEC4$CEC_H_L4<-CEC4$X.7
CEC4<-CEC4[-c(1:13)]

CEC5<-CEC5[-c(1:2)]
CEC5$CEC_Ca_L5<-CEC5$µmol.kg
CEC5$CEC_Mg_L5<-CEC5$X.2
CEC5$CEC_K_L5<-CEC5$X.3
CEC5$CEC_Na_L5<-CEC5$X.4
CEC5$CEC_NH4_L5<-CEC5$X.5
CEC5$CEC_Al_L5<-CEC5$X.6
CEC5$CEC_H_L5<-CEC5$X.7
CEC5<-CEC5[-c(1:13)]

CEC6<-CEC6[-c(1:2)]
CEC6$CEC_Ca_L6<-CEC6$µmol.kg
CEC6$CEC_Mg_L6<-CEC6$X.2
CEC6$CEC_K_L6<-CEC6$X.3
CEC6$CEC_Na_L6<-CEC6$X.4
CEC6$CEC_NH4_L6<-CEC6$X.5
CEC6$CEC_Al_L6<-CEC6$X.6
CEC6$CEC_H_L6<-CEC6$X.7
CEC6<-CEC6[-c(1:13)]

CEC7<-CEC7[-c(1:2)]
CEC7$CEC_Ca_L7<-CEC7$µmol.kg
CEC7$CEC_Mg_L7<-CEC7$X.2
CEC7$CEC_K_L7<-CEC7$X.3
CEC7$CEC_Na_L7<-CEC7$X.4
CEC7$CEC_NH4_L7<-CEC7$X.5
CEC7$CEC_Al_L7<-CEC7$X.6
CEC7$CEC_H_L7<-CEC7$X.7
CEC7<-CEC7[-c(1:13)]

CEC8<-CEC8[-c(1:2)]
CEC8$CEC_Ca_L8<-CEC8$µmol.kg
CEC8$CEC_Mg_L8<-CEC8$X.2
CEC8$CEC_K_L8<-CEC8$X.3
CEC8$CEC_Na_L8<-CEC8$X.4
CEC8$CEC_NH4_L8<-CEC8$X.5
CEC8$CEC_Al_L8<-CEC8$X.6
CEC8$CEC_H_L8<-CEC8$X.7
CEC8<-CEC8[-c(1:13)]

CEC_All<-cbind(CEC1, CEC2, CEC3, CEC4, CEC5, CEC6, CEC7, CEC8)

CEC_All<-CEC_All[-c(1),]

#Date Column should already be in data set
Adsorption_Data<-cbind(Soil_Solution, AEC_All, CEC_All)

Adsorption_Data[,c(2:202)]<-lapply(Adsorption_Data[,c(2:202)], as.character)
Adsorption_Data[,c(2:202)]<-lapply(Adsorption_Data[,c(2:202)], as.numeric)

write.csv2(Adsorption_Data, "Adsorption_Data.csv", row.names = TRUE)