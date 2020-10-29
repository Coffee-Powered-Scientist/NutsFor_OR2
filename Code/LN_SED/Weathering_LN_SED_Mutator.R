#This Code will take soil solution concentration data from all 8 layers of simulated ecosystem
#This code will then stich the needed data together into a single .csv, and export to "Edited Data"
#The code will then source to another 2 graphing codes, which tend to be very slow
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data")
library(dplyr)
Nuts_For_Weathering1<-read.csv2("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 1.csv", header=FALSE)

Nuts_For_Weathering1$Ca_L1<-Nuts_For_Weathering1$V3
Nuts_For_Weathering1$Mg_L1<-Nuts_For_Weathering1$V4
Nuts_For_Weathering1$K_L1<-Nuts_For_Weathering1$V5
Nuts_For_Weathering1$Na_L1<-Nuts_For_Weathering1$V6
Nuts_For_Weathering1$Al_L1<-Nuts_For_Weathering1$V7
Nuts_For_Weathering1$Si_L1<-Nuts_For_Weathering1$V8
Nuts_For_Weathering1$P_L1<-Nuts_For_Weathering1$V9

Nuts_For_Weathering2<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 2.csv", sep=";", header=FALSE)

Nuts_For_Weathering2$Ca_L2<-Nuts_For_Weathering2$V3
Nuts_For_Weathering2$Mg_L2<-Nuts_For_Weathering2$V4
Nuts_For_Weathering2$K_L2<-Nuts_For_Weathering2$V5
Nuts_For_Weathering2$Na_L2<-Nuts_For_Weathering2$V6
Nuts_For_Weathering2$Al_L2<-Nuts_For_Weathering2$V7
Nuts_For_Weathering2$Si_L2<-Nuts_For_Weathering2$V8
Nuts_For_Weathering2$P_L2<-Nuts_For_Weathering2$V9

Nuts_For_Weathering3<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 3.csv", sep=";", header=FALSE)

Nuts_For_Weathering3$Ca_L3<-Nuts_For_Weathering3$V3
Nuts_For_Weathering3$Mg_L3<-Nuts_For_Weathering3$V4
Nuts_For_Weathering3$K_L3<-Nuts_For_Weathering3$V5
Nuts_For_Weathering3$Na_L3<-Nuts_For_Weathering3$V6
Nuts_For_Weathering3$Al_L3<-Nuts_For_Weathering3$V7
Nuts_For_Weathering3$Si_L3<-Nuts_For_Weathering3$V8
Nuts_For_Weathering3$P_L3<-Nuts_For_Weathering3$V9

Nuts_For_Weathering4<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 4.csv", sep=";", header=FALSE)

Nuts_For_Weathering4$Ca_L4<-Nuts_For_Weathering4$V3
Nuts_For_Weathering4$Mg_L4<-Nuts_For_Weathering4$V4
Nuts_For_Weathering4$K_L4<-Nuts_For_Weathering4$V5
Nuts_For_Weathering4$Na_L4<-Nuts_For_Weathering4$V6
Nuts_For_Weathering4$Al_L4<-Nuts_For_Weathering4$V7
Nuts_For_Weathering4$Si_L4<-Nuts_For_Weathering4$V8
Nuts_For_Weathering4$P_L4<-Nuts_For_Weathering4$V9

Nuts_For_Weathering5<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 5.csv", sep=";", header=FALSE)

Nuts_For_Weathering5$Ca_L5<-Nuts_For_Weathering5$V3
Nuts_For_Weathering5$Mg_L5<-Nuts_For_Weathering5$V4
Nuts_For_Weathering5$K_L5<-Nuts_For_Weathering5$V5
Nuts_For_Weathering5$Na_L5<-Nuts_For_Weathering5$V6
Nuts_For_Weathering5$Al_L5<-Nuts_For_Weathering5$V7
Nuts_For_Weathering5$Si_L5<-Nuts_For_Weathering5$V8
Nuts_For_Weathering5$P_L5<-Nuts_For_Weathering5$V9

Nuts_For_Weathering6<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 6.csv", sep=";", header=FALSE)

