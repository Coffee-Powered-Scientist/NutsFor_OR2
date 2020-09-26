#Test Script for Git Integration
#This code will yoink NutsFor data after simulation

#Data is pulled from a directory which is automatically updated with every simulation run
setwd("~/OR2 SED LN")
library(ggplot2)
library(dplyr)
Nuts_For_SSL1<-read.csv("~/NutsForSEDLN/Output data/Soil solution/Soil solution chemistry Layer 1.csv", sep=";", header=TRUE)
#Deletes the 1st row, which just has unit designation (umol/L)
#SSL is the Soil Solution Layer, SSLL is leaching layer, number designates layer
Nuts_For_SSL1<-Nuts_For_SSL1[-c(1),]

#Check if it worked

#Add a date colum for more easy graphing
Nuts_For_SSL1$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)


#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL1$Ca<-as.numeric(as.character(Nuts_For_SSL1$Ca))
Nuts_For_SSL1$Mg<-as.numeric(as.character(Nuts_For_SSL1$Mg))
Nuts_For_SSL1$K<-as.numeric(as.character(Nuts_For_SSL1$K))
Nuts_For_SSL1$Na<-as.numeric(as.character(Nuts_For_SSL1$Na))
Nuts_For_SSL1$NO3<-as.numeric(as.character(Nuts_For_SSL1$NO3))
Nuts_For_SSL1$NH4<-as.numeric(as.character(Nuts_For_SSL1$NH4))
Nuts_For_SSL1$SO4<-as.numeric(as.character(Nuts_For_SSL1$SO4))
Nuts_For_SSL1$Cl<-as.numeric(as.character(Nuts_For_SSL1$Cl))
Nuts_For_SSL1$P<-as.numeric(as.character(Nuts_For_SSL1$P))
Nuts_For_SSL1$DOC<-as.numeric(as.character(Nuts_For_SSL1$DOC))
Nuts_For_SSL1$pH<-as.numeric(as.character(Nuts_For_SSL1$pH))
Nuts_For_SSL1$Al<-as.numeric(as.character(Nuts_For_SSL1$Al))
Nuts_For_SSL1$Si<-as.numeric(as.character(Nuts_For_SSL1$Si))
Nuts_For_SSL1$R<-as.numeric(as.character(Nuts_For_SSL1$R))
SSL1Ca.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Ca, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  
pdf("SSL1Ca.G.pdf", height= 10, width=20)                 
plot(SSL1Ca.G)
dev.off()
SSL1Mg.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Mg, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1Mg.G.pdf", height= 5, width=15)                 
plot(SSL1Mg.G)
dev.off()
SSL1K.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1K.G.pdf", height= 5, width=15)                 
plot(SSL1K.G)
dev.off()
SSL1Na.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1Na.G.pdf", height= 5, width=15)                 
plot(SSL1Na.G)
dev.off()
SSL1NO3.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=NO3, group =1))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1NO3.G.pdf", height= 5, width=15)                 
plot(SSL1NO3.G)
dev.off()
SSL1NH4.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1NH4.G.pdf", height= 5, width=15)                 
plot(SSL1NH4.G)
dev.off()
SSL1SO4.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1SO4.G.pdf", height= 5, width=15)                 
plot(SSL1SO4.G)
dev.off()
SSL1Cl.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1Cl.G.pdf", height= 5, width=15)                 
plot(SSL1Cl.G)
dev.off()
SSL1P.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1P.G.pdf", height= 5, width=15)                 
plot(SSL1P.G)
dev.off()
SSL1DOC.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1DOC.G.pdf", height= 5, width=15)                 
plot(SSL1DOC.G)
dev.off()
SSL1pH.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1pH.G.pdf", height= 5, width=15)                 
plot(SSL1pH.G)
dev.off()
SSL1Al.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1Al.G.pdf", height= 5, width=15)                 
plot(SSL1Al.G)
dev.off()
SSL1Si.G<-ggplot(Nuts_For_SSL1, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))
pdf("SSL1Si.G.pdf", height= 5, width=15)                 
plot(SSL1Si.G)
dev.off()
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



