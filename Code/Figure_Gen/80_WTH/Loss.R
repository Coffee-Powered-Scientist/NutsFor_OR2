rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)
library(ggpubr)
library(grid)
library(gridExtra)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_WTH")

Years<-seq(2005, 2505, 1)


Years_80<-c(2066,	2067,	2068,	2069,	2070,	2071, 2072, 2073, 2074, 2075,
            2148,	2149,	2150,	2151,	2152, 2153, 2154, 2155, 2156, 2157,
            2230,	2231,	2232,	2233,	2234, 2235, 2236, 2237, 2238, 2239,
            2312,	2313,	2314,	2315,	2316, 2317, 2318, 2319, 2320, 2321,
            2394,	2395,	2396,	2397,	2398, 2398, 2399, 2400, 2401, 2402,
            2476,	2477,	2478,	2479,	2480, 2480, 2481, 2482, 2483, 2484	
)


Years_R1_Back<-seq(2005, 2065, 1)

Years_R1_Post<-seq(2066, 2076, 1)


# LN SED

Leaching_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")


Leaching_LNS_Post<-Leaching_LNS %>% subset(group_id %in% 8 & YEAR %in% Years_80) %>%
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Post-Harvest Leaching" , N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_LNS_Background<-Leaching_LNS %>% subset(!YEAR %in% Years_80)


Leaching_LNS_Background<-Leaching_LNS_Background %>% subset(group_id %in% 8) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)



Leaching_LNS_Post_R1<-Leaching_LNS %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Post) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Post-Harvest Leaching", N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_LNS_Background_R1<-Leaching_LNS %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Back) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>%
  select(N, P, K, Ca, Rot, Loss1, Loss2)



Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_LNS_R1<-Tree_Nut_LNS %>% subset(YEAR %in% c(2065)) %>% subset(Month %in% 8)  %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_LNS_R1$P_Brh<-as.numeric(Net_Removal_LNS_R1$P_Brh)

Net_Removal_LNS_R1<-Net_Removal_LNS_R1 %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_LNS<-Tree_Nut_LNS %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_LNS$P_Brh<-as.numeric(Net_Removal_LNS$P_Brh)

Net_Removal_LNS<-Net_Removal_LNS %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Harvest", Loss2="Harvest")

Net_Removal_LNS_R1$Ca<-Net_Removal_LNS_R1$Ca_F*.99+Net_Removal_LNS_R1$Ca_Bol*.94+Net_Removal_LNS_R1$Ca_Brh*.99+Net_Removal_LNS_R1$Ca_Brk*.9

Net_Removal_LNS_R1$N<-Net_Removal_LNS_R1$N_F*.99+Net_Removal_LNS_R1$N_Bol*.94+Net_Removal_LNS_R1$N_Brh*.99+Net_Removal_LNS_R1$N_Brk*.9

Net_Removal_LNS_R1$K<-Net_Removal_LNS_R1$K_F*.99+Net_Removal_LNS_R1$K_Bol*.94+Net_Removal_LNS_R1$K_Brh*.99+Net_Removal_LNS_R1$K_Brk*.9

Net_Removal_LNS_R1$P<-Net_Removal_LNS_R1$P_F*.99+Net_Removal_LNS_R1$P_Bol*.94+Net_Removal_LNS_R1$P_Brh*.99+Net_Removal_LNS_R1$P_Brk*.9

Net_Removal_LNS$Ca<-Net_Removal_LNS$Ca_F*.99+Net_Removal_LNS$Ca_Bol*.94+Net_Removal_LNS$Ca_Brh*.99+Net_Removal_LNS$Ca_Brk*.9

Net_Removal_LNS$N<-Net_Removal_LNS$N_F*.99+Net_Removal_LNS$N_Bol*.94+Net_Removal_LNS$N_Brh*.99+Net_Removal_LNS$N_Brk*.9

Net_Removal_LNS$K<-Net_Removal_LNS$K_F*.99+Net_Removal_LNS$K_Bol*.94+Net_Removal_LNS$K_Brh*.99+Net_Removal_LNS$K_Brk*.9

Net_Removal_LNS$P<-Net_Removal_LNS$P_F*.99+Net_Removal_LNS$P_Bol*.94+Net_Removal_LNS$P_Brh*.99+Net_Removal_LNS$P_Brk*.9


NR_LNS_R1<-Net_Removal_LNS_R1 %>% select(N, P, K, Ca, Rot, Loss1, Loss2)

