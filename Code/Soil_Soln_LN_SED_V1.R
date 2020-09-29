#Faster Aggregated Graphs for Test_Script
library(ggplot2)
library(dplyr)
library(magrittr)
library(multipanelfigure)

setwd("~/Project_Master/Test_Rep/Output_LN_SED/Soil_Solution")
#Data is stored on my computer, data for student inspection is in "Data" folder on Github

Nuts_For_SSL1<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 1.csv", sep=";", header=TRUE)
Nuts_For_SSL1<-Nuts_For_SSL1[-c(1),]
Nuts_For_SSL1$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
#maybe "dataset %>% mutate_if(is.character,as.numeric)"?

#This is a functional way of doing the above very quickly, I think
Nuts_For_SSL1[,c(3:16)] <- sapply(Nuts_For_SSL1[,c(3:16)], as.character)
Nuts_For_SSL1[,c(3:16)] <- sapply(Nuts_For_SSL1[,c(3:16)], as.numeric)

SSL1Ca.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Ca, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL1Mg.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Mg, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL1K.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL1Na.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))
SSL1NO3.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL1NH4.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL1SO4.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL1Cl.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL1P.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL1DOC.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL1pH.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL1Al.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL1Si.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

Nuts_For_SSL2<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 2.csv", sep=";", header=TRUE)
Nuts_For_SSL3<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 3.csv", sep=";", header=TRUE)
Nuts_For_SSL4<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 4.csv", sep=";", header=TRUE)
Nuts_For_SSL5<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 5.csv", sep=";", header=TRUE)
Nuts_For_SSL6<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 6.csv", sep=";", header=TRUE)
Nuts_For_SSL7<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 7.csv", sep=";", header=TRUE)
Nuts_For_SSL8<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 8.csv", sep=";", header=TRUE)

Nuts_For_SSL2<-Nuts_For_SSL2[-c(1),]
Nuts_For_SSL2$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
Nuts_For_SSL3<-Nuts_For_SSL3[-c(1),]
Nuts_For_SSL3$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
Nuts_For_SSL4<-Nuts_For_SSL4[-c(1),]
Nuts_For_SSL4$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
Nuts_For_SSL5<-Nuts_For_SSL5[-c(1),]
Nuts_For_SSL5$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
Nuts_For_SSL6<-Nuts_For_SSL6[-c(1),]
Nuts_For_SSL6$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
Nuts_For_SSL7<-Nuts_For_SSL7[-c(1),]
Nuts_For_SSL7$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)
Nuts_For_SSL8<-Nuts_For_SSL8[-c(1),]
Nuts_For_SSL8$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_SSL2[,c(3:16)] <- sapply(Nuts_For_SSL2[,c(3:16)], as.character)
Nuts_For_SSL2[,c(3:16)] <- sapply(Nuts_For_SSL2[,c(3:16)], as.numeric)

Nuts_For_SSL3[,c(3:16)] <- sapply(Nuts_For_SSL3[,c(3:16)], as.character)
Nuts_For_SSL3[,c(3:16)] <- sapply(Nuts_For_SSL3[,c(3:16)], as.numeric)

Nuts_For_SSL4[,c(3:16)] <- sapply(Nuts_For_SSL4[,c(3:16)], as.character)
Nuts_For_SSL4[,c(3:16)] <- sapply(Nuts_For_SSL4[,c(3:16)], as.numeric)

Nuts_For_SSL5[,c(3:16)] <- sapply(Nuts_For_SSL5[,c(3:16)], as.character)
Nuts_For_SSL5[,c(3:16)] <- sapply(Nuts_For_SSL5[,c(3:16)], as.numeric)

Nuts_For_SSL6[,c(3:16)] <- sapply(Nuts_For_SSL6[,c(3:16)], as.character)
Nuts_For_SSL6[,c(3:16)] <- sapply(Nuts_For_SSL6[,c(3:16)], as.numeric)

Nuts_For_SSL7[,c(3:16)] <- sapply(Nuts_For_SSL7[,c(3:16)], as.character)
Nuts_For_SSL7[,c(3:16)] <- sapply(Nuts_For_SSL7[,c(3:16)], as.numeric)

Nuts_For_SSL8[,c(3:16)] <- sapply(Nuts_For_SSL8[,c(3:16)], as.character)
Nuts_For_SSL8[,c(3:16)] <- sapply(Nuts_For_SSL8[,c(3:16)], as.numeric)

#Layer 2

SSL2Ca.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL2Mg.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL2K.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL2Na.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL2NO3.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL2NH4.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL2SO4.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL2Cl.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL2P.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL2DOC.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL2pH.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL2Al.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL2Si.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))


