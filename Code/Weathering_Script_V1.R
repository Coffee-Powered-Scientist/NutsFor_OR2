#Make sure to change working directory and which file the data is pulled from!
setwd("~/Project_Master/Test_Rep/Output_LN_SED/Weathering")
library(ggplot2)
library(dplyr)
library(scales)
Nuts_For_Weathering1<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 1.csv", sep=";", header=FALSE)
Nuts_For_Weathering1<-Nuts_For_Weathering1[-c(1:2),]
Nuts_For_Weathering1$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering1$Ca<-Nuts_For_Weathering1$V3
Nuts_For_Weathering1$Mg<-Nuts_For_Weathering1$V4
Nuts_For_Weathering1$K<-Nuts_For_Weathering1$V5
Nuts_For_Weathering1$Na<-Nuts_For_Weathering1$V6
Nuts_For_Weathering1$Al<-Nuts_For_Weathering1$V7
Nuts_For_Weathering1$Si<-Nuts_For_Weathering1$V8
Nuts_For_Weathering1$P<-Nuts_For_Weathering1$V9

Nuts_For_Weathering1$Ca<-as.numeric(as.character(Nuts_For_Weathering1$Ca))
Nuts_For_Weathering1$Mg<-as.numeric(as.character(Nuts_For_Weathering1$Mg))
Nuts_For_Weathering1$K<-as.numeric(as.character(Nuts_For_Weathering1$K))
Nuts_For_Weathering1$Na<-as.numeric(as.character(Nuts_For_Weathering1$Na))
Nuts_For_Weathering1$Al<-as.numeric(as.character(Nuts_For_Weathering1$Al))
Nuts_For_Weathering1$Si<-as.numeric(as.character(Nuts_For_Weathering1$Si))
Nuts_For_Weathering1$P<-as.numeric(as.character(Nuts_For_Weathering1$P))

Nuts_For_Weathering2<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 2.csv", sep=";", header=FALSE)
Nuts_For_Weathering2<-Nuts_For_Weathering2[-c(1:2),]
Nuts_For_Weathering2$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering2$Ca<-Nuts_For_Weathering2$V3
Nuts_For_Weathering2$Mg<-Nuts_For_Weathering2$V4
Nuts_For_Weathering2$K<-Nuts_For_Weathering2$V5
Nuts_For_Weathering2$Na<-Nuts_For_Weathering2$V6
Nuts_For_Weathering2$Al<-Nuts_For_Weathering2$V7
Nuts_For_Weathering2$Si<-Nuts_For_Weathering2$V8
Nuts_For_Weathering2$P<-Nuts_For_Weathering2$V9

Nuts_For_Weathering2$Ca<-as.numeric(as.character(Nuts_For_Weathering2$Ca))
Nuts_For_Weathering2$Mg<-as.numeric(as.character(Nuts_For_Weathering2$Mg))
Nuts_For_Weathering2$K<-as.numeric(as.character(Nuts_For_Weathering2$K))
Nuts_For_Weathering2$Na<-as.numeric(as.character(Nuts_For_Weathering2$Na))
Nuts_For_Weathering2$Al<-as.numeric(as.character(Nuts_For_Weathering2$Al))
Nuts_For_Weathering2$Si<-as.numeric(as.character(Nuts_For_Weathering2$Si))
Nuts_For_Weathering2$P<-as.numeric(as.character(Nuts_For_Weathering2$P))

Nuts_For_Weathering3<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 3.csv", sep=";", header=FALSE)
Nuts_For_Weathering3<-Nuts_For_Weathering3[-c(1:2),]
Nuts_For_Weathering3$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering3$Ca<-Nuts_For_Weathering3$V3
Nuts_For_Weathering3$Mg<-Nuts_For_Weathering3$V4
Nuts_For_Weathering3$K<-Nuts_For_Weathering3$V5
Nuts_For_Weathering3$Na<-Nuts_For_Weathering3$V6
Nuts_For_Weathering3$Al<-Nuts_For_Weathering3$V7
Nuts_For_Weathering3$Si<-Nuts_For_Weathering3$V8
Nuts_For_Weathering3$P<-Nuts_For_Weathering3$V9