NR_LNS<- Net_Removal_LNS %>% select(N, P, K, Ca, Rot, Loss1, Loss2)





####


AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/AEC_All.csv")

AEC_All_LNS_R1<-AEC_All_LNS %>% subset(Date %in% c('2005-08-01', '2025-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_LNS_R1$PO4_Net<-diff(AEC_All_LNS_R1$PO4)

AEC_All_LNS_R1<-AEC_All_LNS_R1 %>% subset(Date %in% c('2005-08-01')) %>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

AEC_All_LNS<-AEC_All_LNS %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_LNS$SO4_Net<-diff(AEC_All_LNS$SO4)

AEC_All_LNS$PO4_Net<-diff(AEC_All_LNS$PO4)

AEC_All_LNS<-AEC_All_LNS %>% subset(Date %in% c('2005-08-01'))%>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)


####

LNS<-rbind(Leaching_LNS_Post, Leaching_LNS_Background, Leaching_LNS_Post_R1, 
           Leaching_LNS_Background_R1, NR_LNS_R1, NR_LNS, AEC_All_LNS_R1, AEC_All_LNS)

LNS_Melt<-melt(LNS)

LNS_Melt$Rot<-as.factor(LNS_Melt$Rot)


LNS_Rot1_SUM<-LNS %>% subset(Rot %in% "Rotation 1") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))
LNS_CML_SUM<-LNS %>% subset(Rot %in% "Cumulative") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))

####

Ca_LNS<-ggplot(subset(LNS_Melt, variable %in% c("Ca") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

K_LNS<-ggplot(subset(LNS_Melt, variable %in% c("K") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

P_LNS<-ggplot(subset(LNS_Melt, variable %in% c("P")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("darkblue","dark red", "green4", "orange"))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 500, 1000, 1500, 2000))+
  coord_cartesian(ylim = c(0, 2000))+
  scale_x_discrete(limits = rev)

N_LNS<-ggplot(subset(LNS_Melt, variable %in% c("N") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0 ,2000, 4000, 6000, 8000, 10000))+
  coord_cartesian(ylim = c(0, 10000))+
  scale_x_discrete(limits = rev)

####

#HN SED
Leaching_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_HNS_Post<-Leaching_HNS %>% subset(group_id %in% 8 & YEAR %in% Years_80) %>%
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Post-Harvest Leaching" , N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)


Leaching_HNS_Background<-Leaching_HNS %>% subset(!YEAR %in% Years_80)


Leaching_HNS_Background<-Leaching_HNS_Background %>% subset(group_id %in% 8) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)


Leaching_HNS_Post_R1<-Leaching_HNS %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Post) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Post-Harvest Leaching", N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_HNS_Background_R1<-Leaching_HNS %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Back) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>%
  select(N, P, K, Ca, Rot, Loss1, Loss2)



Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_HNS_R1<-Tree_Nut_HNS %>% subset(YEAR %in% c(2065)) %>% subset(Month %in% 8)  %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_HNS_R1$P_Brh<-as.numeric(Net_Removal_HNS_R1$P_Brh)

Net_Removal_HNS_R1<-Net_Removal_HNS_R1 %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_HNS<-Tree_Nut_HNS %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_HNS$P_Brh<-as.numeric(Net_Removal_HNS$P_Brh)

Net_Removal_HNS<-Net_Removal_HNS %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Harvest", Loss2="Harvest")

Net_Removal_HNS_R1$Ca<-Net_Removal_HNS_R1$Ca_F*.99+Net_Removal_HNS_R1$Ca_Bol*.94+Net_Removal_HNS_R1$Ca_Brh*.99+Net_Removal_HNS_R1$Ca_Brk*.9

Net_Removal_HNS_R1$N<-Net_Removal_HNS_R1$N_F*.99+Net_Removal_HNS_R1$N_Bol*.94+Net_Removal_HNS_R1$N_Brh*.99+Net_Removal_HNS_R1$N_Brk*.9

Net_Removal_HNS_R1$K<-Net_Removal_HNS_R1$K_F*.99+Net_Removal_HNS_R1$K_Bol*.94+Net_Removal_HNS_R1$K_Brh*.99+Net_Removal_HNS_R1$K_Brk*.9

Net_Removal_HNS_R1$P<-Net_Removal_HNS_R1$P_F*.99+Net_Removal_HNS_R1$P_Bol*.94+Net_Removal_HNS_R1$P_Brh*.99+Net_Removal_HNS_R1$P_Brk*.9

Net_Removal_HNS$Ca<-Net_Removal_HNS$Ca_F*.99+Net_Removal_HNS$Ca_Bol*.94+Net_Removal_HNS$Ca_Brh*.99+Net_Removal_HNS$Ca_Brk*.9

Net_Removal_HNS$N<-Net_Removal_HNS$N_F*.99+Net_Removal_HNS$N_Bol*.94+Net_Removal_HNS$N_Brh*.99+Net_Removal_HNS$N_Brk*.9

Net_Removal_HNS$K<-Net_Removal_HNS$K_F*.99+Net_Removal_HNS$K_Bol*.94+Net_Removal_HNS$K_Brh*.99+Net_Removal_HNS$K_Brk*.9

Net_Removal_HNS$P<-Net_Removal_HNS$P_F*.99+Net_Removal_HNS$P_Bol*.94+Net_Removal_HNS$P_Brh*.99+Net_Removal_HNS$P_Brk*.9


NR_HNS_R1<-Net_Removal_HNS_R1 %>% select(N, P, K, Ca, Rot, Loss1, Loss2)

NR_HNS<- Net_Removal_HNS %>% select(N, P, K, Ca, Rot, Loss1, Loss2)





####


AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/AEC_All.csv")

AEC_All_HNS_R1<-AEC_All_HNS %>% subset(Date %in% c('2005-08-01', '2025-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_HNS_R1$PO4_Net<-diff(AEC_All_HNS_R1$PO4)

AEC_All_HNS_R1<-AEC_All_HNS_R1 %>% subset(Date %in% c('2005-08-01')) %>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

AEC_All_HNS<-AEC_All_HNS %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_HNS$SO4_Net<-diff(AEC_All_HNS$SO4)

AEC_All_HNS$PO4_Net<-diff(AEC_All_HNS$PO4)

AEC_All_HNS<-AEC_All_HNS %>% subset(Date %in% c('2005-08-01'))%>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)


####

HNS<-rbind(Leaching_HNS_Post, Leaching_HNS_Background, Leaching_HNS_Post_R1, 
           Leaching_HNS_Background_R1, NR_HNS_R1, NR_HNS, AEC_All_HNS_R1, AEC_All_HNS)

HNS_Melt<-melt(HNS)

HNS_Melt$Rot<-as.factor(HNS_Melt$Rot)


HNS_Rot1_SUM<-HNS %>% subset(Rot %in% "Rotation 1") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))
HNS_CML_SUM<-HNS %>% subset(Rot %in% "Cumulative") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))