#Layer 3
SSL3Ca.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL3Mg.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL3K.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL3Na.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL3NO3.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL3NH4.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL3SO4.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL3Cl.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL3P.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL3DOC.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL3pH.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL3Al.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL3Si.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))


#Layer 4
SSL4Ca.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL4Mg.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL4K.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL4Na.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL4NO3.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL4NH4.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL4SO4.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL4Cl.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL4P.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL4DOC.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL4pH.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL4Al.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL4Si.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 5
SSL5Ca.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL5Mg.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL5K.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL5Na.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL5NO3.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL5NH4.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL5SO4.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL5Cl.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL5P.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL5DOC.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL5pH.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL5Al.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL5Si.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 6

SSL6Ca.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL6Mg.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL6K.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL6Na.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL6NO3.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL6NH4.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL6SO4.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL6Cl.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL6P.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL6DOC.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL6pH.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL6Al.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL6Si.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 7
SSL7Ca.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL7Mg.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL7K.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL7Na.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL7NO3.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL7NH4.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL7SO4.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL7Cl.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL7P.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL7DOC.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL7pH.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL7Al.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL7Si.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 8
SSL8Ca.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))

SSL8Mg.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL8K.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL8Na.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL8NO3.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL8NH4.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL8SO4.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL8Cl.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL8P.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL8DOC.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL8pH.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL8Al.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL8Si.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

SSL1R.G<-ggplot(Nuts_For_SSL1, (aes(x=Date, y=R, group=1)))+geom_line()
SSL2R.G<-ggplot(Nuts_For_SSL2, (aes(x=Date, y=R, group=1)))+geom_line()
SSL3R.G<-ggplot(Nuts_For_SSL3, (aes(x=Date, y=R, group=1)))+geom_line()
SSL4R.G<-ggplot(Nuts_For_SSL4, (aes(x=Date, y=R, group=1)))+geom_line()
SSL5R.G<-ggplot(Nuts_For_SSL5, (aes(x=Date, y=R, group=1)))+geom_line()
SSL6R.G<-ggplot(Nuts_For_SSL6, (aes(x=Date, y=R, group=1)))+geom_line()
SSL7R.G<-ggplot(Nuts_For_SSL7, (aes(x=Date, y=R, group=1)))+geom_line()
SSL8R.G<-ggplot(Nuts_For_SSL8, (aes(x=Date, y=R, group=1)))+geom_line()

Ca_SS_L1_TOT<-ggplot()+geom_line(data=Nuts_For_SSL1, aes(x=Date, y=Ca, color="Layer 1"))+
  geom_line(data=Nuts_For_SSL2, aes(x=Date, y=Ca, color="Layer 2"))+
  geom_line(data=Nuts_For_SSL3, aes(x=Date, y=Ca, color="Layer 3"))
pdf("Ca_SS_L1_TOT.pdf", height=15, width=20)
plot(Ca_SS_L1_TOT)
dev.off()

Ca_SS_L2_TOT<-ggplot()+geom_line(data=Nuts_For_SSL4, aes(x=Date, y=Ca, color="Layer 4"))+
  geom_line(data=Nuts_For_SSL5, aes(x=Date, y=Ca, color="Layer 5"))+
  geom_line(data=Nuts_For_SSL6, aes(x=Date, y=Ca, color="Layer 6"))+
  geom_line(data=Nuts_For_SSL7, aes(x=Date, y=Ca, color="Layer 7"))+
  geom_line(data=Nuts_For_SSL8, aes(x=Date, y=Ca, color="Layer 8"))
pdf("Ca_SS_L2_TOT.pdf", height=15, width=20)
plot(Ca_SS_L2_TOT)
dev.off()

Mg_SS_L1_TOT<-ggplot()+geom_line(data=Nuts_For_SSL1, aes(x=Date, y=Mg, color="Layer 1"))+
  geom_line(data=Nuts_For_SSL2, aes(x=Date, y=Mg, color="Layer 2"))+
  geom_line(data=Nuts_For_SSL3, aes(x=Date, y=Mg, color="Layer 3"))
pdf("Mg_SS_L1_TOT.pdf", height=15, width=20)
plot(Mg_SS_L1_TOT)
dev.off()

Mg_SS_L2_TOT<-ggplot()+geom_line(data=Nuts_For_SSL4, aes(x=Date, y=Mg, color="Layer 4"))+
  geom_line(data=Nuts_For_SSL5, aes(x=Date, y=Mg, color="Layer 5"))+
  geom_line(data=Nuts_For_SSL6, aes(x=Date, y=Mg, color="Layer 6"))+
  geom_line(data=Nuts_For_SSL7, aes(x=Date, y=Mg, color="Layer 7"))+
  geom_line(data=Nuts_For_SSL8, aes(x=Date, y=Mg, color="Layer 8"))
