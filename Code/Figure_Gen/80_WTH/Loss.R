
rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)
library(ggpubr)
library(grid)
library(gridExtra)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_WTH")

# LN SED

Leaching_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_LNS<-Leaching_LNS %>% subset(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_LNS<-Tree_Nut_LNS %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_LNS$P_Brh<-as.numeric(Net_Removal_LNS$P_Brh)

Net_Removal_LNS<-Net_Removal_LNS %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/AEC_All.csv")

AEC_All_LNS<-AEC_All_LNS %>% subset(Date %in% c('2005-08-01', '2498-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_LNS$SO4_Net<-diff(AEC_All_LNS$SO4)

AEC_All_LNS$PO4_Net<-diff(AEC_All_LNS$PO4)


Ca_LNS<-ggplot()+geom_col(Leaching_LNS, mapping= aes(x="Leached", y=Ca, fill="Leached"))+
  geom_col(Net_Removal_LNS, mapping=aes(x="Harvested", y=Ca_F*.01+Ca_Bol*.97+Ca_Brh*.01+Ca_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(500, 2000, 3500))+
  coord_cartesian(ylim = c(0, 3500))

Mg_LNS<-ggplot()+geom_col(Leaching_LNS, mapping= aes(x="Leached", y=Mg, fill="Leached"))+
  geom_col(Net_Removal_LNS, mapping=aes(x="Harvested", y=Mg_F*.01+Mg_Bol*.97+Mg_Brh*.01+Mg_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Sedimentary")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1750 ,3000))+
  coord_cartesian(ylim = c(0, 3500))

K_LNS<-ggplot()+geom_col(Leaching_LNS, mapping= aes(x="Leached", y=K, fill="Leached"))+
  geom_col(Net_Removal_LNS, mapping=aes(x="Harvested", y=K_F*.01+K_Bol*.97+K_Brh*.01+K_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c("dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(300, 600, 900))+
  coord_cartesian(ylim = c(0, 900))

S_LNS<-ggplot()+geom_col(Leaching_LNS, mapping= aes(x="Leached", y=SO4, fill="Leached"))+
  geom_col(Net_Removal_LNS, mapping=aes(x="Harvested", y=S_F*.01+S_Bol*.97+S_Brh*.01+S_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_LNS, mapping=aes(x="Occluded", y=SO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(-1000,-500 ,500, 1000, 1500, 2000))+
  coord_cartesian(ylim = c(-1000, 2000))

P_LNS<-ggplot()+geom_col(Leaching_LNS, mapping= aes(x="Leached", y=P, fill="Leached"))+
  geom_col(Net_Removal_LNS, mapping=aes(x="Harvested", y=P_F*.01+P_Bol*.97+P_Brh*.01+P_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_LNS, mapping=aes(x="Occluded", y=PO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1000))+
  coord_cartesian(ylim = c(0, 1000))


N_LNS<-ggplot()+geom_col(Leaching_LNS, mapping= aes(x="Leached", y=NO3+NH4, fill="Leached"))+
  geom_col(Net_Removal_LNS, mapping=aes(x="Harvested", y=N_F*.01+N_Bol*.97+N_Brh*.01+N_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(1500, 4500, 6000))+
  coord_cartesian(ylim = c(0, 6500))
# HN SED



Leaching_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_HNS<-Leaching_HNS %>% subset(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_HNS<-Tree_Nut_HNS %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_HNS$P_Brh<-as.numeric(Net_Removal_HNS$P_Brh)

Net_Removal_HNS<-Net_Removal_HNS %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/AEC_All.csv")

AEC_All_HNS<-AEC_All_HNS %>% subset(Date %in% c('2005-08-01', '2498-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_HNS$SO4_Net<-diff(AEC_All_HNS$SO4)

AEC_All_HNS$PO4_Net<-diff(AEC_All_HNS$PO4)


Ca_HNS<-ggplot()+geom_col(Leaching_HNS, mapping= aes(x="Leached", y=Ca, fill="Leached"))+
  geom_col(Net_Removal_HNS, mapping=aes(x="Harvested", y=Ca_F*.01+Ca_Bol*.97+Ca_Brh*.01+Ca_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(500, 2000, 3500))+
  coord_cartesian(ylim = c(0, 3500))

Mg_HNS<-ggplot()+geom_col(Leaching_HNS, mapping= aes(x="Leached", y=Mg, fill="Leached"))+
  geom_col(Net_Removal_HNS, mapping=aes(x="Harvested", y=Mg_F*.01+Mg_Bol*.97+Mg_Brh*.01+Mg_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Sedimentary")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1750 ,3000))+
  coord_cartesian(ylim = c(0, 3500))



K_HNS<-ggplot()+geom_col(Leaching_HNS, mapping= aes(x="Leached", y=K, fill="Leached"))+
  geom_col(Net_Removal_HNS, mapping=aes(x="Harvested", y=K_F*.01+K_Bol*.97+K_Brh*.01+K_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c("dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(300, 600, 900))+
  coord_cartesian(ylim = c(0, 900))

S_HNS<-ggplot()+geom_col(Leaching_HNS, mapping= aes(x="Leached", y=SO4, fill="Leached"))+
  geom_col(Net_Removal_HNS, mapping=aes(x="Harvested", y=S_F*.01+S_Bol*.97+S_Brh*.01+S_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_HNS, mapping=aes(x="Occluded", y=SO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))

P_HNS<-ggplot()+geom_col(Leaching_HNS, mapping= aes(x="Leached", y=P, fill="Leached"))+
  geom_col(Net_Removal_HNS, mapping=aes(x="Harvested", y=P_F*.01+P_Bol*.97+P_Brh*.01+P_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_HNS, mapping=aes(x="Occluded", y=PO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y="P Removal (kg/ha)", title="High N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1000))+
  coord_cartesian(ylim = c(0, 1000))

N_HNS<-ggplot()+geom_col(Leaching_HNS, mapping= aes(x="Leached", y=NO3+NH4, fill="Leached"))+
  geom_col(Net_Removal_HNS, mapping=aes(x="Harvested", y=N_F*.01+N_Bol*.97+N_Brh*.01+N_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(1500, 4500, 6000))+
  coord_cartesian(ylim = c(0, 6500))



# LN Basalt



Leaching_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_LNB<-Leaching_LNB %>% subset(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_LNB<-Tree_Nut_LNB %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_LNB$P_Brh<-as.numeric(Net_Removal_LNB$P_Brh)

Net_Removal_LNB<-Net_Removal_LNB %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/AEC_All.csv")

AEC_All_LNB<-AEC_All_LNB %>% subset(Date %in% c('2005-08-01', '2498-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_LNB$SO4_Net<-diff(AEC_All_LNB$SO4)

AEC_All_LNB$PO4_Net<-diff(AEC_All_LNB$PO4)


Ca_LNB<-ggplot()+geom_col(Leaching_LNB, mapping= aes(x="Leached", y=Ca, fill="Leached"))+
  geom_col(Net_Removal_LNB, mapping=aes(x="Harvested", y=Ca_F*.01+Ca_Bol*.97+Ca_Brh*.01+Ca_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(500, 2000, 3500))+
  coord_cartesian(ylim = c(0, 3500))

Mg_LNB<-ggplot()+geom_col(Leaching_LNB, mapping= aes(x="Leached", y=Mg, fill="Leached"))+
  geom_col(Net_Removal_LNB, mapping=aes(x="Harvested", y=Mg_F*.01+Mg_Bol*.97+Mg_Brh*.01+Mg_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Basalt")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1750 ,3000))+
  coord_cartesian(ylim = c(0, 3500))



K_LNB<-ggplot()+geom_col(Leaching_LNB, mapping= aes(x="Leached", y=K, fill="Leached"))+
  geom_col(Net_Removal_LNB, mapping=aes(x="Harvested", y=K_F*.01+K_Bol*.97+K_Brh*.01+K_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c("dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(300, 600, 900))+
  coord_cartesian(ylim = c(0, 900))

S_LNB<-ggplot()+geom_col(Leaching_LNB, mapping= aes(x="Leached", y=SO4, fill="Leached"))+
  geom_col(Net_Removal_LNB, mapping=aes(x="Harvested", y=S_F*.01+S_Bol*.97+S_Brh*.01+S_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_LNB, mapping=aes(x="Occluded", y=SO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))

P_LNB<-ggplot()+geom_col(Leaching_LNB, mapping= aes(x="Leached", y=P, fill="Leached"))+
  geom_col(Net_Removal_LNB, mapping=aes(x="Harvested", y=P_F*.01+P_Bol*.97+P_Brh*.01+P_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_LNB, mapping=aes(x="Occluded", y=PO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1000))+
  coord_cartesian(ylim = c(0, 1000))

N_LNB<-ggplot()+geom_col(Leaching_LNB, mapping= aes(x="Leached", y=NO3+NH4, fill="Leached"))+
  geom_col(Net_Removal_LNB, mapping=aes(x="Harvested", y=N_F*.01+N_Bol*.97+N_Brh*.01+N_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(1500, 4500, 6000))+
  coord_cartesian(ylim = c(0, 6500))

# HN BAsalt




Leaching_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_HNB<-Leaching_HNB %>% subset(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_HNB<-Tree_Nut_HNB %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_HNB$P_Brh<-as.numeric(Net_Removal_HNB$P_Brh)

Net_Removal_HNB<-Net_Removal_HNB %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/AEC_All.csv")

AEC_All_HNB<-AEC_All_HNB %>% subset(Date %in% c('2005-08-01', '2498-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_HNB$SO4_Net<-diff(AEC_All_HNB$SO4)

AEC_All_HNB$PO4_Net<-diff(AEC_All_HNB$PO4)


Ca_HNB<-ggplot()+geom_col(Leaching_HNB, mapping= aes(x="Leached", y=Ca, fill="Leached"))+
  geom_col(Net_Removal_HNB, mapping=aes(x="Harvested", y=Ca_F*.01+Ca_Bol*.97+Ca_Brh*.01+Ca_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(500, 2000, 3500))+
  coord_cartesian(ylim = c(0, 3500))

Mg_HNB<-ggplot()+geom_col(Leaching_HNB, mapping= aes(x="Leached", y=Mg, fill="Leached"))+
  geom_col(Net_Removal_HNB, mapping=aes(x="Harvested", y=Mg_F*.01+Mg_Bol*.97+Mg_Brh*.01+Mg_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Basalt")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1750 ,3000))+
  coord_cartesian(ylim = c(0, 3500))


K_HNB<-ggplot()+geom_col(Leaching_HNB, mapping= aes(x="Leached", y=K, fill="Leached"))+
  geom_col(Net_Removal_HNB, mapping=aes(x="Harvested", y=K_F*.01+K_Bol*.97+K_Brh*.01+K_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c("dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(300, 600, 900))+
  coord_cartesian(ylim = c(0, 900))

S_HNB<-ggplot()+geom_col(Leaching_HNB, mapping= aes(x="Leached", y=SO4, fill="Leached"))+
  geom_col(Net_Removal_HNB, mapping=aes(x="Harvested", y=S_F*.01+S_Bol*.97+S_Brh*.01+S_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_HNB, mapping=aes(x="Occluded", y=SO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))

P_HNB<-ggplot()+geom_col(Leaching_HNB, mapping= aes(x="Leached", y=P, fill="Leached"))+
  geom_col(Net_Removal_HNB, mapping=aes(x="Harvested", y=P_F*.01+P_Bol*.97+P_Brh*.01+P_Brk*.9, fill="Harvested"))+
  geom_col(AEC_All_HNB, mapping=aes(x="Occluded", y=PO4_Net, fill="Net Occluded"))+
  scale_fill_manual(values=c("dark red", "orange", "seagreen4"))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(500, 1000))+
  coord_cartesian(ylim = c(0, 1000))

N_HNB<-ggplot()+geom_col(Leaching_HNB, mapping= aes(x="Leached", y=NO3+NH4, fill="Leached"))+
  geom_col(Net_Removal_HNB, mapping=aes(x="Harvested", y=N_F*.01+N_Bol*.97+N_Brh*.01+N_Brk*.9, fill="Harvested"))+
  scale_fill_manual(values=c(" dark red", "orange"))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Legend")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(1500, 4500, 6000))+
  coord_cartesian(ylim = c(0, 6500))


ggarrange(Ca_LNS, Ca_HNS, Ca_LNB, Ca_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Ca Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Loss Type", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="Ca_Loss.png", height=1000, width=1000, res=100)


ggarrange(Mg_LNS, Mg_HNS, Mg_LNB, Mg_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Mg Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Loss Type", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="Mg_Loss.png", height=1000, width=1000, res=100)


ggarrange(K_LNS, K_HNS, K_LNB, K_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("K Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Loss Type", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="K_Loss.png", height=1000, width=1000, res=100)

ggarrange(S_LNS, S_HNS, S_LNB, S_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("S Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Loss Type", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="S_Loss.png", height=1000, width=1000, res=100)


ggarrange(P_LNS, P_HNS, P_LNB, P_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("P Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Loss Type", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="P_Loss.png", height=1000, width=1000, res=100)


ggarrange(N_LNS, N_HNS, N_LNB, N_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("N Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                  font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Loss Type", gp = gpar(cex = 1.3))) %>%
  ggexport(filename="N_Loss.png", height=1000, width=1000, res=100)