Nuts_For_Weathering3$Ca<-as.numeric(as.character(Nuts_For_Weathering3$Ca))
Nuts_For_Weathering3$Mg<-as.numeric(as.character(Nuts_For_Weathering3$Mg))
Nuts_For_Weathering3$K<-as.numeric(as.character(Nuts_For_Weathering3$K))
Nuts_For_Weathering3$Na<-as.numeric(as.character(Nuts_For_Weathering3$Na))
Nuts_For_Weathering3$Al<-as.numeric(as.character(Nuts_For_Weathering3$Al))
Nuts_For_Weathering3$Si<-as.numeric(as.character(Nuts_For_Weathering3$Si))
Nuts_For_Weathering3$P<-as.numeric(as.character(Nuts_For_Weathering3$P))



Weathering1Ca.G<-ggplot()+
  geom_line(data=Nuts_For_Weathering1, aes(x=Date, y=Ca, color="orange"))+geom_line()+labs(y=" Ca kg/ha/month")
pdf("Weathering1Ca.G.pdf", height= 5, width=20)                 
plot(Weathering1Ca.G)
dev.off()
Weathering1Mg.G<-ggplot(Nuts_For_Weathering1, aes(x=Date, y=Mg))+ geom_line()+labs(y="Mg kg/ha/month")
pdf("Weathering1Mg.G.pdf", height= 5, width=15)                 
plot(Weathering1Mg.G)
dev.off()
Weathering1K.G<-ggplot(Nuts_For_Weathering1, aes(x=Date, y=K))+ geom_line()+labs(y="K kg/ha/month")
pdf("Weathering1K.G.pdf", height= 5, width=15)                 
plot(Weathering1K.G)
dev.off()
Weathering1Na.G<-ggplot(Nuts_For_Weathering1, aes(x=Date, y=Na))+ geom_line()+labs(y="Na kg/ha/month")
pdf("Weathering1Na.G.pdf", height= 5, width=15)                 
plot(Weathering1Na.G)
dev.off()
Weathering1Al.G<-ggplot(Nuts_For_Weathering1, aes(x=Date, y=Al))+ geom_line()+labs(y="Al kg/ha/month")
pdf("Weathering1Al.G.pdf", height= 5, width=15)                 
plot(Weathering1Al.G)
dev.off()
Weathering1Si.G<-ggplot(Nuts_For_Weathering1, aes(x=Date, y=Si))+ geom_line()+labs(y="Si kg/ha/month")
pdf("Weathering1Si.G.pdf", height= 5, width=15)                 
plot(Weathering1Si.G)
dev.off()
Weathering1P.G<-ggplot(Nuts_For_Weathering1, aes(x=Date, y=P))+ geom_line()+labs(y=" PO4 kg/ha/month")
pdf("Weathering1P.G.pdf", height= 5, width=15)                 
plot(Weathering1P.G)
dev.off()



Weathering2Ca.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=Ca))+ geom_line()+labs(y="Ca kg/ha/month")
pdf("Weathering2Ca.G.pdf", height= 5, width=15)                 
plot(Weathering2Ca.G)
dev.off()
Weathering2Mg.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=Mg))+ geom_line()+labs(y="Mg kg/ha/month")
pdf("Weathering2Mg.G.pdf", height= 5, width=15)                 
plot(Weathering2Mg.G)
dev.off()
Weathering2K.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=K))+ geom_line()+labs(y="K kg/ha/month")
pdf("Weathering2K.G.pdf", height= 5, width=15)                 
plot(Weathering2K.G)
dev.off()
Weathering2Na.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=Na))+ geom_line()+labs(y="Na kg/ha/month")
pdf("Weathering2Na.G.pdf", height= 5, width=15)                 
plot(Weathering2Na.G)
dev.off()
Weathering2Al.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=Al))+ geom_line()+labs(y="Al kg/ha/month")
pdf("Weathering2Al.G.pdf", height= 5, width=15)                 
plot(Weathering2Al.G)
dev.off()
Weathering2Si.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=Si))+ geom_line()+labs(y="Si kg/ha/month")
pdf("Weathering2Si.G.pdf", height= 5, width=15)                 
plot(Weathering2Si.G)
dev.off()
Weathering2P.G<-ggplot(Nuts_For_Weathering2, aes(x=Date, y=P))+ geom_line()+labs(y="PO4 kg/ha/month")
pdf("Weathering2P.G.pdf", height= 5, width=15)                 
plot(Weathering2P.G)
dev.off()