pdf("Mg_SS_L2_TOT.pdf", height=15, width=20)
plot(Mg_SS_L2_TOT)
dev.off()

K_SS_L1_TOT<-ggplot()+geom_line(data=Nuts_For_SSL1, aes(x=Date, y=K, color="Layer 1"))+
  geom_line(data=Nuts_For_SSL2, aes(x=Date, y=K, color="Layer 2"))+
  geom_line(data=Nuts_For_SSL3, aes(x=Date, y=K, color="Layer 3"))
pdf("K_SS_L1_TOT.pdf", height=15, width=20)
plot(K_SS_L1_TOT)
dev.off()

K_SS_L2_TOT<-ggplot()+geom_line(data=Nuts_For_SSL4, aes(x=Date, y=K, color="Layer 4"))+
  geom_line(data=Nuts_For_SSL5, aes(x=Date, y=K, color="Layer 5"))+
  geom_line(data=Nuts_For_SSL6, aes(x=Date, y=K, color="Layer 6"))+
  geom_line(data=Nuts_For_SSL7, aes(x=Date, y=K, color="Layer 7"))+
  geom_line(data=Nuts_For_SSL8, aes(x=Date, y=K, color="Layer 8"))
pdf("K_SS_L2_TOT.pdf", height=15, width=20)
plot(K_SS_L2_TOT)
dev.off()

Al_SS_L1_TOT<-ggplot()+geom_line(data=Nuts_For_SSL1, aes(x=Date, y=Al, color="Layer 1"))+
  geom_line(data=Nuts_For_SSL2, aes(x=Date, y=Al, color="Layer 2"))+
  geom_line(data=Nuts_For_SSL3, aes(x=Date, y=Al, color="Layer 3"))
pdf("Al_SS_L1_TOT.pdf", height=15, width=20)
plot(Al_SS_L1_TOT)
dev.off()

Al_SS_L2_TOT<-ggplot()+geom_line(data=Nuts_For_SSL4, aes(x=Date, y=Al, color="Layer 4"))+
  geom_line(data=Nuts_For_SSL5, aes(x=Date, y=Al, color="Layer 5"))+
  geom_line(data=Nuts_For_SSL6, aes(x=Date, y=Al, color="Layer 6"))+
  geom_line(data=Nuts_For_SSL7, aes(x=Date, y=Al, color="Layer 7"))+
  geom_line(data=Nuts_For_SSL8, aes(x=Date, y=Al, color="Layer 8"))
pdf("Al_SS_L2_TOT.pdf", height=15, width=20)
plot(Al_SS_L2_TOT)
dev.off()

Na_SS_L1_TOT<-ggplot()+geom_line(data=Nuts_For_SSL1, aes(x=Date, y=Na, color="Layer 1"))+
  geom_line(data=Nuts_For_SSL2, aes(x=Date, y=Na, color="Layer 2"))+
  geom_line(data=Nuts_For_SSL3, aes(x=Date, y=Na, color="Layer 3"))
pdf("Na_SS_L1_TOT.pdf", height=15, width=20)
plot(Na_SS_L1_TOT)
dev.off()

Na_SS_L2_TOT<-ggplot()+geom_line(data=Nuts_For_SSL4, aes(x=Date, y=Na, color="Layer 4"))+
  geom_line(data=Nuts_For_SSL5, aes(x=Date, y=Na, color="Layer 5"))+
  geom_line(data=Nuts_For_SSL6, aes(x=Date, y=Na, color="Layer 6"))+
  geom_line(data=Nuts_For_SSL7, aes(x=Date, y=Na, color="Layer 7"))+
  geom_line(data=Nuts_For_SSL8, aes(x=Date, y=Na, color="Layer 8"))
pdf("Na_SS_L2_TOT.pdf", height=15, width=20)
plot(Na_SS_L2_TOT)
dev.off()

NH4_SS_L1_TOT<-ggplot()+geom_line(data=Nuts_For_SSL1, aes(x=Date, y=NH4, color="Layer 1"))+
  geom_line(data=Nuts_For_SSL2, aes(x=Date, y=NH4, color="Layer 2"))+
  geom_line(data=Nuts_For_SSL3, aes(x=Date, y=NH4, color="Layer 3"))
pdf("NH4_SS_L1_TOT.pdf", height=15, width=20)
plot(NH4_SS_L1_TOT)
dev.off()

