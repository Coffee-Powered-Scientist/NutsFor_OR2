rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output_LN_BAS/Weathering")

library(ggplot2)

Weathering_All<-read.csv2("~/Project_Master/Test_Rep/Output_LN_BAS/Edited Data/Weathering_All.csv", header=TRUE)

Weathering_All$Month<-as.Date(Weathering_All$Date)

Ca_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=Ca_L1, color="Layer 1"))+geom_line(aes(y=Ca_L2, color="Layer 2"))+
  geom_line(aes(y=Ca_L3, color="Layer 3"))+geom_line(aes(y=Ca_L4, color="Layer 4"))+geom_line(aes(y=Ca_L5, color="Layer 5"))+
  geom_line(aes(y=Ca_L6, color="Layer 6"))+geom_line(aes(y=Ca_L7, color="Layer 7"))+geom_line(aes(y=Ca_L8, color="Layer 8"))+ 
  geom_line(aes(y=Total_Ca, color="Total Weathering"))
labs(y="Ca Weathering (kg/ha/month)")
pdf("Ca_Weathering.pdf", height=5, width=10)
plot(Ca_Weathering)
dev.off()


Mg_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=Mg_L1, color="Layer 1"))+geom_line(aes(y=Mg_L2, color="Layer 2"))+
  geom_line(aes(y=Mg_L3, color="Layer 3"))+geom_line(aes(y=Mg_L4, color="Layer 4"))+geom_line(aes(y=Mg_L5, color="Layer 5"))+
  geom_line(aes(y=Mg_L6, color="Layer 6"))+geom_line(aes(y=Mg_L7, color="Layer 7"))+geom_line(aes(y=Mg_L8, color="Layer 8"))+ labs(y="Mg Weathering (kg/ha/month)")
pdf("Mg_Weathering.pdf", height=5, width=10)
plot(Mg_Weathering)
dev.off()


K_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=K_L1, color="Layer 1"))+geom_line(aes(y=K_L2, color="Layer 2"))+
  geom_line(aes(y=K_L3, color="Layer 3"))+geom_line(aes(y=K_L4, color="Layer 4"))+geom_line(aes(y=K_L5, color="Layer 5"))+
  geom_line(aes(y=K_L6, color="Layer 6"))+geom_line(aes(y=K_L7, color="Layer 7"))+geom_line(aes(y=K_L8, color="Layer 8"))+ labs(y="K Weathering (kg/ha/month)")
pdf("K_Weathering.pdf", height=5, width=10)
plot(K_Weathering)
dev.off()



Na_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=Na_L1, color="Layer 1"))+geom_line(aes(y=Na_L2, color="Layer 2"))+
  geom_line(aes(y=Na_L3, color="Layer 3"))+geom_line(aes(y=Na_L4, color="Layer 4"))+geom_line(aes(y=Na_L5, color="Layer 5"))+
  geom_line(aes(y=Na_L6, color="Layer 6"))+geom_line(aes(y=Na_L7, color="Layer 7"))+geom_line(aes(y=Na_L8, color="Layer 8"))+ labs(y="Na Weathering (kg/ha/month)")
pdf("Na_Weathering.pdf", height=5, width=10)
plot(Na_Weathering)
dev.off()


Al_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=Al_L1, color="Layer 1"))+geom_line(aes(y=Al_L2, color="Layer 2"))+
  geom_line(aes(y=Al_L3, color="Layer 3"))+geom_line(aes(y=Al_L4, color="Layer 4"))+geom_line(aes(y=Al_L5, color="Layer 5"))+
  geom_line(aes(y=Al_L6, color="Layer 6"))+geom_line(aes(y=Al_L7, color="Layer 7"))+geom_line(aes(y=Al_L8, color="Layer 8"))+ labs(y="Al Weathering (kg/ha/month)")
pdf("Al_Weathering.pdf", height=5, width=10)
plot(Al_Weathering)
dev.off()


Si_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=Si_L1, color="Layer 1"))+geom_line(aes(y=Si_L2, color="Layer 2"))+
  geom_line(aes(y=Si_L3, color="Layer 3"))+geom_line(aes(y=Si_L4, color="Layer 4"))+geom_line(aes(y=Si_L5, color="Layer 5"))+
  geom_line(aes(y=Si_L6, color="Layer 6"))+geom_line(aes(y=Si_L7, color="Layer 7"))+geom_line(aes(y=Si_L8, color="Layer 8"))+ labs(y="Si Weathering (kg/ha/month)")
pdf("Si_Weathering.pdf", height=5, width=10)
plot(Si_Weathering)
dev.off()


P_Weathering<-ggplot(Weathering_All, aes(x=Month))+geom_line(aes(y=P_L1, color="Layer 1"))+geom_line(aes(y=P_L2, color="Layer 2"))+
  geom_line(aes(y=P_L3, color="Layer 3"))+geom_line(aes(y=P_L4, color="Layer 4"))+geom_line(aes(y=P_L5, color="Layer 5"))+
  geom_line(aes(y=P_L6, color="Layer 6"))+geom_line(aes(y=P_L7, color="Layer 7"))+geom_line(aes(y=P_L8, color="Layer 8"))+ labs(y="P Weathering (kg/ha/month)")
pdf("P_Weathering.pdf", height=5, width=10)
plot(P_Weathering)
dev.off()