Weathering3Ca.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=Ca))+ geom_line()+labs(y="Ca kg/ha/month")
pdf("Weathering3Ca.G.pdf", height= 5, width=15)                 
plot(Weathering3Ca.G)
dev.off()
Weathering3Mg.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=Mg))+ geom_line()+labs(y="Mg kg/ha/month")
pdf("Weathering3Mg.G.pdf", height= 5, width=15)                 
plot(Weathering3Mg.G)
dev.off()
Weathering3K.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=K))+ geom_line()+labs(y="K kg/ha/month")
pdf("Weathering3K.G.pdf", height= 5, width=15)                 
plot(Weathering3K.G)
dev.off()
Weathering3Na.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=Na))+ geom_line()+labs(y="Na kg/ha/month")
pdf("Weathering3Na.G.pdf", height= 5, width=15)                 
plot(Weathering3Na.G)
dev.off()
Weathering3Al.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=Al))+ geom_line()+labs(y="Al kg/ha/month")
pdf("Weathering3Al.G.pdf", height= 5, width=15)                 
plot(Weathering3Al.G)
dev.off()
Weathering3Si.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=Si))+ geom_line()+labs(y="Si kg/ha/month")
pdf("Weathering3Si.G.pdf", height= 5, width=15)                 
plot(Weathering3Si.G)
dev.off()
Weathering3P.G<-ggplot(Nuts_For_Weathering3, aes(x=Date, y=P))+ geom_line()+labs(y="PO4 kg/ha/month")
pdf("Weathering3P.G.pdf", height= 5, width=15)                 
plot(Weathering3P.G)
dev.off()

Nuts_For_Weathering4<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 4.csv", sep=";", header=FALSE)
Nuts_For_Weathering4<-Nuts_For_Weathering4[-c(1:2),]
Nuts_For_Weathering4$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering4$Ca<-Nuts_For_Weathering4$V3
Nuts_For_Weathering4$Mg<-Nuts_For_Weathering4$V4
Nuts_For_Weathering4$K<-Nuts_For_Weathering4$V5
Nuts_For_Weathering4$Na<-Nuts_For_Weathering4$V6
Nuts_For_Weathering4$Al<-Nuts_For_Weathering4$V7
Nuts_For_Weathering4$Si<-Nuts_For_Weathering4$V8
Nuts_For_Weathering4$P<-Nuts_For_Weathering4$V9

Nuts_For_Weathering4$Ca<-as.numeric(as.character(Nuts_For_Weathering4$Ca))
Nuts_For_Weathering4$Mg<-as.numeric(as.character(Nuts_For_Weathering4$Mg))
Nuts_For_Weathering4$K<-as.numeric(as.character(Nuts_For_Weathering4$K))
Nuts_For_Weathering4$Na<-as.numeric(as.character(Nuts_For_Weathering4$Na))
Nuts_For_Weathering4$Al<-as.numeric(as.character(Nuts_For_Weathering4$Al))
Nuts_For_Weathering4$Si<-as.numeric(as.character(Nuts_For_Weathering4$Si))
Nuts_For_Weathering4$P<-as.numeric(as.character(Nuts_For_Weathering4$P))

Weathering4Ca.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=Ca))+ geom_line()+labs(y="Ca kg/ha/month")
pdf("Weathering4Ca.G.pdf", height= 5, width=15)                 
plot(Weathering4Ca.G)
dev.off()
Weathering4Mg.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=Mg))+ geom_line()+labs(y="Mg kg/ha/month")
pdf("Weathering4Mg.G.pdf", height= 5, width=15)                 
plot(Weathering4Mg.G)
dev.off()
Weathering4K.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=K))+ geom_line()+labs(y="K kg/ha/month")
pdf("Weathering4K.G.pdf", height= 5, width=15)                 
plot(Weathering4K.G)
dev.off()
Weathering4Na.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=Na))+ geom_line()+labs(y="Na kg/ha/month")
pdf("Weathering4Na.G.pdf", height= 5, width=15)                 
plot(Weathering4Na.G)
dev.off()
Weathering4Al.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=Al))+ geom_line()+labs(y="Al kg/ha/month")
pdf("Weathering4Al.G.pdf", height= 5, width=15)                 
plot(Weathering4Al.G)
dev.off()
Weathering4Si.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=Si))+ geom_line()+labs(y="Si kg/ha/month")
pdf("Weathering4Si.G.pdf", height= 5, width=15)                 
plot(Weathering4Si.G)
dev.off()
Weathering4P.G<-ggplot(Nuts_For_Weathering4, aes(x=Date, y=P))+ geom_line()+labs(y="PO4 kg/ha/month")
pdf("Weathering4P.G.pdf", height= 5, width=15)                 
plot(Weathering4P.G)
dev.off()