NH4_SS_L2_TOT<-ggplot()+geom_line(data=Nuts_For_SSL4, aes(x=Date, y=NH4, color="Layer 4"))+
  geom_line(data=Nuts_For_SSL5, aes(x=Date, y=NH4, color="Layer 5"))+
  geom_line(data=Nuts_For_SSL6, aes(x=Date, y=NH4, color="Layer 6"))+
  geom_line(data=Nuts_For_SSL7, aes(x=Date, y=NH4, color="Layer 7"))+
  geom_line(data=Nuts_For_SSL8, aes(x=Date, y=NH4, color="Layer 8"))
pdf("NH4_SS_L2_TOT.pdf", height=15, width=20)
plot(NH4_SS_L2_TOT)
dev.off()

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

Nuts_For_SSL1$Anions_Eq_1<-Nuts_For_SSL1$NO3+Nuts_For_SSL1$SO4*2+Nuts_For_SSL1$R+Nuts_For_SSL1$Cl
Nuts_For_SSL1$Cations_Eq_1<-Nuts_For_SSL1$Ca*2+Nuts_For_SSL1$Mg*2+Nuts_For_SSL1$K+Nuts_For_SSL1$Na+Nuts_For_SSL1$NH4
Nuts_For_SSL1$ANC<-Nuts_For_SSL1$Cations_Eq_1-Nuts_For_SSL1$Anions_Eq_1