####

Ca_HNS<-ggplot(subset(HNS_Melt, variable %in% c("Ca") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

K_HNS<-ggplot(subset(HNS_Melt, variable %in% c("K") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

P_HNS<-ggplot(subset(HNS_Melt, variable %in% c("P")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("darkblue","dark red", "green4", "orange"))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 500, 1000, 1500, 2000))+
  coord_cartesian(ylim = c(0, 2000))+
  scale_x_discrete(limits = rev)

N_HNS<-ggplot(subset(HNS_Melt, variable %in% c("N")& Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="High N Sedimentary", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0 ,2000, 4000, 6000, 8000, 10000))+
  coord_cartesian(ylim = c(0, 10000))+
  scale_x_discrete(limits = rev)

# LN BAS

Leaching_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_LNB_Post<-Leaching_LNB %>% subset(group_id %in% 8 & YEAR %in% Years_80) %>%
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Post-Harvest Leaching" , N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_LNB_Background<-Leaching_LNB %>% subset(!YEAR %in% Years_80)


Leaching_LNB_Background<-Leaching_LNB_Background %>% subset(group_id %in% 8) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_LNB_Post_R1<-Leaching_LNB %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Post) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Post-Harvest Leaching", N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_LNB_Background_R1<-Leaching_LNB %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Back) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>%
  select(N, P, K, Ca, Rot, Loss1, Loss2)



Tree_Nut_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_LNB_R1<-Tree_Nut_LNB %>% subset(YEAR %in% c(2065)) %>% subset(Month %in% 8)  %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_LNB_R1$P_Brh<-as.numeric(Net_Removal_LNB_R1$P_Brh)

Net_Removal_LNB_R1<-Net_Removal_LNB_R1 %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_LNB<-Tree_Nut_LNB %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_LNB$P_Brh<-as.numeric(Net_Removal_LNB$P_Brh)

Net_Removal_LNB<-Net_Removal_LNB %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Harvest", Loss2="Harvest")

Net_Removal_LNB_R1$Ca<-Net_Removal_LNB_R1$Ca_F*.99+Net_Removal_LNB_R1$Ca_Bol*.94+Net_Removal_LNB_R1$Ca_Brh*.99+Net_Removal_LNB_R1$Ca_Brk*.9

Net_Removal_LNB_R1$N<-Net_Removal_LNB_R1$N_F*.99+Net_Removal_LNB_R1$N_Bol*.94+Net_Removal_LNB_R1$N_Brh*.99+Net_Removal_LNB_R1$N_Brk*.9

Net_Removal_LNB_R1$K<-Net_Removal_LNB_R1$K_F*.99+Net_Removal_LNB_R1$K_Bol*.94+Net_Removal_LNB_R1$K_Brh*.99+Net_Removal_LNB_R1$K_Brk*.9

Net_Removal_LNB_R1$P<-Net_Removal_LNB_R1$P_F*.99+Net_Removal_LNB_R1$P_Bol*.94+Net_Removal_LNB_R1$P_Brh*.99+Net_Removal_LNB_R1$P_Brk*.9

Net_Removal_LNB$Ca<-Net_Removal_LNB$Ca_F*.99+Net_Removal_LNB$Ca_Bol*.94+Net_Removal_LNB$Ca_Brh*.99+Net_Removal_LNB$Ca_Brk*.9

Net_Removal_LNB$N<-Net_Removal_LNB$N_F*.99+Net_Removal_LNB$N_Bol*.94+Net_Removal_LNB$N_Brh*.99+Net_Removal_LNB$N_Brk*.9

Net_Removal_LNB$K<-Net_Removal_LNB$K_F*.99+Net_Removal_LNB$K_Bol*.94+Net_Removal_LNB$K_Brh*.99+Net_Removal_LNB$K_Brk*.9

Net_Removal_LNB$P<-Net_Removal_LNB$P_F*.99+Net_Removal_LNB$P_Bol*.94+Net_Removal_LNB$P_Brh*.99+Net_Removal_LNB$P_Brk*.9


NR_LNB_R1<-Net_Removal_LNB_R1 %>% select(N, P, K, Ca, Rot, Loss1, Loss2)

NR_LNB<- Net_Removal_LNB %>% select(N, P, K, Ca, Rot, Loss1, Loss2)





####


AEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/AEC_All.csv")

AEC_All_LNB_R1<-AEC_All_LNB %>% subset(Date %in% c('2005-08-01', '2025-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_LNB_R1$PO4_Net<-diff(AEC_All_LNB_R1$PO4)

AEC_All_LNB_R1<-AEC_All_LNB_R1 %>% subset(Date %in% c('2005-08-01')) %>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

AEC_All_LNB<-AEC_All_LNB %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_LNB$SO4_Net<-diff(AEC_All_LNB$SO4)

AEC_All_LNB$PO4_Net<-diff(AEC_All_LNB$PO4)

AEC_All_LNB<-AEC_All_LNB %>% subset(Date %in% c('2005-08-01'))%>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)


####

LNB<-rbind(Leaching_LNB_Post, Leaching_LNB_Background, Leaching_LNB_Post_R1, 
           Leaching_LNB_Background_R1, NR_LNB_R1, NR_LNB, AEC_All_LNB_R1, AEC_All_LNB)

LNB_Melt<-melt(LNB)

LNB_Melt$Rot<-as.factor(LNB_Melt$Rot)


LNB_Rot1_SUM<-LNB %>% subset(Rot %in% "Rotation 1") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))
LNB_CML_SUM<-LNB %>% subset(Rot %in% "Cumulative") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))