Nuts_For_Weathering5<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 5.csv", sep=";", header=FALSE)
Nuts_For_Weathering5<-Nuts_For_Weathering5[-c(1:2),]
Nuts_For_Weathering5$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering5$Ca<-Nuts_For_Weathering5$V3
Nuts_For_Weathering5$Mg<-Nuts_For_Weathering5$V4
Nuts_For_Weathering5$K<-Nuts_For_Weathering5$V5
Nuts_For_Weathering5$Na<-Nuts_For_Weathering5$V6
Nuts_For_Weathering5$Al<-Nuts_For_Weathering5$V7
Nuts_For_Weathering5$Si<-Nuts_For_Weathering5$V8
Nuts_For_Weathering5$P<-Nuts_For_Weathering5$V9

Nuts_For_Weathering5$Ca<-as.numeric(as.character(Nuts_For_Weathering5$Ca))
Nuts_For_Weathering5$Mg<-as.numeric(as.character(Nuts_For_Weathering5$Mg))
Nuts_For_Weathering5$K<-as.numeric(as.character(Nuts_For_Weathering5$K))
Nuts_For_Weathering5$Na<-as.numeric(as.character(Nuts_For_Weathering5$Na))
Nuts_For_Weathering5$Al<-as.numeric(as.character(Nuts_For_Weathering5$Al))
Nuts_For_Weathering5$Si<-as.numeric(as.character(Nuts_For_Weathering5$Si))
Nuts_For_Weathering5$P<-as.numeric(as.character(Nuts_For_Weathering5$P))


Weathering5Ca.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=Ca))+ geom_line()+labs(y="Ca kg/ha/month")
pdf("Weathering5Ca.G.pdf", height= 5, width=15)                 
plot(Weathering5Ca.G)
dev.off()
Weathering5Mg.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=Mg))+ geom_line()+labs(y="Mg kg/ha/month")
pdf("Weathering5Mg.G.pdf", height= 5, width=15)                 
plot(Weathering5Mg.G)
dev.off()
Weathering5K.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=K))+ geom_line()+labs(y="K kg/ha/month")
pdf("Weathering5K.G.pdf", height= 5, width=15)                 
plot(Weathering5K.G)
dev.off()
Weathering5Na.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=Na))+ geom_line()+labs(y="Na kg/ha/month")
pdf("Weathering5Na.G.pdf", height= 5, width=15)                 
plot(Weathering5Na.G)
dev.off()
Weathering5Al.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=Al))+ geom_line()+labs(y="Al kg/ha/month")
pdf("Weathering5Al.G.pdf", height= 5, width=15)                 
plot(Weathering5Al.G)
dev.off()
Weathering5Si.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=Si))+ geom_line()+labs(y="Si kg/ha/month")
pdf("Weathering5Si.G.pdf", height= 5, width=15)                 
plot(Weathering5Si.G)
dev.off()
Weathering5P.G<-ggplot(Nuts_For_Weathering5, aes(x=Date, y=P))+ geom_line()+labs(y="PO4 kg/ha/month")
pdf("Weathering5P.G.pdf", height= 5, width=15)                 
plot(Weathering5P.G)
dev.off()

Nuts_For_Weathering6<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 6.csv", sep=";", header=FALSE)
Nuts_For_Weathering6<-Nuts_For_Weathering6[-c(1:2),]
Nuts_For_Weathering6$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering6$Ca<-Nuts_For_Weathering6$V3
Nuts_For_Weathering6$Mg<-Nuts_For_Weathering6$V4
Nuts_For_Weathering6$K<-Nuts_For_Weathering6$V5
Nuts_For_Weathering6$Na<-Nuts_For_Weathering6$V6
Nuts_For_Weathering6$Al<-Nuts_For_Weathering6$V7
Nuts_For_Weathering6$Si<-Nuts_For_Weathering6$V8
Nuts_For_Weathering6$P<-Nuts_For_Weathering6$V9


