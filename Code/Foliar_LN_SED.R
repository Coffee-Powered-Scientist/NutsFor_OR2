setwd("~/Project_Master/Test_Rep/Output_LN_SED/Foliar_Wood")
library(ggplot2)
library(dplyr)
Nuts_For_Tree<-read.csv("~/NutsForSEDLN/Output data/Biomass/Tree data.csv", sep=";", header=FALSE)
Nuts_For_Tree_Foliage<-Nuts_For_Tree[c(3:9)]
Nuts_For_Tree_Foliage<-Nuts_For_Tree_Foliage[-c(1:2),]
Nuts_For_Tree_Foliage$Date<-seq(as.Date("2002/1/1"), by = "month", length.out = 132)


Nuts_For_Tree_Foliage$Biomass<-Nuts_For_Tree_Foliage$V3
Nuts_For_Tree_Foliage$N<-Nuts_For_Tree_Foliage$V4
Nuts_For_Tree_Foliage$Ca<-Nuts_For_Tree_Foliage$V5
Nuts_For_Tree_Foliage$Mg<-Nuts_For_Tree_Foliage$V6
Nuts_For_Tree_Foliage$K<-Nuts_For_Tree_Foliage$V7
Nuts_For_Tree_Foliage$S<-Nuts_For_Tree_Foliage$V8
Nuts_For_Tree_Foliage$P<-Nuts_For_Tree_Foliage$V9

Foliar.Biomass<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= Biomass))+ylab("Foliar Dry Biomass: Unit Unknown")+
  geom_point()
pdf("Foliar.Biomass.pdf", height= 5, width=15)                 
plot(Foliar.Biomass)
dev.off()

Foliar.Ca<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= Ca))+ylab(" Ca umol/g")+
  geom_point()
pdf("Foliar.Ca.pdf", height= 5, width=15)                 
plot(Foliar.Ca)
dev.off()

Foliar.N<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= N))+ylab("N umol/g")+
  geom_point()
pdf("Foliar.N.pdf", height= 5, width=15)                 
plot(Foliar.N)
dev.off()

Foliar.Mg<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= Mg))+ylab("Mg umol/g")+
  geom_point()
pdf("Foliar.Mg.pdf", height= 5, width=15)                 
plot(Foliar.Mg)
dev.off()

Foliar.K<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= K))+ylab("K umol/g")+
  geom_point()
pdf("Foliar.K.pdf", height= 5, width=15)                 
plot(Foliar.K)
dev.off()

Foliar.S<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= S))+ylab(" S umol/g")+
  geom_point()
pdf("Foliar.S.pdf", height= 5, width=15)                 
plot(Foliar.S)
dev.off()

Foliar.P<-ggplot(Nuts_For_Tree_Foliage, aes(x=Date, y= P))+ylab("P umol/g")+
  geom_point()
pdf("Foliar.P.pdf", height= 5, width=15)                 
plot(Foliar.P)
dev.off()