#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL2$Ca<-as.numeric(as.character(Nuts_For_SSL2$Ca))
Nuts_For_SSL2$Mg<-as.numeric(as.character(Nuts_For_SSL2$Mg))
Nuts_For_SSL2$K<-as.numeric(as.character(Nuts_For_SSL2$K))
Nuts_For_SSL2$Na<-as.numeric(as.character(Nuts_For_SSL2$Na))
Nuts_For_SSL2$NO3<-as.numeric(as.character(Nuts_For_SSL2$NO3))
Nuts_For_SSL2$NH4<-as.numeric(as.character(Nuts_For_SSL2$NH4))
Nuts_For_SSL2$SO4<-as.numeric(as.character(Nuts_For_SSL2$SO4))
Nuts_For_SSL2$Cl<-as.numeric(as.character(Nuts_For_SSL2$Cl))
Nuts_For_SSL2$P<-as.numeric(as.character(Nuts_For_SSL2$P))
Nuts_For_SSL2$DOC<-as.numeric(as.character(Nuts_For_SSL2$DOC))
Nuts_For_SSL2$pH<-as.numeric(as.character(Nuts_For_SSL2$pH))
Nuts_For_SSL2$Al<-as.numeric(as.character(Nuts_For_SSL2$Al))
Nuts_For_SSL2$Si<-as.numeric(as.character(Nuts_For_SSL2$Si))
Nuts_For_SSL2$R<-as.numeric(as.character(Nuts_For_SSL2$R))
SSL2Ca.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL2Ca.G.pdf", height= 5, width=15)                 
plot(SSL2Ca.G)
dev.off()
SSL2Mg.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL2Mg.G.pdf", height= 5, width=15)                 
plot(SSL2Mg.G)
dev.off()
SSL2K.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL2K.G.pdf", height= 5, width=15)                 
plot(SSL2K.G)
dev.off()
SSL2Na.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL2Na.G.pdf", height= 5, width=15)                 
plot(SSL2Na.G)
dev.off()
SSL2NO3.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL2NO3.G.pdf", height= 5, width=15)                 
plot(SSL2NO3.G)
dev.off()
SSL2NH4.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL2NH4.G.pdf", height= 5, width=15)                 
plot(SSL2NH4.G)
dev.off()
SSL2SO4.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL2SO4.G.pdf", height= 5, width=15)                 
plot(SSL2SO4.G)
dev.off()
SSL2Cl.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL2Cl.G.pdf", height= 5, width=15)                 
plot(SSL2Cl.G)
dev.off()
SSL2P.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL2P.G.pdf", height= 5, width=15)                 
plot(SSL2P.G)
dev.off()
SSL2DOC.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL2DOC.G.pdf", height= 5, width=15)                 
plot(SSL2DOC.G)
dev.off()
SSL2pH.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL2pH.G.pdf", height= 5, width=15)                 
plot(SSL2pH.G)
dev.off()
SSL2Al.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL2Al.G.pdf", height= 5, width=15)                 
plot(SSL2Al.G)
dev.off()
SSL2Si.G<-ggplot(Nuts_For_SSL2, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL2Si.G.pdf", height= 5, width=15)                 
plot(SSL2Si.G)
dev.off()

#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL3$Ca<-as.numeric(as.character(Nuts_For_SSL3$Ca))
Nuts_For_SSL3$Mg<-as.numeric(as.character(Nuts_For_SSL3$Mg))
Nuts_For_SSL3$K<-as.numeric(as.character(Nuts_For_SSL3$K))
Nuts_For_SSL3$Na<-as.numeric(as.character(Nuts_For_SSL3$Na))
Nuts_For_SSL3$NO3<-as.numeric(as.character(Nuts_For_SSL3$NO3))
Nuts_For_SSL3$NH4<-as.numeric(as.character(Nuts_For_SSL3$NH4))
Nuts_For_SSL3$SO4<-as.numeric(as.character(Nuts_For_SSL3$SO4))
Nuts_For_SSL3$Cl<-as.numeric(as.character(Nuts_For_SSL3$Cl))
Nuts_For_SSL3$P<-as.numeric(as.character(Nuts_For_SSL3$P))
Nuts_For_SSL3$DOC<-as.numeric(as.character(Nuts_For_SSL3$DOC))
Nuts_For_SSL3$pH<-as.numeric(as.character(Nuts_For_SSL3$pH))
Nuts_For_SSL3$Al<-as.numeric(as.character(Nuts_For_SSL3$Al))
Nuts_For_SSL3$Si<-as.numeric(as.character(Nuts_For_SSL3$Si))
Nuts_For_SSL3$R<-as.numeric(as.character(Nuts_For_SSL3$R))
SSL3Ca.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL3Ca.G.pdf", height= 5, width=15)                 
plot(SSL3Ca.G)
dev.off()
SSL3Mg.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL3Mg.G.pdf", height= 5, width=15)                 
plot(SSL3Mg.G)
dev.off()
SSL3K.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL3K.G.pdf", height= 5, width=15)                 
plot(SSL3K.G)
dev.off()
SSL3Na.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL3Na.G.pdf", height= 5, width=15)                 
plot(SSL3Na.G)
dev.off()
SSL3NO3.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL3NO3.G.pdf", height= 5, width=15)                 
plot(SSL3NO3.G)
dev.off()
SSL3NH4.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL3NH4.G.pdf", height= 5, width=15)                 
plot(SSL3NH4.G)
dev.off()
SSL3SO4.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL3SO4.G.pdf", height= 5, width=15)                 
plot(SSL3SO4.G)
dev.off()
SSL3Cl.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL3Cl.G.pdf", height= 5, width=15)                 
plot(SSL3Cl.G)
dev.off()
SSL3P.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL3P.G.pdf", height= 5, width=15)                 
plot(SSL3P.G)
dev.off()
SSL3DOC.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL3DOC.G.pdf", height= 5, width=15)                 
plot(SSL3DOC.G)
dev.off()
SSL3pH.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL3pH.G.pdf", height= 5, width=15)                 
plot(SSL3pH.G)
dev.off()
SSL3Al.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL3Al.G.pdf", height= 5, width=15)                 
plot(SSL3Al.G)
dev.off()
SSL3Si.G<-ggplot(Nuts_For_SSL3, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL3Si.G.pdf", height= 5, width=15)                 
plot(SSL3Si.G)
dev.off()


#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL4$Ca<-as.numeric(as.character(Nuts_For_SSL4$Ca))
Nuts_For_SSL4$Mg<-as.numeric(as.character(Nuts_For_SSL4$Mg))
Nuts_For_SSL4$K<-as.numeric(as.character(Nuts_For_SSL4$K))
Nuts_For_SSL4$Na<-as.numeric(as.character(Nuts_For_SSL4$Na))
Nuts_For_SSL4$NO3<-as.numeric(as.character(Nuts_For_SSL4$NO3))
Nuts_For_SSL4$NH4<-as.numeric(as.character(Nuts_For_SSL4$NH4))
Nuts_For_SSL4$SO4<-as.numeric(as.character(Nuts_For_SSL4$SO4))
Nuts_For_SSL4$Cl<-as.numeric(as.character(Nuts_For_SSL4$Cl))
Nuts_For_SSL4$P<-as.numeric(as.character(Nuts_For_SSL4$P))
Nuts_For_SSL4$DOC<-as.numeric(as.character(Nuts_For_SSL4$DOC))
Nuts_For_SSL4$pH<-as.numeric(as.character(Nuts_For_SSL4$pH))
Nuts_For_SSL4$Al<-as.numeric(as.character(Nuts_For_SSL4$Al))
Nuts_For_SSL4$Si<-as.numeric(as.character(Nuts_For_SSL4$Si))
Nuts_For_SSL4$R<-as.numeric(as.character(Nuts_For_SSL4$R))
SSL4Ca.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL4Ca.G.pdf", height= 5, width=15)                 
plot(SSL4Ca.G)
dev.off()
SSL4Mg.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL4Mg.G.pdf", height= 5, width=15)                 
plot(SSL4Mg.G)
dev.off()
SSL4K.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL4K.G.pdf", height= 5, width=15)                 
plot(SSL4K.G)
dev.off()
SSL4Na.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL4Na.G.pdf", height= 5, width=15)                 
plot(SSL4Na.G)
dev.off()
SSL4NO3.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL4NO3.G.pdf", height= 5, width=15)                 
plot(SSL4NO3.G)
dev.off()
SSL4NH4.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL4NH4.G.pdf", height= 5, width=15)                 
plot(SSL4NH4.G)
dev.off()
SSL4SO4.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL4SO4.G.pdf", height= 5, width=15)                 
plot(SSL4SO4.G)
dev.off()
SSL4Cl.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL4Cl.G.pdf", height= 5, width=15)                 
plot(SSL4Cl.G)
dev.off()
SSL4P.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL4P.G.pdf", height= 5, width=15)                 
plot(SSL4P.G)
dev.off()
SSL4DOC.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL4DOC.G.pdf", height= 5, width=15)                 
plot(SSL4DOC.G)
dev.off()
SSL4pH.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL4pH.G.pdf", height= 5, width=15)                 
plot(SSL4pH.G)
dev.off()
SSL4Al.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL4Al.G.pdf", height= 5, width=15)                 
plot(SSL4Al.G)
dev.off()
SSL4Si.G<-ggplot(Nuts_For_SSL4, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL4Si.G.pdf", height= 5, width=15)                 
plot(SSL4Si.G)
dev.off()

#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL5$Ca<-as.numeric(as.character(Nuts_For_SSL5$Ca))
Nuts_For_SSL5$Mg<-as.numeric(as.character(Nuts_For_SSL5$Mg))
Nuts_For_SSL5$K<-as.numeric(as.character(Nuts_For_SSL5$K))
Nuts_For_SSL5$Na<-as.numeric(as.character(Nuts_For_SSL5$Na))
Nuts_For_SSL5$NO3<-as.numeric(as.character(Nuts_For_SSL5$NO3))
Nuts_For_SSL5$NH4<-as.numeric(as.character(Nuts_For_SSL5$NH4))
Nuts_For_SSL5$SO4<-as.numeric(as.character(Nuts_For_SSL5$SO4))
Nuts_For_SSL5$Cl<-as.numeric(as.character(Nuts_For_SSL5$Cl))
Nuts_For_SSL5$P<-as.numeric(as.character(Nuts_For_SSL5$P))
Nuts_For_SSL5$DOC<-as.numeric(as.character(Nuts_For_SSL5$DOC))
Nuts_For_SSL5$pH<-as.numeric(as.character(Nuts_For_SSL5$pH))
Nuts_For_SSL5$Al<-as.numeric(as.character(Nuts_For_SSL5$Al))
Nuts_For_SSL5$Si<-as.numeric(as.character(Nuts_For_SSL5$Si))
Nuts_For_SSL5$R<-as.numeric(as.character(Nuts_For_SSL5$R))
SSL5Ca.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL5Ca.G.pdf", height= 5, width=15)                 
plot(SSL5Ca.G)
dev.off()
SSL5Mg.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL5Mg.G.pdf", height= 5, width=15)                 
plot(SSL5Mg.G)
dev.off()
SSL5K.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL5K.G.pdf", height= 5, width=15)                 
plot(SSL5K.G)
dev.off()
SSL5Na.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL5Na.G.pdf", height= 5, width=15)                 
plot(SSL5Na.G)
dev.off()
SSL5NO3.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL5NO3.G.pdf", height= 5, width=15)                 
plot(SSL5NO3.G)
dev.off()
SSL5NH4.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL5NH4.G.pdf", height= 5, width=15)                 
plot(SSL5NH4.G)
dev.off()
SSL5SO4.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL5SO4.G.pdf", height= 5, width=15)                 
plot(SSL5SO4.G)
dev.off()
SSL5Cl.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL5Cl.G.pdf", height= 5, width=15)                 
plot(SSL5Cl.G)
dev.off()
SSL5P.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL5P.G.pdf", height= 5, width=15)                 
plot(SSL5P.G)
dev.off()
SSL5DOC.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL5DOC.G.pdf", height= 5, width=15)                 
plot(SSL5DOC.G)
dev.off()
SSL5pH.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL5pH.G.pdf", height= 5, width=15)                 
plot(SSL5pH.G)
dev.off()
SSL5Al.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL5Al.G.pdf", height= 5, width=15)                 
plot(SSL5Al.G)
dev.off()
SSL5Si.G<-ggplot(Nuts_For_SSL5, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL5Si.G.pdf", height= 5, width=15)                 
plot(SSL5Si.G)
dev.off()


#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL6$Ca<-as.numeric(as.character(Nuts_For_SSL6$Ca))
Nuts_For_SSL6$Mg<-as.numeric(as.character(Nuts_For_SSL6$Mg))
Nuts_For_SSL6$K<-as.numeric(as.character(Nuts_For_SSL6$K))
Nuts_For_SSL6$Na<-as.numeric(as.character(Nuts_For_SSL6$Na))
Nuts_For_SSL6$NO3<-as.numeric(as.character(Nuts_For_SSL6$NO3))
Nuts_For_SSL6$NH4<-as.numeric(as.character(Nuts_For_SSL6$NH4))
Nuts_For_SSL6$SO4<-as.numeric(as.character(Nuts_For_SSL6$SO4))
Nuts_For_SSL6$Cl<-as.numeric(as.character(Nuts_For_SSL6$Cl))
Nuts_For_SSL6$P<-as.numeric(as.character(Nuts_For_SSL6$P))
Nuts_For_SSL6$DOC<-as.numeric(as.character(Nuts_For_SSL6$DOC))
Nuts_For_SSL6$pH<-as.numeric(as.character(Nuts_For_SSL6$pH))
Nuts_For_SSL6$Al<-as.numeric(as.character(Nuts_For_SSL6$Al))
Nuts_For_SSL6$Si<-as.numeric(as.character(Nuts_For_SSL6$Si))
Nuts_For_SSL6$R<-as.numeric(as.character(Nuts_For_SSL6$R))
SSL6Ca.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL6Ca.G.pdf", height= 5, width=15)                 
plot(SSL6Ca.G)
dev.off()
SSL6Mg.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL6Mg.G.pdf", height= 5, width=15)                 
plot(SSL6Mg.G)
dev.off()
SSL6K.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL6K.G.pdf", height= 5, width=15)                 
plot(SSL6K.G)
dev.off()
SSL6Na.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL6Na.G.pdf", height= 5, width=15)                 
plot(SSL6Na.G)
dev.off()
SSL6NO3.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL6NO3.G.pdf", height= 5, width=15)                 
plot(SSL6NO3.G)
dev.off()
SSL6NH4.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL6NH4.G.pdf", height= 5, width=15)                 
plot(SSL6NH4.G)
dev.off()
SSL6SO4.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL6SO4.G.pdf", height= 5, width=15)                 
plot(SSL6SO4.G)
dev.off()
SSL6Cl.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL6Cl.G.pdf", height= 5, width=15)                 
plot(SSL6Cl.G)
dev.off()
SSL6P.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL6P.G.pdf", height= 5, width=15)                 
plot(SSL6P.G)
dev.off()
SSL6DOC.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL6DOC.G.pdf", height= 5, width=15)                 
plot(SSL6DOC.G)
dev.off()
SSL6pH.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL6pH.G.pdf", height= 5, width=15)                 
plot(SSL6pH.G)
dev.off()
SSL6Al.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL6Al.G.pdf", height= 5, width=15)                 
plot(SSL6Al.G)
dev.off()
SSL6Si.G<-ggplot(Nuts_For_SSL6, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL6Si.G.pdf", height= 5, width=15)                 
plot(SSL6Si.G)
dev.off()

#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL7$Ca<-as.numeric(as.character(Nuts_For_SSL7$Ca))
Nuts_For_SSL7$Mg<-as.numeric(as.character(Nuts_For_SSL7$Mg))
Nuts_For_SSL7$K<-as.numeric(as.character(Nuts_For_SSL7$K))
Nuts_For_SSL7$Na<-as.numeric(as.character(Nuts_For_SSL7$Na))
Nuts_For_SSL7$NO3<-as.numeric(as.character(Nuts_For_SSL7$NO3))
Nuts_For_SSL7$NH4<-as.numeric(as.character(Nuts_For_SSL7$NH4))
Nuts_For_SSL7$SO4<-as.numeric(as.character(Nuts_For_SSL7$SO4))
Nuts_For_SSL7$Cl<-as.numeric(as.character(Nuts_For_SSL7$Cl))
Nuts_For_SSL7$P<-as.numeric(as.character(Nuts_For_SSL7$P))
Nuts_For_SSL7$DOC<-as.numeric(as.character(Nuts_For_SSL7$DOC))
Nuts_For_SSL7$pH<-as.numeric(as.character(Nuts_For_SSL7$pH))
Nuts_For_SSL7$Al<-as.numeric(as.character(Nuts_For_SSL7$Al))
Nuts_For_SSL7$Si<-as.numeric(as.character(Nuts_For_SSL7$Si))
Nuts_For_SSL7$R<-as.numeric(as.character(Nuts_For_SSL7$R))
SSL7Ca.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL7Ca.G.pdf", height= 5, width=15)                 
plot(SSL7Ca.G)
dev.off()
SSL7Mg.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL7Mg.G.pdf", height= 5, width=15)                 
plot(SSL7Mg.G)
dev.off()
SSL7K.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL7K.G.pdf", height= 5, width=15)                 
plot(SSL7K.G)
dev.off()
SSL7Na.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL7Na.G.pdf", height= 5, width=15)                 
plot(SSL7Na.G)
dev.off()
SSL7NO3.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL7NO3.G.pdf", height= 5, width=15)                 
plot(SSL7NO3.G)
dev.off()
SSL7NH4.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL7NH4.G.pdf", height= 5, width=15)                 
plot(SSL7NH4.G)
dev.off()
SSL7SO4.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL7SO4.G.pdf", height= 5, width=15)                 
plot(SSL7SO4.G)
dev.off()
SSL7Cl.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL7Cl.G.pdf", height= 5, width=15)                 
plot(SSL7Cl.G)
dev.off()
SSL7P.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL7P.G.pdf", height= 5, width=15)                 
plot(SSL7P.G)
dev.off()
SSL7DOC.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL7DOC.G.pdf", height= 5, width=15)                 
plot(SSL7DOC.G)
dev.off()
SSL7pH.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL7pH.G.pdf", height= 5, width=15)                 
plot(SSL7pH.G)
dev.off()
SSL7Al.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL7Al.G.pdf", height= 5, width=15)                 
plot(SSL7Al.G)
dev.off()
SSL7Si.G<-ggplot(Nuts_For_SSL7, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL7Si.G.pdf", height= 5, width=15)                 
plot(SSL7Si.G)
dev.off()

#Gets rid of issue where values show up as characters on the graph
Nuts_For_SSL8$Ca<-as.numeric(as.character(Nuts_For_SSL8$Ca))
Nuts_For_SSL8$Mg<-as.numeric(as.character(Nuts_For_SSL8$Mg))
Nuts_For_SSL8$K<-as.numeric(as.character(Nuts_For_SSL8$K))
Nuts_For_SSL8$Na<-as.numeric(as.character(Nuts_For_SSL8$Na))
Nuts_For_SSL8$NO3<-as.numeric(as.character(Nuts_For_SSL8$NO3))
Nuts_For_SSL8$NH4<-as.numeric(as.character(Nuts_For_SSL8$NH4))
Nuts_For_SSL8$SO4<-as.numeric(as.character(Nuts_For_SSL8$SO4))
Nuts_For_SSL8$Cl<-as.numeric(as.character(Nuts_For_SSL8$Cl))
Nuts_For_SSL8$P<-as.numeric(as.character(Nuts_For_SSL8$P))
Nuts_For_SSL8$DOC<-as.numeric(as.character(Nuts_For_SSL8$DOC))
Nuts_For_SSL8$pH<-as.numeric(as.character(Nuts_For_SSL8$pH))
Nuts_For_SSL8$Al<-as.numeric(as.character(Nuts_For_SSL8$Al))
Nuts_For_SSL8$Si<-as.numeric(as.character(Nuts_For_SSL8$Si))
Nuts_For_SSL8$R<-as.numeric(as.character(Nuts_For_SSL8$R))
SSL8Ca.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Ca))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")
pdf("SSL8Ca.G.pdf", height= 5, width=15)                 
plot(SSL8Ca.G)
dev.off()
SSL8Mg.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Mg))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")
pdf("SSL8Mg.G.pdf", height= 5, width=15)                 
plot(SSL8Mg.G)
dev.off()
SSL8K.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=K))+ geom_line()+labs(y="Soil Solution  K (umol/L)")
pdf("SSL8K.G.pdf", height= 5, width=15)                 
plot(SSL8K.G)
dev.off()
SSL8Na.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Na))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")
pdf("SSL8Na.G.pdf", height= 5, width=15)                 
plot(SSL8Na.G)
dev.off()
SSL8NO3.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=NO3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")
pdf("SSL8NO3.G.pdf", height= 5, width=15)                 
plot(SSL8NO3.G)
dev.off()
SSL8NH4.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=NH4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")
pdf("SSL8NH4.G.pdf", height= 5, width=15)                 
plot(SSL8NH4.G)
dev.off()
SSL8SO4.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=SO4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")
pdf("SSL8SO4.G.pdf", height= 5, width=15)                 
plot(SSL8SO4.G)
dev.off()
SSL8Cl.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Cl))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")
pdf("SSL8Cl.G.pdf", height= 5, width=15)                 
plot(SSL8Cl.G)
dev.off()
SSL8P.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=P))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")
pdf("SSL8P.G.pdf", height= 5, width=15)                 
plot(SSL8P.G)
dev.off()
SSL8DOC.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=DOC))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")
pdf("SSL8DOC.G.pdf", height= 5, width=15)                 
plot(SSL8DOC.G)
dev.off()
SSL8pH.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=pH))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")
pdf("SSL8pH.G.pdf", height= 5, width=15)                 
plot(SSL8pH.G)
dev.off()
SSL8Al.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Al))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")
pdf("SSL8Al.G.pdf", height= 5, width=15)                 
plot(SSL8Al.G)
dev.off()
SSL8Si.G<-ggplot(Nuts_For_SSL8, aes(x=Date, y=Si))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")
pdf("SSL8Si.G.pdf", height= 5, width=15)                 
plot(SSL8Si.G)
dev.off()