Nuts_For_Weathering6$Ca<-as.numeric(as.character(Nuts_For_Weathering6$Ca))
Nuts_For_Weathering6$Mg<-as.numeric(as.character(Nuts_For_Weathering6$Mg))
Nuts_For_Weathering6$K<-as.numeric(as.character(Nuts_For_Weathering6$K))
Nuts_For_Weathering6$Na<-as.numeric(as.character(Nuts_For_Weathering6$Na))
Nuts_For_Weathering6$Al<-as.numeric(as.character(Nuts_For_Weathering6$Al))
Nuts_For_Weathering6$Si<-as.numeric(as.character(Nuts_For_Weathering6$Si))
Nuts_For_Weathering6$P<-as.numeric(as.character(Nuts_For_Weathering6$P))

Weathering6Ca.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=Ca))+ geom_line()+labs(y="Ca kg/ha/month")
pdf("Weathering6Ca.G.pdf", height= 5, width=15)                 
plot(Weathering6Ca.G)
dev.off()
Weathering6Mg.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=Mg))+ geom_line()+labs(y="Mg kg/ha/month")
pdf("Weathering6Mg.G.pdf", height= 5, width=15)                 
plot(Weathering6Mg.G)
dev.off()
Weathering6K.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=K))+ geom_line()+labs(y="K kg/ha/month")
pdf("Weathering6K.G.pdf", height= 5, width=15)                 
plot(Weathering6K.G)
dev.off()
Weathering6Na.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=Na))+ geom_line()+labs(y="Na kg/ha/month")
pdf("Weathering6Na.G.pdf", height= 5, width=15)                 
plot(Weathering6Na.G)
dev.off()
Weathering6Al.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=Al))+ geom_line()+labs(y="Al kg/ha/month")
pdf("Weathering6Al.G.pdf", height= 5, width=15)                 
plot(Weathering6Al.G)
dev.off()
Weathering6Si.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=Si))+ geom_line()+labs(y=" Si kg/ha/month")
pdf("Weathering6Si.G.pdf", height= 5, width=15)                 
plot(Weathering6Si.G)
dev.off()
Weathering6P.G<-ggplot(Nuts_For_Weathering6, aes(x=Date, y=P))+ geom_line()+labs(y=" PO4 kg/ha/month")
pdf("Weathering6P.G.pdf", height= 5, width=15)                 
plot(Weathering6P.G)
dev.off()

Nuts_For_Weathering7<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 7.csv", sep=";", header=FALSE)
Nuts_For_Weathering7<-Nuts_For_Weathering7[-c(1:2),]
Nuts_For_Weathering7$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering7$Ca<-Nuts_For_Weathering7$V3
Nuts_For_Weathering7$Mg<-Nuts_For_Weathering7$V4
Nuts_For_Weathering7$K<-Nuts_For_Weathering7$V5
Nuts_For_Weathering7$Na<-Nuts_For_Weathering7$V6
Nuts_For_Weathering7$Al<-Nuts_For_Weathering7$V7
Nuts_For_Weathering7$Si<-Nuts_For_Weathering7$V8
Nuts_For_Weathering7$P<-Nuts_For_Weathering7$V9

Nuts_For_Weathering7$Ca<-as.numeric(as.character(Nuts_For_Weathering7$Ca))
Nuts_For_Weathering7$Mg<-as.numeric(as.character(Nuts_For_Weathering7$Mg))
Nuts_For_Weathering7$K<-as.numeric(as.character(Nuts_For_Weathering7$K))
Nuts_For_Weathering7$Na<-as.numeric(as.character(Nuts_For_Weathering7$Na))
Nuts_For_Weathering7$Al<-as.numeric(as.character(Nuts_For_Weathering7$Al))
Nuts_For_Weathering7$Si<-as.numeric(as.character(Nuts_For_Weathering7$Si))
Nuts_For_Weathering7$P<-as.numeric(as.character(Nuts_For_Weathering7$P))