ANC_1<-ggplot()+geom_line(Nuts_For_SSL1, mapping= (aes(x=Date, y=Anions_Eq_1, color="Anion Eq.")))+geom_line(Nuts_For_SSL1, mapping= aes(x=Date, y=Cations_Eq_1, color="Cation Eq."))+
  geom_line(Nuts_For_SSL1, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_1.pdf")
plot(ANC_1)
dev.off()

Nuts_For_SSL2$Anions_Eq_2<-Nuts_For_SSL2$NO3+Nuts_For_SSL2$SO4*2+Nuts_For_SSL2$R+Nuts_For_SSL2$Cl
Nuts_For_SSL2$Cations_Eq_2<-Nuts_For_SSL2$Ca*2+Nuts_For_SSL2$Mg*2+Nuts_For_SSL2$K+Nuts_For_SSL2$Na+Nuts_For_SSL2$NH4
Nuts_For_SSL2$ANC<-Nuts_For_SSL2$Cations_Eq_2-Nuts_For_SSL2$Anions_Eq_2

ANC_2<-ggplot()+geom_line(Nuts_For_SSL2, mapping= (aes(x=Date, y=Anions_Eq_2, color="Anion Eq.")))+geom_line(Nuts_For_SSL2, mapping= aes(x=Date, y=Cations_Eq_2, color="Cation Eq."))+
  geom_line(Nuts_For_SSL2, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_2.pdf")
plot(ANC_2)
dev.off()

Nuts_For_SSL3$Anions_Eq_3<-Nuts_For_SSL3$NO3+Nuts_For_SSL3$SO4*2+Nuts_For_SSL3$R+Nuts_For_SSL3$Cl
Nuts_For_SSL3$Cations_Eq_3<-Nuts_For_SSL3$Ca*2+Nuts_For_SSL3$Mg*2+Nuts_For_SSL3$K+Nuts_For_SSL3$Na+Nuts_For_SSL3$NH4
Nuts_For_SSL3$ANC<-Nuts_For_SSL3$Cations_Eq_3-Nuts_For_SSL3$Anions_Eq_3

ANC_3<-ggplot()+geom_line(Nuts_For_SSL3, mapping= (aes(x=Date, y=Anions_Eq_3, color="Anion Eq.")))+geom_line(Nuts_For_SSL3, mapping= aes(x=Date, y=Cations_Eq_3, color="Cation Eq."))+
  geom_line(Nuts_For_SSL3, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_3.pdf")
plot(ANC_3)
dev.off()

Nuts_For_SSL4$Anions_Eq_4<-Nuts_For_SSL4$NO3+Nuts_For_SSL4$SO4*2+Nuts_For_SSL4$R+Nuts_For_SSL4$Cl
Nuts_For_SSL4$Cations_Eq_4<-Nuts_For_SSL4$Ca*2+Nuts_For_SSL4$Mg*2+Nuts_For_SSL4$K+Nuts_For_SSL4$Na+Nuts_For_SSL4$NH4
Nuts_For_SSL4$ANC<-Nuts_For_SSL4$Cations_Eq_4-Nuts_For_SSL4$Anions_Eq_4

ANC_4<-ggplot()+geom_line(Nuts_For_SSL4, mapping= (aes(x=Date, y=Anions_Eq_4, color="Anion Eq.")))+geom_line(Nuts_For_SSL4, mapping= aes(x=Date, y=Cations_Eq_4, color="Cation Eq."))+
  geom_line(Nuts_For_SSL4, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_4.pdf")
plot(ANC_4)
dev.off()

Nuts_For_SSL5$Anions_Eq_5<-Nuts_For_SSL5$NO3+Nuts_For_SSL5$SO4*2+Nuts_For_SSL5$R+Nuts_For_SSL5$Cl
Nuts_For_SSL5$Cations_Eq_5<-Nuts_For_SSL5$Ca*2+Nuts_For_SSL5$Mg*2+Nuts_For_SSL5$K+Nuts_For_SSL5$Na+Nuts_For_SSL5$NH4
Nuts_For_SSL5$ANC<-Nuts_For_SSL5$Cations_Eq_5-Nuts_For_SSL5$Anions_Eq_5

ANC_5<-ggplot()+geom_line(Nuts_For_SSL5, mapping= (aes(x=Date, y=Anions_Eq_5, color="Anion Eq.")))+geom_line(Nuts_For_SSL5, mapping= aes(x=Date, y=Cations_Eq_5, color="Cation Eq."))+
  geom_line(Nuts_For_SSL5, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_5.pdf")
plot(ANC_5)
dev.off()

Nuts_For_SSL6$Anions_Eq_6<-Nuts_For_SSL6$NO3+Nuts_For_SSL6$SO4*2+Nuts_For_SSL6$R+Nuts_For_SSL6$Cl
Nuts_For_SSL6$Cations_Eq_6<-Nuts_For_SSL6$Ca*2+Nuts_For_SSL6$Mg*2+Nuts_For_SSL6$K+Nuts_For_SSL6$Na+Nuts_For_SSL6$NH4
Nuts_For_SSL6$ANC<-Nuts_For_SSL6$Cations_Eq_6-Nuts_For_SSL6$Anions_Eq_6

ANC_6<-ggplot()+geom_line(Nuts_For_SSL6, mapping= (aes(x=Date, y=Anions_Eq_6, color="Anion Eq.")))+geom_line(Nuts_For_SSL6, mapping= aes(x=Date, y=Cations_Eq_6, color="Cation Eq."))+
  geom_line(Nuts_For_SSL6, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_6.pdf")
plot(ANC_6)
dev.off()

Nuts_For_SSL7$Anions_Eq_7<-Nuts_For_SSL7$NO3+Nuts_For_SSL7$SO4*2+Nuts_For_SSL7$R+Nuts_For_SSL7$Cl
Nuts_For_SSL7$Cations_Eq_7<-Nuts_For_SSL7$Ca*2+Nuts_For_SSL7$Mg*2+Nuts_For_SSL7$K+Nuts_For_SSL7$Na+Nuts_For_SSL7$NH4
Nuts_For_SSL7$ANC<-Nuts_For_SSL7$Cations_Eq_7-Nuts_For_SSL7$Anions_Eq_7

ANC_7<-ggplot()+geom_line(Nuts_For_SSL7, mapping= (aes(x=Date, y=Anions_Eq_7, color="Anion Eq.")))+geom_line(Nuts_For_SSL7, mapping= aes(x=Date, y=Cations_Eq_7, color="Cation Eq."))+
  geom_line(Nuts_For_SSL7, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_7.pdf")
plot(ANC_7)
dev.off()

Nuts_For_SSL8$Anions_Eq_8<-Nuts_For_SSL8$NO3+Nuts_For_SSL8$SO4*2+Nuts_For_SSL8$R+Nuts_For_SSL8$Cl
Nuts_For_SSL8$Cations_Eq_8<-Nuts_For_SSL8$Ca*2+Nuts_For_SSL8$Mg*2+Nuts_For_SSL8$K+Nuts_For_SSL8$Na+Nuts_For_SSL8$NH4
Nuts_For_SSL8$ANC<-Nuts_For_SSL8$Cations_Eq_8-Nuts_For_SSL8$Anions_Eq_8

ANC_8<-ggplot()+geom_line(Nuts_For_SSL8, mapping= (aes(x=Date, y=Anions_Eq_8, color="Anion Eq.")))+geom_line(Nuts_For_SSL8, mapping= aes(x=Date, y=Cations_Eq_8, color="Cation Eq."))+
  geom_line(Nuts_For_SSL8, mapping= aes(x=Date, y=ANC, color="ANC"))+labs(y="Cation and Anion Equivalent Concentration (uEq/L)")
pdf("ANC_8.pdf")
plot(ANC_8)
dev.off()