Lys_Df<-read.csv("~/Lysimeter Dir/LysLNS.csv", sep=";", header=TRUE)
LNSCalcium_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Ca, sd.Ca) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSCalcium_L1$Ca<-LNSCalcium_L1$Ca*(1000/40.078)
LNSCalcium_L1$sd.Ca<-LNSCalcium_L1$sd.Ca*(1000/40.078)
LNSCalcium_L1$Month<-LNSCalcium_L1$Date

LNSCalcium_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Ca, sd.Ca) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSCalcium_L2$Ca<-LNSCalcium_L2$Ca*(1000/40.078)
LNSCalcium_L2$sd.Ca<-LNSCalcium_L2$sd.Ca*(1000/40.078)
LNSCalcium_L2$Month<-LNSCalcium_L2$Date

LNSMagnesium_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Mg, sd.Mg) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSMagnesium_L1$Mg<-LNSMagnesium_L1$Mg*(1000/24.305)
LNSMagnesium_L1$sd.Mg<-LNSMagnesium_L1$sd.Mg*(1000/24.305)
LNSMagnesium_L1$Month<-LNSMagnesium_L1$Date


LNSMagnesium_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Mg, sd.Mg) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSMagnesium_L2$Mg<-LNSMagnesium_L2$Mg*(1000/24.305)
LNSMagnesium_L2$sd.Mg<-LNSMagnesium_L2$sd.Mg*(1000/24.305)
LNSMagnesium_L2$Month<-LNSMagnesium_L2$Date