Weathering7Ca.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=Ca))+ geom_line()+labs(y="Ca kg/ha/month")
pdf("Weathering7Ca.G.pdf", height= 5, width=15)                 
plot(Weathering7Ca.G)
dev.off()
Weathering7Mg.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=Mg))+ geom_line()+labs(y=" Mg kg/ha/month")
pdf("Weathering7Mg.G.pdf", height= 5, width=15)                 
plot(Weathering7Mg.G)
dev.off()
Weathering7K.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=K))+ geom_line()+labs(y=" K kg/ha/month")
pdf("Weathering7K.G.pdf", height= 5, width=15)                 
plot(Weathering7K.G)
dev.off()
Weathering7Na.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=Na))+ geom_line()+labs(y=" Na kg/ha/month")
pdf("Weathering7Na.G.pdf", height= 5, width=15)                 
plot(Weathering7Na.G)
dev.off()
Weathering7Al.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=Al))+ geom_line()+labs(y=" Al kg/ha/month")
pdf("Weathering7Al.G.pdf", height= 5, width=15)                 
plot(Weathering7Al.G)
dev.off()
Weathering7Si.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=Si))+ geom_line()+labs(y="Si kg/ha/month")
pdf("Weathering7Si.G.pdf", height= 5, width=15)                 
plot(Weathering7Si.G)
dev.off()
Weathering7P.G<-ggplot(Nuts_For_Weathering7, aes(x=Date, y=P))+ geom_line()+labs(y="PO4 kg/ha/month")
pdf("Weathering7P.G.pdf", height= 5, width=15)                 
plot(Weathering7P.G)
dev.off()

Nuts_For_Weathering8<-read.csv("~/NutsForSEDLN/Output data/Weathering/Weathering Layer 8.csv", sep=";", header=FALSE)
Nuts_For_Weathering8<-Nuts_For_Weathering8[-c(1:2),]
Nuts_For_Weathering8$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

Nuts_For_Weathering8$Ca<-Nuts_For_Weathering8$V3
Nuts_For_Weathering8$Mg<-Nuts_For_Weathering8$V4
Nuts_For_Weathering8$K<-Nuts_For_Weathering8$V5
Nuts_For_Weathering8$Na<-Nuts_For_Weathering8$V6
Nuts_For_Weathering8$Al<-Nuts_For_Weathering8$V7
Nuts_For_Weathering8$Si<-Nuts_For_Weathering8$V8
Nuts_For_Weathering8$P<-Nuts_For_Weathering8$V9

Nuts_For_Weathering8$Ca<-as.numeric(as.character(Nuts_For_Weathering8$Ca))
Nuts_For_Weathering8$Mg<-as.numeric(as.character(Nuts_For_Weathering8$Mg))
Nuts_For_Weathering8$K<-as.numeric(as.character(Nuts_For_Weathering8$K))
Nuts_For_Weathering8$Na<-as.numeric(as.character(Nuts_For_Weathering8$Na))
Nuts_For_Weathering8$Al<-as.numeric(as.character(Nuts_For_Weathering8$Al))
Nuts_For_Weathering8$Si<-as.numeric(as.character(Nuts_For_Weathering8$Si))
Nuts_For_Weathering8$P<-as.numeric(as.character(Nuts_For_Weathering8$P))

Weathering8Ca.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=Ca))+ geom_line()+labs(y=" Ca kg/ha/month")
pdf("Weathering8Ca.G.pdf", height= 5, width=15)                 
plot(Weathering8Ca.G)
dev.off()
Weathering8Mg.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=Mg))+ geom_line()+labs(y=" Mg kg/ha/month")
pdf("Weathering8Mg.G.pdf", height= 5, width=15)                 
plot(Weathering8Mg.G)
dev.off()
Weathering8K.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=K))+ geom_line()+labs(y=" K kg/ha/month")
pdf("Weathering8K.G.pdf", height= 5, width=15)                 
plot(Weathering8K.G)
dev.off()
Weathering8Na.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=Na))+ geom_line()+labs(y=" Na kg/ha/month")
pdf("Weathering8Na.G.pdf", height= 5, width=15)                 
plot(Weathering8Na.G)
dev.off()
Weathering8Al.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=Al))+ geom_line()+labs(y=" Al kg/ha/month")
pdf("Weathering8Al.G.pdf", height= 5, width=15)                 
plot(Weathering8Al.G)
dev.off()
Weathering8Si.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=Si))+ geom_line()+labs(y=" Si kg/ha/month")
pdf("Weathering8Si.G.pdf", height= 5, width=15)                 
plot(Weathering8Si.G)
dev.off()
Weathering8P.G<-ggplot(Nuts_For_Weathering8, aes(x=Date, y=P))+ geom_line()+labs(y=" PO4 kg/ha/month")
pdf("Weathering8P.G.pdf", height= 5, width=15)                 
plot(Weathering8P.G)
dev.off()