Nuts_For_Weathering6$Ca_L6<-Nuts_For_Weathering6$V3
Nuts_For_Weathering6$Mg_L6<-Nuts_For_Weathering6$V4
Nuts_For_Weathering6$K_L6<-Nuts_For_Weathering6$V5
Nuts_For_Weathering6$Na_L6<-Nuts_For_Weathering6$V6
Nuts_For_Weathering6$Al_L6<-Nuts_For_Weathering6$V7
Nuts_For_Weathering6$Si_L6<-Nuts_For_Weathering6$V8
Nuts_For_Weathering6$P_L6<-Nuts_For_Weathering6$V9

Nuts_For_Weathering7<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 7.csv", sep=";", header=FALSE)

Nuts_For_Weathering7$Ca_L7<-Nuts_For_Weathering7$V3
Nuts_For_Weathering7$Mg_L7<-Nuts_For_Weathering7$V4
Nuts_For_Weathering7$K_L7<-Nuts_For_Weathering7$V5
Nuts_For_Weathering7$Na_L7<-Nuts_For_Weathering7$V6
Nuts_For_Weathering7$Al_L7<-Nuts_For_Weathering7$V7
Nuts_For_Weathering7$Si_L7<-Nuts_For_Weathering7$V8
Nuts_For_Weathering7$P_L7<-Nuts_For_Weathering7$V9

Nuts_For_Weathering8<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 8.csv", sep=";", header=FALSE)

Nuts_For_Weathering8$Ca_L8<-Nuts_For_Weathering8$V3
Nuts_For_Weathering8$Mg_L8<-Nuts_For_Weathering8$V4
Nuts_For_Weathering8$K_L8<-Nuts_For_Weathering8$V5
Nuts_For_Weathering8$Na_L8<-Nuts_For_Weathering8$V6
Nuts_For_Weathering8$Al_L8<-Nuts_For_Weathering8$V7
Nuts_For_Weathering8$Si_L8<-Nuts_For_Weathering8$V8
Nuts_For_Weathering8$P_L8<-Nuts_For_Weathering8$V9

#Cut out half of data
Nuts_For_Weathering1<-Nuts_For_Weathering1[-c(1:9)]
Nuts_For_Weathering2<-Nuts_For_Weathering2[-c(1:9)]
Nuts_For_Weathering3<-Nuts_For_Weathering3[-c(1:9)]
Nuts_For_Weathering4<-Nuts_For_Weathering4[-c(1:9)]
Nuts_For_Weathering5<-Nuts_For_Weathering5[-c(1:9)]
Nuts_For_Weathering6<-Nuts_For_Weathering6[-c(1:9)]
Nuts_For_Weathering7<-Nuts_For_Weathering7[-c(1:9)]
Nuts_For_Weathering8<-Nuts_For_Weathering8[-c(1:9)]


#Combine Data Sets

Nuts_For_All_Layers<-cbind(Nuts_For_Weathering1, Nuts_For_Weathering2, Nuts_For_Weathering3, Nuts_For_Weathering4
                           ,Nuts_For_Weathering5,Nuts_For_Weathering6,Nuts_For_Weathering7, Nuts_For_Weathering8)
#Get rid of unit designation row
Nuts_For_All_Layers<-Nuts_For_All_Layers[-c(1:2),]

#Fix characters to numeric
Nuts_For_All_Layers[,c(1:56)] <- lapply(Nuts_For_All_Layers[,c(1:56)], as.character)
Nuts_For_All_Layers[,c(1:56)] <- lapply(Nuts_For_All_Layers[,c(1:56)], as.numeric)

#Add date column
Nuts_For_All_Layers$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_All_Layers$Total_Ca<-Nuts_For_All_Layers$Ca_L1+Nuts_For_All_Layers$Ca_L2+Nuts_For_All_Layers$Ca_L3+
  Nuts_For_All_Layers$Ca_L4+Nuts_For_All_Layers$Ca_L5+Nuts_For_All_Layers$Ca_L6+Nuts_For_All_Layers$Ca_L7+
  Nuts_For_All_Layers$Ca_L8

#write csv
write.csv2(Nuts_For_All_Layers, "Weathering_All.csv", row.names=TRUE)