Ca1<-aggregate(Ca ~ Month , Nuts_For_SSL1 , mean )
Ca2<-aggregate(Ca~Month, Nuts_For_SSL2, mean)
Ca3<-aggregate(Ca~Month, Nuts_For_SSL3, mean)
Avg_Ca_L1<-ggplot()+geom_line(Ca1, mapping= aes(x=Month, y=Ca, color="Layer 1"))+
  geom_line(Ca2, mapping = aes(x=Month, y=Ca, color="Layer 2"))+
  geom_line(Ca3, mapping = aes(x=Month, y=Ca, color="Layer 3"))+
  geom_line(LNSCalcium_L1, mapping=aes(x=Month, y=Ca, group="L1" ))+
  geom_line(data=LNSCalcium_L1[!is.na(LNSCalcium_L1$Ca),], aes(x=Month, y=Ca, group="NA"), linetype="dashed")+
  scale_linetype_manual()+
  geom_ribbon(data=LNSCalcium_L1, aes(x= Month, ymin=pmax(Ca-sd.Ca, 0), ymax=Ca+sd.Ca, group=1),linetype=0,
              alpha=0.2)+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Ca (umol/L)")+
  
  
  pdf("Avg_Ca_L1.pdf", height=5, width=15)
plot(Avg_Ca_L1)
dev.off()