####

Ca_LNB<-ggplot(subset(LNB_Melt, variable %in% c("Ca") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

K_LNB<-ggplot(subset(LNB_Melt, variable %in% c("K") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

P_LNB<-ggplot(subset(LNB_Melt, variable %in% c("P")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("darkblue","dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 500, 1000, 1500, 2000))+
  coord_cartesian(ylim = c(0, 2000))+
  scale_x_discrete(limits = rev)

N_LNB<-ggplot(subset(LNB_Melt, variable %in% c("N") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="Low N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0 ,2000, 4000, 6000, 8000, 10000))+
  coord_cartesian(ylim = c(0, 10000))+
  scale_x_discrete(limits = rev)


# HN BAS

Leaching_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_HNB_Post<-Leaching_HNB %>% subset(group_id %in% 8 & YEAR %in% Years_80) %>%
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Post-Harvest Leaching" , N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_HNB_Background<-Leaching_HNB %>% subset(!YEAR %in% Years_80)


Leaching_HNB_Background<-Leaching_HNB_Background %>% subset(group_id %in% 8) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Cumulative", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_HNB_Post_R1<-Leaching_HNB %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Post) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Post-Harvest Leaching", N=NO3+NH4)  %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

Leaching_HNB_Background_R1<-Leaching_HNB %>% subset(group_id %in% 8 & YEAR %in% Years_R1_Back) %>% 
  summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))  %>% mutate(Rot="Rotation 1", Loss1="Leaching",Loss2="Background Leaching", N=NO3+NH4) %>%
  select(N, P, K, Ca, Rot, Loss1, Loss2)



Tree_Nut_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

Net_Removal_HNB_R1<-Tree_Nut_HNB %>% subset(YEAR %in% c(2065)) %>% subset(Month %in% 8)  %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_HNB_R1$P_Brh<-as.numeric(Net_Removal_HNB_R1$P_Brh)

Net_Removal_HNB_R1<-Net_Removal_HNB_R1 %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Harvest", Loss2="Harvest")

Net_Removal_HNB<-Tree_Nut_HNB %>% subset(YEAR %in% c(2065, 2147, 2229, 2311, 2393, 2475
)) %>% subset(Month %in% 8)

Net_Removal_HNB$P_Brh<-as.numeric(Net_Removal_HNB$P_Brh)

Net_Removal_HNB<-Net_Removal_HNB %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Harvest", Loss2="Harvest")

Net_Removal_HNB_R1$Ca<-Net_Removal_HNB_R1$Ca_F*.99+Net_Removal_HNB_R1$Ca_Bol*.94+Net_Removal_HNB_R1$Ca_Brh*.99+Net_Removal_HNB_R1$Ca_Brk*.9

Net_Removal_HNB_R1$N<-Net_Removal_HNB_R1$N_F*.99+Net_Removal_HNB_R1$N_Bol*.94+Net_Removal_HNB_R1$N_Brh*.99+Net_Removal_HNB_R1$N_Brk*.9

Net_Removal_HNB_R1$K<-Net_Removal_HNB_R1$K_F*.99+Net_Removal_HNB_R1$K_Bol*.94+Net_Removal_HNB_R1$K_Brh*.99+Net_Removal_HNB_R1$K_Brk*.9

Net_Removal_HNB_R1$P<-Net_Removal_HNB_R1$P_F*.99+Net_Removal_HNB_R1$P_Bol*.94+Net_Removal_HNB_R1$P_Brh*.99+Net_Removal_HNB_R1$P_Brk*.9

Net_Removal_HNB$Ca<-Net_Removal_HNB$Ca_F*.99+Net_Removal_HNB$Ca_Bol*.94+Net_Removal_HNB$Ca_Brh*.99+Net_Removal_HNB$Ca_Brk*.9

Net_Removal_HNB$N<-Net_Removal_HNB$N_F*.99+Net_Removal_HNB$N_Bol*.94+Net_Removal_HNB$N_Brh*.99+Net_Removal_HNB$N_Brk*.9

Net_Removal_HNB$K<-Net_Removal_HNB$K_F*.99+Net_Removal_HNB$K_Bol*.94+Net_Removal_HNB$K_Brh*.99+Net_Removal_HNB$K_Brk*.9

Net_Removal_HNB$P<-Net_Removal_HNB$P_F*.99+Net_Removal_HNB$P_Bol*.94+Net_Removal_HNB$P_Brh*.99+Net_Removal_HNB$P_Brk*.9


NR_HNB_R1<-Net_Removal_HNB_R1 %>% select(N, P, K, Ca, Rot, Loss1, Loss2)

NR_HNB<- Net_Removal_HNB %>% select(N, P, K, Ca, Rot, Loss1, Loss2)





####


AEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/AEC_All.csv")

AEC_All_HNB_R1<-AEC_All_HNB %>% subset(Date %in% c('2005-08-01', '2025-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Rotation 1", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_HNB_R1$PO4_Net<-diff(AEC_All_HNB_R1$PO4)

AEC_All_HNB_R1<-AEC_All_HNB_R1 %>% subset(Date %in% c('2005-08-01')) %>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)

AEC_All_HNB<-AEC_All_HNB %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE))) %>% mutate(Rot="Cumulative", Loss1="Adsorption", Loss2="Adsorption")

AEC_All_HNB$SO4_Net<-diff(AEC_All_HNB$SO4)

AEC_All_HNB$PO4_Net<-diff(AEC_All_HNB$PO4)

AEC_All_HNB<-AEC_All_HNB %>% subset(Date %in% c('2005-08-01'))%>% rename(P=PO4_Net) %>% 
  mutate(N=0, K=0, Ca=0) %>% 
  select(N, P, K, Ca, Rot, Loss1, Loss2)


####

HNB<-rbind(Leaching_HNB_Post, Leaching_HNB_Background, Leaching_HNB_Post_R1, 
           Leaching_HNB_Background_R1, NR_HNB_R1, NR_HNB, AEC_All_HNB_R1, AEC_All_HNB)

HNB_Melt<-melt(HNB)

HNB_Melt$Rot<-as.factor(HNB_Melt$Rot)


HNB_Rot1_SUM<-HNB %>% subset(Rot %in% "Rotation 1") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))
HNB_CML_SUM<-HNB %>% subset(Rot %in% "Cumulative") %>% summarise(across(N:Ca, ~sum(.x, na.rm=TRUE)))

####

Ca_HNB<-ggplot(subset(HNB_Melt, variable %in% c("Ca") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

K_HNB<-ggplot(subset(HNB_Melt, variable %in% c("K") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 1000, 2000, 3000))+
  coord_cartesian(ylim = c(0, 3000))+
  scale_x_discrete(limits = rev)

P_HNB<-ggplot(subset(HNB_Melt, variable %in% c("P")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("darkblue","dark red", "green4", "orange"))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0, 500, 1000, 1500, 2000))+
  coord_cartesian(ylim = c(0, 2000))+
  scale_x_discrete(limits = rev)

N_HNB<-ggplot(subset(HNB_Melt, variable %in% c("N") & Loss2 != c("Adsorption")), aes(x=Rot, y=value, fill=Loss2))+
  geom_col()+
  scale_fill_manual(values=c("dark red", "green4", "orange" ))+labs(x=NULL, y=NULL, title="High N Basalt", fill="Loss Type")+
  theme_classic2()+theme(plot.title = element_text(hjust = 0.5))+ 
  scale_y_continuous(breaks=c(0 ,2000, 4000, 6000, 8000, 10000))+
  coord_cartesian(ylim = c(0, 10000))+
  scale_x_discrete(limits = rev)


ggarrange(Ca_LNS, Ca_HNS, Ca_LNB, Ca_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Ca Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                             font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Frame", gp = gpar(cex = 1.3)), top=textGrob("80 WTH")) %>%
  ggexport(filename="Ca_Loss.png", height=1000, width=1000, res=100)


ggarrange(Mg_LNS, Mg_HNS, Mg_LNB, Mg_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Mg Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                             font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Frame", gp = gpar(cex = 1.3)), top=textGrob("80 WTH")) %>%
  ggexport(filename="Mg_Loss.png", height=1000, width=1000, res=100)


ggarrange(K_LNS, K_HNS, K_LNB, K_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("K Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                            font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Frame", gp = gpar(cex = 1.3)), top=textGrob("80 WTH")) %>%
  ggexport(filename="K_Loss.png", height=1000, width=1000, res=100)

ggarrange(S_LNS, S_HNS, S_LNB, S_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("S Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                            font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Frame", gp = gpar(cex = 1.3)), top=textGrob("80 WTH")) %>%
  ggexport(filename="S_Loss.png", height=1000, width=1000, res=100)


ggarrange(P_LNS, P_HNS, P_LNB, P_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("P Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                            font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Frame", gp = gpar(cex = 1.3)), top=textGrob("80 WTH")) %>%
  ggexport(filename="P_Loss.png", height=1000, width=1000, res=100)


ggarrange(N_LNS, N_HNS, N_LNB, N_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("N Loss ( kg"~'⋅'~ha^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,
                                                                                                            font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Frame", gp = gpar(cex = 1.3)), top=textGrob("80 WTH")) %>%
  ggexport(filename="N_Loss.png", height=1000, width=1000, res=100)