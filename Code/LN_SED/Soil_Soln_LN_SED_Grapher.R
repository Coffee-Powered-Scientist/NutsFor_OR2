rm(list = ls())
library(ggplot2)
library(scales)
library(multipanelfigure)



setwd("~/Project_Master/Test_Rep/Output_LN_SED/Soil_Solution")

Soil_Solution_All<-read.csv2("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Soil_Solution_All$group_id<-as.character(Soil_Solution_All$group_id)
Soil_Solution_All$Date<-as.Date(Soil_Solution_All$Date)

#Leaching Fluxes

All_Leaching_Flux<-ggplot(subset(Soil_Solution_All, group_id %in% c("1" , "2", "3", "4", "5", "6", "7", "8")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+facet_wrap(~group_id, ncol=2)+theme(panel.spacing.x = unit(4, "mm"))+
  scale_x_date(labels = date_format("%m-%Y"))+labs(y="Ca Leaching Flux Per Soil Layer (kg/ha/yr)")


#Litterfow


#Soil Solution

Ca_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Ca~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))

Ca_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Ca~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

Mg_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Mg~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))

Mg_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Mg~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


Na_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Na, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Na~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))

Na_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Na, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Na~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


K_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=K, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~K~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


K_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=K, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~K~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


NO3_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=NO3, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~NO3~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


NO3_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=NO3, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~NO3~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


NH4_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=NH4, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~NH4~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


NH4_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=NH4, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~NH4~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

SO4_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=SO4, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~SO4~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


SO4_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=SO4, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~SO4~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

Cl_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Cl, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Cl~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))

Cl_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Cl, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Cl~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

P_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=P, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~P~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


P_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=P, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~P~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

DOC_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=DOC, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~DOC~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


DOC_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=DOC, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~DOC~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


Si_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Si, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Si~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


Si_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Si, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Si~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


Al_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Al, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Al~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


Al_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Al, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Al~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


H_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=H, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~H~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


H_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=H, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~H~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

pH_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=pH, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~pH~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))

pH_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=pH, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~pH~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


R_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=R, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~R~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


R_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=R, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~R~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))

HR_L1<-ggplot(subset(Soil_Solution_All, group_id %in% c("10", "11", "12")), (aes(x=Date, y=HR, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~HR~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
  guides(color=guide_legend("Layers"))


HR_L2<-ggplot(subset(Soil_Solution_All, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=HR, group=group_id, color=group_id)))+
  geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~HR~(mu*mol/L)))+
  scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("purple", "orange", "brown", "magenta", "cyan3"))+
  guides(color=guide_legend("Layers"))


BC_L1<- multi_panel_figure(columns = 2, rows = 2, panel_label_type = "none")
BC_L1<-BC_L1 %<>%
  fill_panel(Ca_L1, column = 1, row = 1) %<>%
  fill_panel(Mg_L1, column = 1, row = 2)%<>%
  fill_panel(K_L1, column = 2, row = 1)%<>%
  fill_panel(Na_L1, column = 2, row = 2)
pdf("BC_L1.pdf", height=10, width=15)
plot(BC_L1)
dev.off()

BC_L2<- multi_panel_figure(columns = 2, rows = 2, panel_label_type = "none")
BC_L2<-BC_L2 %<>%
  fill_panel(Ca_L2, column = 1, row = 1) %<>%
  fill_panel(Mg_L2, column = 1, row = 2)%<>%
  fill_panel(K_L2, column = 2, row = 1)%<>%
  fill_panel(Na_L2, column = 2, row = 2)
pdf("BC_L2.pdf", height=10, width=15)
plot(BC_L2)
dev.off()

AA_L1<- multi_panel_figure(columns = 2, rows = 2, panel_label_type = "none")
AA_L1<-AA_L1 %<>%
  fill_panel(SO4_L1, column = 1, row = 1) %<>%
  fill_panel(Cl_L1, column = 1, row = 2)%<>%
  fill_panel(R_L1, column = 2, row = 1)%<>%
  fill_panel(NO3_L1, column = 2, row = 2)
pdf("AA_L1.pdf", height=10, width=15)
plot(AA_L1)
dev.off()

AA_L2<- multi_panel_figure(columns = 2, rows = 2, panel_label_type = "none")
AA_L2<-AA_L2 %<>%
  fill_panel(SO4_L2, column = 1, row = 1) %<>%
  fill_panel(Cl_L2, column = 1, row = 2)%<>%
  fill_panel(R_L2, column = 2, row = 1)%<>%
  fill_panel(NO3_L2, column = 2, row = 2)
pdf("AA_L2.pdf", height=10, width=15)
plot(AA_L2)
dev.off()

Al_pH_L1<-multi_panel_figure(columns = 2, rows = 1, panel_label_type = "none")
Al_pH_L1<-Al_pH_L1%<>%
  fill_panel(Al_L1, column = 1, row = 1) %<>%
  fill_panel(pH_L1, column = 2, row = 1)
pdf("Al_pH_L1.pdf", height=10, width=15)
plot(Al_pH_L1)
dev.off()

Al_pH_L2<-multi_panel_figure(columns = 2, rows = 1, panel_label_type = "none")
Al_pH_L2<-Al_pH_L2%<>%
  fill_panel(Al_L2, column = 1, row = 1) %<>%
  fill_panel(pH_L2, column = 2, row = 1)
pdf("Al_pH_L2.pdf", height=10, width=15)
plot(Al_pH_L2)
dev.off()

N_L1<-multi_panel_figure(columns = 2, rows = 1, panel_label_type = "none")
N_L1<-N_L1%<>%
  fill_panel(NO3_L1, column = 1, row = 1) %<>%
  fill_panel(NH4_L1, column = 2, row = 1)
pdf("N_L1.pdf", height=10, width=15)
plot(N_L1)
dev.off()

N_L2<-multi_panel_figure(columns = 2, rows = 1, panel_label_type = "none")
N_L2<-N_L2%<>%
  fill_panel(NO3_L2, column = 1, row = 1) %<>%
  fill_panel(NH4_L2, column = 2, row = 1)
pdf("N_L2.pdf", height=10, width=15)
plot(N_L2)
dev.off()