Ca4<-aggregate(Ca~Month, Nuts_For_SSL4, mean)
Ca5<-aggregate(Ca~Month, Nuts_For_SSL5, mean)
Ca6<-aggregate(Ca~Month, Nuts_For_SSL6, mean)
Ca7<-aggregate(Ca~Month, Nuts_For_SSL7, mean)
Ca8<-aggregate(Ca~Month, Nuts_For_SSL8, mean)
Avg_Ca_L2<-ggplot()+geom_line(Ca4, mapping= aes(x=Month, y=Ca, color="Layer 4"))+
  geom_line(Ca5, mapping = aes(x=Month, y=Ca, color="Layer 5"))+
  geom_line(Ca6, mapping = aes(x=Month, y=Ca, color="Layer 6"))+
  geom_line(Ca7, mapping = aes(x=Month, y=Ca, color="Layer 7"))+
  geom_line(Ca8, mapping = aes(x=Month, y=Ca, color="Layer 8"))+
  geom_line(LNSCalcium_L2, mapping=aes(x=Month, y=Ca, group="L2" ))+
  geom_ribbon(data=LNSCalcium_L2, aes(x= Month, ymin=pmax(Ca-sd.Ca, 0), ymax=Ca+sd.Ca, group=1),linetype=0,
              alpha=0.2)+
  geom_line(data=LNSCalcium_L2[!is.na(LNSCalcium_L2$Ca),], aes(x=Month, y=Ca, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Ca (umol/L)")
pdf("Avg_Ca_L2.pdf", height=5, width=15)
plot(Avg_Ca_L2)
dev.off()


Mg1<-aggregate(Mg ~ Month , Nuts_For_SSL1 , mean )
Mg2<-aggregate(Mg~Month, Nuts_For_SSL2, mean)
Mg3<-aggregate(Mg~Month, Nuts_For_SSL3, mean)
Avg_Mg_L1<-ggplot()+geom_line(Mg1, mapping= aes(x=Month, y=Mg, color="Layer 1"))+
  geom_line(Mg2, mapping = aes(x=Month, y=Mg, color="Layer 2"))+
  geom_line(Mg3, mapping = aes(x=Month, y=Mg, color="Layer 3"))+
  geom_line(LNSMagnesium_L1, mapping=aes(x=Month, y=Mg, group="L1" ))+
  geom_line(data=LNSMagnesium_L1[!is.na(LNSMagnesium_L1$Mg),], aes(x=Month, y=Mg, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Mg (umol/L)")+
  geom_ribbon(data=LNSMagnesium_L1, aes(x= Month, ymin=pmax(Mg-sd.Mg, 0), ymax=Mg+sd.Mg, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_Mg_L1.pdf", height=5, width=15)
plot(Avg_Mg_L1)
dev.off()

Mg4<-aggregate(Mg~Month, Nuts_For_SSL4, mean)
Mg5<-aggregate(Mg~Month, Nuts_For_SSL5, mean)
Mg6<-aggregate(Mg~Month, Nuts_For_SSL6, mean)
Mg7<-aggregate(Mg~Month, Nuts_For_SSL7, mean)
Mg8<-aggregate(Mg~Month, Nuts_For_SSL8, mean)
Avg_Mg_L2<-ggplot()+geom_line(Mg4, mapping= aes(x=Month, y=Mg, color="Layer 4"))+
  geom_line(Mg5, mapping = aes(x=Month, y=Mg, color="Layer 5"))+
  geom_line(Mg6, mapping = aes(x=Month, y=Mg, color="Layer 6"))+
  geom_line(Mg7, mapping = aes(x=Month, y=Mg, color="Layer 7"))+
  geom_line(Mg8, mapping = aes(x=Month, y=Mg, color="Layer 8"))+
  geom_line(LNSMagnesium_L2, mapping=aes(x=Month, y=Mg, group="L2" ))+
  geom_line(data=LNSMagnesium_L2[!is.na(LNSMagnesium_L2$Mg),], aes(x=Month, y=Mg, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Mg (umol/L)")+
  geom_ribbon(data=LNSMagnesium_L2, aes(x= Month, ymin=pmax(Mg-sd.Mg, 0), ymax=Mg+sd.Mg, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_Mg_L2.pdf", height=5, width=15)
plot(Avg_Mg_L2)
dev.off()

LNSSodium_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Na, sd.Na) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSSodium_L1$Na<-LNSSodium_L1$Na*(1000/22.989769)
LNSSodium_L1$sd.Na<-LNSSodium_L1$sd.Na*(1000/22.989769)
LNSSodium_L1$Month<-LNSSodium_L1$Date

LNSSodium_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Na, sd.Na) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSSodium_L2$Na<-LNSSodium_L2$Na*(1000/22.989769)
LNSSodium_L2$sd.Na<-LNSSodium_L2$sd.Na*(1000/22.989769)
LNSSodium_L2$Month<-LNSSodium_L2$Date

Na1<-aggregate(Na ~ Month , Nuts_For_SSL1 , mean )
Na2<-aggregate(Na~Month, Nuts_For_SSL2, mean)
Na3<-aggregate(Na~Month, Nuts_For_SSL3, mean)
Avg_Na_L1<-ggplot()+geom_line(Na1, mapping= aes(x=Month, y=Na, color="Layer 1"))+
  geom_line(Na2, mapping = aes(x=Month, y=Na, color="Layer 2"))+
  geom_line(Na3, mapping = aes(x=Month, y=Na, color="Layer 3"))+
  geom_line(LNSSodium_L1, mapping=aes(x=Month, y=Na, group="L1" ))+
  geom_line(data=LNSSodium_L1[!is.na(LNSSodium_L1$Na),], aes(x=Month, y=Na, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Na (umol/L)")+
  geom_ribbon(data=LNSSodium_L1, aes(x= Month, ymin=pmax(Na-sd.Na, 0), ymax=Na+sd.Na, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_Na_L1.pdf", height=5, width=15)
plot(Avg_Na_L1)
dev.off()

Na4<-aggregate(Na~Month, Nuts_For_SSL4, mean)
Na5<-aggregate(Na~Month, Nuts_For_SSL5, mean)
Na6<-aggregate(Na~Month, Nuts_For_SSL6, mean)
Na7<-aggregate(Na~Month, Nuts_For_SSL7, mean)
Na8<-aggregate(Na~Month, Nuts_For_SSL8, mean)
Avg_Na_L2<-ggplot()+geom_line(Na4, mapping= aes(x=Month, y=Na, color="Layer 4"))+
  geom_line(Na5, mapping = aes(x=Month, y=Na, color="Layer 5"))+
  geom_line(Na6, mapping = aes(x=Month, y=Na, color="Layer 6"))+
  geom_line(Na7, mapping = aes(x=Month, y=Na, color="Layer 7"))+
  geom_line(Na8, mapping = aes(x=Month, y=Na, color="Layer 8"))+
  geom_line(LNSSodium_L2, mapping=aes(x=Month, y=Na, group="L2" ))+
  geom_line(data=LNSSodium_L2[!is.na(LNSSodium_L2$Na),], aes(x=Month, y=Na, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Na (umol/L)")+
  geom_ribbon(data=LNSSodium_L2, aes(x= Month, ymin=pmax(Na-sd.Na, 0), ymax=Na+sd.Na, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_Na_L2.pdf", height=5, width=15)
plot(Avg_Na_L2)
dev.off()

LNSChloride_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Cl, sd.Cl) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSChloride_L1$Cl<-LNSChloride_L1$Cl*(1000/35.453)
LNSChloride_L1$sd.Cl<-LNSChloride_L1$sd.Cl*(1000/35.453)
LNSChloride_L1$Month<-LNSChloride_L1$Date

LNSChloride_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Cl, sd.Cl) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSChloride_L2$Cl<-LNSChloride_L2$Cl*(1000/35.453)
LNSChloride_L2$sd.Cl<-LNSChloride_L2$sd.Cl*(1000/35.453)
LNSChloride_L2$Month<-LNSChloride_L2$Date

Cl1<-aggregate(Cl ~ Month , Nuts_For_SSL1 , mean )
Cl2<-aggregate(Cl~Month, Nuts_For_SSL2, mean)
Cl3<-aggregate(Cl~Month, Nuts_For_SSL3, mean)
Avg_Cl_L1<-ggplot()+geom_line(Cl1, mapping= aes(x=Month, y=Cl, color="Layer 1"))+
  geom_line(Cl2, mapping = aes(x=Month, y=Cl, color="Layer 2"))+
  geom_line(Cl3, mapping = aes(x=Month, y=Cl, color="Layer 3"))+
  geom_line(LNSChloride_L1, mapping=aes(x=Month, y=Cl, group="L1" ))+
  geom_line(data=LNSChloride_L1[!is.na(LNSChloride_L1$Cl),], aes(x=Month, y=Cl, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Cl (umol/L)")+
  geom_ribbon(data=LNSChloride_L1, aes(x= Month, ymin=pmax(Cl-sd.Cl, 0), ymax=Cl+sd.Cl, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_Cl_L1.pdf", height=5, width=15)
plot(Avg_Cl_L1)
dev.off()

Cl4<-aggregate(Cl~Month, Nuts_For_SSL4, mean)
Cl5<-aggregate(Cl~Month, Nuts_For_SSL5, mean)
Cl6<-aggregate(Cl~Month, Nuts_For_SSL6, mean)
Cl7<-aggregate(Cl~Month, Nuts_For_SSL7, mean)
Cl8<-aggregate(Cl~Month, Nuts_For_SSL8, mean)
Avg_Cl_L2<-ggplot()+geom_line(Cl4, mapping= aes(x=Month, y=Cl, color="Layer 4"))+
  geom_line(Cl5, mapping = aes(x=Month, y=Cl, color="Layer 5"))+
  geom_line(Cl6, mapping = aes(x=Month, y=Cl, color="Layer 6"))+
  geom_line(Cl7, mapping = aes(x=Month, y=Cl, color="Layer 7"))+
  geom_line(Cl8, mapping = aes(x=Month, y=Cl, color="Layer 8"))+
  geom_line(LNSChloride_L2, mapping=aes(x=Month, y=Cl, group="L2" ))+
  geom_line(data=LNSChloride_L2[!is.na(LNSChloride_L2$Cl),], aes(x=Month, y=Cl, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Cl (umol/L)")+
  geom_ribbon(data=LNSChloride_L2, aes(x= Month, ymin=pmax(Cl-sd.Cl, 0), ymax=Cl+sd.Cl, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_Cl_L2.pdf", height=5, width=15)
plot(Avg_Cl_L2)
dev.off()

LNSPotassium_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, K, sd.K) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSPotassium_L1$K<-LNSPotassium_L1$K*(1000/39.0983)
LNSPotassium_L1$sd.K<-LNSPotassium_L1$sd.K*(1000/39.0983)
LNSPotassium_L1$Month<-LNSPotassium_L1$Date

LNSPotassium_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, K, sd.K) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSPotassium_L2$K<-LNSPotassium_L2$K*(1000/39.0983)
LNSPotassium_L2$sd.K<-LNSPotassium_L2$sd.K*(1000/39.0983)
LNSPotassium_L2$Month<-LNSPotassium_L2$Date

K1<-aggregate(K ~ Month , Nuts_For_SSL1 , mean )
K2<-aggregate(K~Month, Nuts_For_SSL2, mean)
K3<-aggregate(K~Month, Nuts_For_SSL3, mean)
Avg_K_L1<-ggplot()+geom_line(K1, mapping= aes(x=Month, y=K, color="Layer 1"))+
  geom_line(K2, mapping = aes(x=Month, y=K, color="Layer 2"))+
  geom_line(K3, mapping = aes(x=Month, y=K, color="Layer 3"))+
  geom_line(LNSPotassium_L1, mapping=aes(x=Month, y=K, group="L1" ))+
  geom_line(data=LNSPotassium_L1[!is.na(LNSPotassium_L1$K),], aes(x=Month, y=K, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="K (umol/L)")+
  geom_ribbon(data=LNSPotassium_L1, aes(x= Month, ymin=pmax(K-sd.K, 0), ymax=K+sd.K, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_K_L1.pdf", height=5, width=15)
plot(Avg_K_L1)
dev.off()

K4<-aggregate(K~Month, Nuts_For_SSL4, mean)
K5<-aggregate(K~Month, Nuts_For_SSL5, mean)
K6<-aggregate(K~Month, Nuts_For_SSL6, mean)
K7<-aggregate(K~Month, Nuts_For_SSL7, mean)
K8<-aggregate(K~Month, Nuts_For_SSL8, mean)
Avg_K_L2<-ggplot()+geom_line(K4, mapping= aes(x=Month, y=K, color="Layer 4"))+
  geom_line(K5, mapping = aes(x=Month, y=K, color="Layer 5"))+
  geom_line(K6, mapping = aes(x=Month, y=K, color="Layer 6"))+
  geom_line(K7, mapping = aes(x=Month, y=K, color="Layer 7"))+
  geom_line(K8, mapping = aes(x=Month, y=K, color="Layer 8"))+
  geom_line(LNSPotassium_L2, mapping=aes(x=Month, y=K, group="L2" ))+
  geom_line(data=LNSPotassium_L2[!is.na(LNSPotassium_L2$K),], aes(x=Month, y=K, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="K (umol/L)")+
  geom_ribbon(data=LNSPotassium_L2, aes(x= Month, ymin=pmax(K-sd.K, 0), ymax=K+sd.K, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_K_L2.pdf", height=5, width=15)
plot(Avg_K_L2)
dev.off()

LNSNitrate_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, NO3, sd.NO3) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSNitrate_L1$NO3<-LNSNitrate_L1$NO3*(62.005/14.007/62.005)
LNSNitrate_L1$sd.NO3<-LNSNitrate_L1$sd.NO3*(62.005/14.007/62.005)
LNSNitrate_L1$Month<-LNSNitrate_L1$Date

LNSNitrate_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, NO3, sd.NO3) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSNitrate_L2$NO3<-LNSNitrate_L2$NO3*(62.005/14.007/62.005)
LNSNitrate_L2$sd.NO3<-LNSNitrate_L2$sd.NO3*(62.005/14.007/62.005)
LNSNitrate_L2$Month<-LNSNitrate_L2$Date

NO31<-aggregate(NO3 ~ Month , Nuts_For_SSL1 , mean )
NO32<-aggregate(NO3~Month, Nuts_For_SSL2, mean)
NO33<-aggregate(NO3~Month, Nuts_For_SSL3, mean)
Avg_NO3_L1<-ggplot()+geom_line(NO31, mapping= aes(x=Month, y=NO3, color="Layer 1"))+
  geom_line(NO32, mapping = aes(x=Month, y=NO3, color="Layer 2"))+
  geom_line(NO33, mapping = aes(x=Month, y=NO3, color="Layer 3"))+
  geom_line(LNSNitrate_L1, mapping=aes(x=Month, y=NO3, group="L1" ))+
  geom_line(data=LNSNitrate_L1[!is.na(LNSNitrate_L1$NO3),], aes(x=Month, y=NO3, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="NO3 (umol/L)")

pdf("Avg_NO3_L1.pdf", height=5, width=15)
plot(Avg_NO3_L1)
dev.off()

NO34<-aggregate(NO3~Month, Nuts_For_SSL4, mean)
NO35<-aggregate(NO3~Month, Nuts_For_SSL5, mean)
NO36<-aggregate(NO3~Month, Nuts_For_SSL6, mean)
NO37<-aggregate(NO3~Month, Nuts_For_SSL7, mean)
NO38<-aggregate(NO3~Month, Nuts_For_SSL8, mean)
Avg_NO3_L2<-ggplot()+geom_line(NO34, mapping= aes(x=Month, y=NO3, color="Layer 4"))+
  geom_line(NO35, mapping = aes(x=Month, y=NO3, color="Layer 5"))+
  geom_line(NO36, mapping = aes(x=Month, y=NO3, color="Layer 6"))+
  geom_line(NO37, mapping = aes(x=Month, y=NO3, color="Layer 7"))+
  geom_line(NO38, mapping = aes(x=Month, y=NO3, color="Layer 8"))+
  geom_line(LNSNitrate_L2, mapping=aes(x=Month, y=NO3, group="L2" ))+
  geom_line(data=LNSNitrate_L2[!is.na(LNSNitrate_L2$NO3),], aes(x=Month, y=NO3, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="NO3 (umol/L)")
pdf("Avg_NO3_L2.pdf", height=5, width=15)
plot(Avg_NO3_L2)
dev.off()

LNSAmmonium_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, NH4, sd.NH4, DON, sd.DON) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSAmmonium_L1$NH4<-LNSAmmonium_L1$NH4*(18.039/14.007/18.039)
LNSAmmonium_L1$sd.NH4<-LNSAmmonium_L1$sd.NH4*(18.039/14.007/18.039)
LNSAmmonium_L1$Month<-LNSAmmonium_L1$Date
LNSAmmonium_L1$TOTN<-LNSAmmonium_L1$DON+LNSAmmonium_L1$NH4

LNSAmmonium_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, NH4, sd.NH4, DON, sd.DON) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSAmmonium_L2$NH4<-LNSAmmonium_L2$NH4*(18.039/14.007/18.039)
LNSAmmonium_L2$sd.NH4<-LNSAmmonium_L2$sd.NH4*(18.039/14.007/18.039)
LNSAmmonium_L2$Month<-LNSAmmonium_L2$Date
LNSAmmonium_L2$TOTN<-LNSAmmonium_L2$DON+LNSAmmonium_L2$NH4

NH41<-aggregate(NH4 ~ Month , Nuts_For_SSL1 , mean )
NH42<-aggregate(NH4~Month, Nuts_For_SSL2, mean)
NH43<-aggregate(NH4~Month, Nuts_For_SSL3, mean)
Avg_NH4_L1<-ggplot()+geom_line(NH41, mapping= aes(x=Month, y=NH4, color="Layer 1"))+
  geom_line(NH42, mapping = aes(x=Month, y=NH4, color="Layer 2"))+
  geom_line(NH43, mapping = aes(x=Month, y=NH4, color="Layer 3"))+
  geom_line(LNSAmmonium_L1, mapping=aes(x=Month, y=TOTN, group="L1" ))+
  geom_line(data=LNSAmmonium_L1[!is.na(LNSAmmonium_L1$TOTN),], aes(x=Month, y=TOTN, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="NH4 (umol/L) & DON (umol-N/L)")

pdf("Avg_NH4_L1.pdf", height=5, width=15)
plot(Avg_NH4_L1)
dev.off()

NH44<-aggregate(NH4~Month, Nuts_For_SSL4, mean)
NH45<-aggregate(NH4~Month, Nuts_For_SSL5, mean)
NH46<-aggregate(NH4~Month, Nuts_For_SSL6, mean)
NH47<-aggregate(NH4~Month, Nuts_For_SSL7, mean)
NH48<-aggregate(NH4~Month, Nuts_For_SSL8, mean)
Avg_NH4_L2<-ggplot()+geom_line(NH44, mapping= aes(x=Month, y=NH4, color="Layer 4"))+
  geom_line(NH45, mapping = aes(x=Month, y=NH4, color="Layer 5"))+
  geom_line(NH46, mapping = aes(x=Month, y=NH4, color="Layer 6"))+
  geom_line(NH47, mapping = aes(x=Month, y=NH4, color="Layer 7"))+
  geom_line(NH48, mapping = aes(x=Month, y=NH4, color="Layer 8"))+
  geom_line(LNSAmmonium_L2, mapping=aes(x=Month, y=TOTN, group="L2" ))+
  geom_line(data=LNSAmmonium_L2[!is.na(LNSAmmonium_L2$TOTN),], aes(x=Month, y=TOTN, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="NH4 (umol/L) & DON (umol-N/L)")+
  pdf("Avg_NH4_L2.pdf", height=5, width=15)
plot(Avg_NH4_L2)
dev.off()

LNSAluminum_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Al, sd.Al) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSAluminum_L1$Al<-LNSAluminum_L1$Al*(1/26.982)
LNSAluminum_L1$sd.Al<-LNSAluminum_L1$sd.Al*(1/26.982)
LNSAluminum_L1$Month<-LNSAluminum_L1$Date

LNSAluminum_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Al, sd.Al) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSAluminum_L2$Al<-LNSAluminum_L2$Al*(1/26.982)
LNSAluminum_L2$sd.Al<-LNSAluminum_L2$sd.Al*(1/26.982)
LNSAluminum_L2$Month<-LNSAluminum_L2$Date

Al1<-aggregate(Al ~ Month , Nuts_For_SSL1 , mean )
Al2<-aggregate(Al~Month, Nuts_For_SSL2, mean)
Al3<-aggregate(Al~Month, Nuts_For_SSL3, mean)
Avg_Al_L1<-ggplot()+geom_line(Al1, mapping= aes(x=Month, y=Al, color="Layer 1"))+
  geom_line(Al2, mapping = aes(x=Month, y=Al, color="Layer 2"))+
  geom_line(Al3, mapping = aes(x=Month, y=Al, color="Layer 3"))+
  geom_line(LNSAluminum_L1, mapping=aes(x=Month, y=Al, group="L1" ))+
  geom_line(data=LNSAluminum_L1[!is.na(LNSAluminum_L1$Al),], aes(x=Month, y=Al, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Al (umol/L)")+
  geom_ribbon(data=LNSAluminum_L1, aes(x= Month, ymin=pmax(Al-sd.Al, 0), ymax=Al+sd.Al, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_Al_L1.pdf", height=5, width=15)
plot(Avg_Al_L1)
dev.off()

Al4<-aggregate(Al~Month, Nuts_For_SSL4, mean)
Al5<-aggregate(Al~Month, Nuts_For_SSL5, mean)
Al6<-aggregate(Al~Month, Nuts_For_SSL6, mean)
Al7<-aggregate(Al~Month, Nuts_For_SSL7, mean)
Al8<-aggregate(Al~Month, Nuts_For_SSL8, mean)
Avg_Al_L2<-ggplot()+geom_line(Al4, mapping= aes(x=Month, y=Al, color="Layer 4"))+
  geom_line(Al5, mapping = aes(x=Month, y=Al, color="Layer 5"))+
  geom_line(Al6, mapping = aes(x=Month, y=Al, color="Layer 6"))+
  geom_line(Al7, mapping = aes(x=Month, y=Al, color="Layer 7"))+
  geom_line(Al8, mapping = aes(x=Month, y=Al, color="Layer 8"))+
  geom_line(LNSAluminum_L2, mapping=aes(x=Month, y=Al, group="L2" ))+
  geom_line(data=LNSAluminum_L2[!is.na(LNSAluminum_L2$Al),], aes(x=Month, y=Al, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Al (umol/L)")+
  geom_ribbon(data=LNSAluminum_L2, aes(x= Month, ymin=pmax(Al-sd.Al, 0), ymax=Al+sd.Al, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_Al_L2.pdf", height=5, width=15)
plot(Avg_Al_L2)
dev.off()

LNSDOC_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, DOC, sd.DOC) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSDOC_L1$DOC<-LNSDOC_L1$DOC*(1000/12)
LNSDOC_L1$sd.DOC<-LNSDOC_L1$sd.DOC*(1000/12)
LNSDOC_L1$Month<-LNSDOC_L1$Date

LNSDOC_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, DOC, sd.DOC) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSDOC_L2$DOC<-LNSDOC_L2$DOC*(1000/12)
LNSDOC_L2$sd.DOC<-LNSDOC_L2$sd.DOC*(1000/12)
LNSDOC_L2$Month<-LNSDOC_L2$Date

DOC..mg.L.1<-aggregate(DOC~ Month , Nuts_For_SSL1 , mean )
DOC..mg.L.2<-aggregate(DOC~Month, Nuts_For_SSL2, mean)
DOC..mg.L.3<-aggregate(DOC~Month, Nuts_For_SSL3, mean)
Avg_DOC..mg.L._L1<-ggplot()+geom_line(DOC..mg.L.1, mapping= aes(x=Month, y=DOC, color="Layer 1"))+
  geom_line(DOC..mg.L.2, mapping = aes(x=Month, y=DOC, color="Layer 2"))+
  geom_line(DOC..mg.L.3, mapping = aes(x=Month, y=DOC, color="Layer 3"))+
  geom_line(LNSDOC_L1, mapping=aes(x=Month, y=DOC, group="L1" ))+
  geom_line(data=LNSDOC_L1[!is.na(LNSDOC_L1$DOC),], aes(x=Month, y=DOC, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="DOC (umol/L)")+
  geom_ribbon(data=LNSDOC_L1, aes(x= Month, ymin=pmax(DOC-sd.DOC, 0), ymax=DOC+sd.DOC, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_DOC..mg.L._L1.pdf", height=5, width=15)
plot(Avg_DOC..mg.L._L1)
dev.off()

DOC..mg.L.4<-aggregate(DOC~Month, Nuts_For_SSL4, mean)
DOC..mg.L.5<-aggregate(DOC~Month, Nuts_For_SSL5, mean)
DOC..mg.L.6<-aggregate(DOC~Month, Nuts_For_SSL6, mean)
DOC..mg.L.7<-aggregate(DOC~Month, Nuts_For_SSL7, mean)
DOC..mg.L.8<-aggregate(DOC~Month, Nuts_For_SSL8, mean)
Avg_DOC..mg.L._L2<-ggplot()+geom_line(DOC..mg.L.4, mapping= aes(x=Month, y=DOC, color="Layer 4"))+
  geom_line(DOC..mg.L.5, mapping = aes(x=Month, y=DOC, color="Layer 5"))+
  geom_line(DOC..mg.L.6, mapping = aes(x=Month, y=DOC, color="Layer 6"))+
  geom_line(DOC..mg.L.7, mapping = aes(x=Month, y=DOC, color="Layer 7"))+
  geom_line(DOC..mg.L.8, mapping = aes(x=Month, y=DOC, color="Layer 8"))+
  geom_line(LNSDOC_L2, mapping=aes(x=Month, y=DOC, group="L2" ))+
  geom_line(data=LNSDOC_L2[!is.na(LNSDOC_L2$DOC),], aes(x=Month, y=DOC, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y=" DOC (umol C /L)")+
  geom_ribbon(data=LNSDOC_L2, aes(x= Month, ymin=pmax(DOC-sd.DOC, 0), ymax=DOC+sd.DOC, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_DOC..mg.L._L2.pdf", height=5, width=15)
plot(Avg_DOC..mg.L._L2)
dev.off()

LNSSilica_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Si, sd.Si) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSSilica_L1$Si<-LNSSilica_L1$Si*(1000/28.086)
LNSSilica_L1$sd.Si<-LNSSilica_L1$sd.Si*(1000/28.086)
LNSSilica_L1$Month<-LNSSilica_L1$Date

LNSSilica_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, Si, sd.Si) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSSilica_L2$Si<-LNSSilica_L2$Si*(1000/28.086)
LNSSilica_L2$sd.Si<-LNSSilica_L2$sd.Si*(1000/28.086)
LNSSilica_L2$Month<-LNSSilica_L2$Date

Si1<-aggregate(Si~ Month , Nuts_For_SSL1 , mean )
Si2<-aggregate(Si~Month, Nuts_For_SSL2, mean)
Si3<-aggregate(Si~Month, Nuts_For_SSL3, mean)
Avg_Si_L1<-ggplot()+geom_line(Si1, mapping= aes(x=Month, y=Si, color="Layer 1"))+
  geom_line(Si2, mapping = aes(x=Month, y=Si, color="Layer 2"))+
  geom_line(Si3, mapping = aes(x=Month, y=Si, color="Layer 3"))+
  geom_line(LNSSilica_L1, mapping=aes(x=Month, y=Si, group="L1" ))+
  geom_line(data=LNSSilica_L1[!is.na(LNSSilica_L1$Si),], aes(x=Month, y=Si, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Si (umol/L)")+
  geom_ribbon(data=LNSSilica_L1, aes(x= Month, ymin=pmax(Si-sd.Si, 0), ymax=Si+sd.Si, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_Si_L1.pdf", height=5, width=15)
plot(Avg_Si_L1)
dev.off()

Si4<-aggregate(Si~Month, Nuts_For_SSL4, mean)
Si5<-aggregate(Si~Month, Nuts_For_SSL5, mean)
Si6<-aggregate(Si~Month, Nuts_For_SSL6, mean)
Si7<-aggregate(Si~Month, Nuts_For_SSL7, mean)
Si8<-aggregate(Si~Month, Nuts_For_SSL8, mean)
Avg_Si_L2<-ggplot()+geom_line(Si4, mapping= aes(x=Month, y=Si, color="Layer 4"))+
  geom_line(Si5, mapping = aes(x=Month, y=Si, color="Layer 5"))+
  geom_line(Si6, mapping = aes(x=Month, y=Si, color="Layer 6"))+
  geom_line(Si7, mapping = aes(x=Month, y=Si, color="Layer 7"))+
  geom_line(Si8, mapping = aes(x=Month, y=Si, color="Layer 8"))+
  geom_line(LNSSilica_L2, mapping=aes(x=Month, y=Si, group="L2" ))+
  geom_line(data=LNSSilica_L2[!is.na(LNSSilica_L2$Si),], aes(x=Month, y=Si, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="Si (umol/L)")+
  geom_ribbon(data=LNSSilica_L2, aes(x= Month, ymin=pmax(Si-sd.Si, 0), ymax=Si+sd.Si, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_Si_L2.pdf", height=5, width=15)
plot(Avg_Si_L2)
dev.off()

LNSSulfate_L1<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, SO4, sd.SO4) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L1")
LNSSulfate_L1$SO4<-LNSSulfate_L1$SO4*(1000/32.065)
LNSSulfate_L1$sd.SO4<-LNSSulfate_L1$sd.SO4*(1000/32.065)
LNSSulfate_L1$Month<-LNSSulfate_L1$Date

LNSSulfate_L2<-Lys_Df %>% 
  select(SoilN, Layer, Bedrock, Date, SO4, sd.SO4) %>%  
  filter(Bedrock=="Sed", SoilN=="Low", Layer=="L2")
LNSSulfate_L2$SO4<-LNSSulfate_L2$SO4*(1000/32.065)
LNSSulfate_L2$sd.SO4<-LNSSulfate_L2$sd.SO4*(1000/32.065)
LNSSulfate_L2$Month<-LNSSulfate_L2$Date

SO41<-aggregate(SO4 ~ Month , Nuts_For_SSL1 , mean )
SO42<-aggregate(SO4~Month, Nuts_For_SSL2, mean)
SO43<-aggregate(SO4~Month, Nuts_For_SSL3, mean)
Avg_SO4_L1<-ggplot()+geom_line(SO41, mapping= aes(x=Month, y=SO4, color="Layer 1"))+
  geom_line(SO42, mapping = aes(x=Month, y=SO4, color="Layer 2"))+
  geom_line(SO43, mapping = aes(x=Month, y=SO4, color="Layer 3"))+
  geom_line(LNSSulfate_L1, mapping=aes(x=Month, y=SO4, group="L1" ))+
  geom_line(data=LNSSulfate_L1[!is.na(LNSSulfate_L1$SO4),], aes(x=Month, y=SO4, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="SO4 (umol/L)")+
  geom_ribbon(data=LNSSulfate_L1, aes(x= Month, ymin=pmax(SO4-sd.SO4, 0), ymax=SO4+sd.SO4, group=1),linetype=0,
              alpha=0.2)

pdf("Avg_SO4_L1.pdf", height=5, width=15)
plot(Avg_SO4_L1)
dev.off()

SO44<-aggregate(SO4~Month, Nuts_For_SSL4, mean)
SO45<-aggregate(SO4~Month, Nuts_For_SSL5, mean)
SO46<-aggregate(SO4~Month, Nuts_For_SSL6, mean)
SO47<-aggregate(SO4~Month, Nuts_For_SSL7, mean)
SO48<-aggregate(SO4~Month, Nuts_For_SSL8, mean)
Avg_SO4_L2<-ggplot()+geom_line(SO44, mapping= aes(x=Month, y=SO4, color="Layer 4"))+
  geom_line(SO45, mapping = aes(x=Month, y=SO4, color="Layer 5"))+
  geom_line(SO46, mapping = aes(x=Month, y=SO4, color="Layer 6"))+
  geom_line(SO47, mapping = aes(x=Month, y=SO4, color="Layer 7"))+
  geom_line(SO48, mapping = aes(x=Month, y=SO4, color="Layer 8"))+
  geom_line(LNSSulfate_L2, mapping=aes(x=Month, y=SO4, group="L2" ))+
  geom_line(data=LNSSulfate_L2[!is.na(LNSSulfate_L2$SO4),], aes(x=Month, y=SO4, group="NA"), linetype="dashed")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  labs(y="SO4 (umol/L)")+
  geom_ribbon(data=LNSSulfate_L2, aes(x= Month, ymin=pmax(SO4-sd.SO4, 0), ymax=SO4+sd.SO4, group=1),linetype=0,
              alpha=0.2)
pdf("Avg_SO4_L2.pdf", height=5, width=15)
plot(Avg_SO4_L2)
dev.off()

library(magrittr)
library(multipanelfigure)

Al_pH_1<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_2<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_3<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_4<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_5<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_6<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_7<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")
Al_pH_8<- multi_panel_figure(columns = 1, rows = 2, panel_label_type = "none")

Al_pH1<-Al_pH_1 %<>%
  fill_panel(SSL1Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL1pH.G, column = 1, row = 2)
jpeg("Al_pH1.jpeg", height=500, width=1000)
plot(Al_pH1)
dev.off()

Al_pH2<-Al_pH_2 %<>%
  fill_panel(SSL2Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL2pH.G, column = 1, row = 2)
pdf("Al_pH2.pdf", height=10, width=15)
plot(Al_pH2)
dev.off()

Al_pH3<-Al_pH_3 %<>%
  fill_panel(SSL3Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL3pH.G, column = 1, row = 2)
pdf("Al_pH3.pdf", height=10, width=15)
plot(Al_pH3)
dev.off()

Al_pH4<-Al_pH_4 %<>%
  fill_panel(SSL4Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL4pH.G, column = 1, row = 2)
pdf("Al_pH4.pdf", height=10, width=15)
plot(Al_pH4)
dev.off()

Al_pH5<-Al_pH_5 %<>%
  fill_panel(SSL5Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL5pH.G, column = 1, row = 2)
pdf("Al_pH5.pdf", height=10, width=15)
plot(Al_pH5)
dev.off()

Al_pH6<-Al_pH_6 %<>%
  fill_panel(SSL6Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL6pH.G, column = 1, row = 2)
pdf("Al_pH6.pdf", height=10, width=15)
plot(Al_pH6)
dev.off()

Al_pH7<-Al_pH_7 %<>%
  fill_panel(SSL7Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL7pH.G, column = 1, row = 2)
pdf("Al_pH7.pdf", height=10, width=15)
plot(Al_pH7)
dev.off()

Al_pH8<-Al_pH_8 %<>%
  fill_panel(SSL8Al.G, column = 1, row = 1) %<>%
  fill_panel(SSL8pH.G, column = 1, row = 2)
pdf("Al_pH8.pdf", height=10, width=15)
plot(Al_pH8)
dev.off()


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

