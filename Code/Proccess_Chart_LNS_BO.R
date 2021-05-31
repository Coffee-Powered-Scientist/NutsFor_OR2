
rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)
library(ggpubr)

# Read files
Bio_Cycle_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Abov_Flux.csv")

Leaching_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/AEC_All.csv")

SOM_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/SOM.csv")


# Generate Lists for editing
H1_T<-as.list(seq(2005, 2025, 1))
H2_T<-as.list(seq(2028, 2068, 1))
H10_T<-as.list(seq(2371, 2412, 1))

Fills<-c("Gross Uptake", "Leaching", "Deposition", "Mineralization", "Weathering", "Harvested", "Litterfall", "Throughfall")
Fills_Ad<-c("Gross Uptake", "Leaching", "Deposition", "Mineralization", "Weathering", "Harvested", "Adsorbed", "Organic")



# Edit for H1


Bio_Cycle_H1_LNS<-Bio_Cycle_LNS %>% subset(YEAR %in% H1_T) %>% summarise(across(N_UP:S_MinSUM, ~sum (.x, na.rm=TRUE))) 
  
Abov_Flux_H1_LNS<-Abov_Flux_LNS %>% subset(YEAR %in% H1_T) %>% summarise(across(Ca_WET:P_WTH, ~sum(.x, na.rm=TRUE)))

Tree_Nut_H1_LNS<- Tree_Nut_LNS %>% subset(YEAR %in% 2025 & Month %in% 8)

Adsorb_H1_LNS<- AEC_All_LNS %>% subset(Date %in% '2025-08-01')  %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

Leaching_H1_LNS<-Leaching_LNS %>% subset(YEAR %in% H1_T & group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

SOM_H1_LNS<- SOM_LNS %>% subset(Date %in% '2025-08-01') %>% summarise(across(C:P, ~sum(.x, na.rm=TRUE)))

Bio_Cycle_H1_LNS$P_Org <- SOM_H1_LNS$P*30.974*10

T1_LNS<-cbind(Bio_Cycle_H1_LNS, Abov_Flux_H1_LNS, Adsorb_H1_LNS) 

# Calcium

T1_LNS$Ca_NET<-T1_LNS$Ca_UP-T1_LNS$Ca_THRU-T1_LNS$Ca_LF

T1_LNS$Ca_Harvested<-Tree_Nut_H1_LNS$Ca_Brk*.9+Tree_Nut_H1_LNS$Ca_Bol*.99

All_Proccesses_H1_LNS<-cbind(T1_LNS, Leaching_H1_LNS) 

All_Proccesses_H1_LNS<-as.data.frame(lapply(All_Proccesses_H1_LNS, as.numeric))


All_Ca_H1_LNS<-All_Proccesses_H1_LNS %>% select(matches("Ca")) %>% select(Ca_UP, Ca, Ca_WET, Ca_Minz, Ca_WTH, Ca_Harvested, Ca_LF, Ca_THRU) %>% melt()

All_Ca_H1_LNS$valueR<-All_Ca_H1_LNS$value/20

All_Ca_H1_LNS$Type<-c("Internal", "Loss", "Supply", "Internal", "Supply", "Loss", "Internal", "Internal")
All_Ca_H1_LNS$Harvest<-c("H1")


# Phosphorous 

T1_LNS$P_NET<-T1_LNS$P_UP-T1_LNS$P_LF

T1_LNS$P_Harvested<-Tree_Nut_H1_LNS$P_Brk*.9+Tree_Nut_H1_LNS$P_Bol*.99

All_Proccesses_H1_LNS<-cbind(T1_LNS, Leaching_H1_LNS) 

All_Proccesses_H1_LNS$P_WET = .201

All_Proccesses_H1_LNS$P_O4<-All_Proccesses_H1_LNS$PO4

All_P_H1_LNS<-All_Proccesses_H1_LNS %>% select(matches("P")) %>% select(P_NET, P, P_WET ,P_Minz, P_WTH, P_Harvested, P_O4, P_Org) %>% melt()

All_P_H1_LNS$Type<-c("Internal", "Loss", "Supply" ,"Internal", "Supply", "Loss", "Loss", "Supply")
All_P_H1_LNS$Harvest<-c("H1")




# Edit for H2

Bio_Cycle_H2_LNS<-Bio_Cycle_LNS %>% subset(YEAR %in% H2_T) %>% summarise(across(N_UP:S_MinSUM, ~sum (.x, na.rm=TRUE))) 

Abov_Flux_H2_LNS<-Abov_Flux_LNS %>% subset(YEAR %in% H2_T) %>% summarise(across(Ca_WET:P_WTH, ~sum(.x, na.rm=TRUE))) 

Tree_Nut_H2_LNS<- Tree_Nut_LNS %>% subset(YEAR %in% 2068 & Month %in% 8)

Adsorb_H2_LNS<- AEC_All_LNS %>% subset(Date %in% '2068-08-01')  %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

SOM_LNS_H2<-SOM_LNS %>% subset(Date %in% '2068-08-01') %>% summarise(across(C:P, ~sum(.x, na.rm=TRUE)))

Bio_Cycle_H2_LNS$P_Org <- SOM_LNS_H2$P*30.974*10

T1_LNS<-cbind(Bio_Cycle_H2_LNS, Abov_Flux_H2_LNS)

T1_LNS$Ca_NET<-T1_LNS$Ca_UP-T1_LNS$Ca_THRU-T1_LNS$Ca_LF

T1_LNS$Ca_Harvested<-Tree_Nut_H2_LNS$Ca_Brk*.9+Tree_Nut_H2_LNS$Ca_Bol

Leaching_H2_LNS<-Leaching_LNS %>% subset(YEAR %in% H2_T & group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) 

All_Proccesses_H2_LNS<-cbind(T1_LNS, Leaching_H2_LNS) 

All_Proccesses_H2_LNS<-as.data.frame(lapply(All_Proccesses_H2_LNS, as.numeric))


All_Ca_H2_LNS<-All_Proccesses_H2_LNS %>% select(matches("Ca")) %>% select(Ca_UP, Ca, Ca_WET, Ca_Minz, Ca_WTH, Ca_Harvested, Ca_LF, Ca_THRU) %>% melt()

All_Ca_H2_LNS$valueR<-All_Ca_H2_LNS$value/40

All_Ca_H2_LNS$Type<-c("Internal", "Loss", "Supply", "Internal", "Supply", "Loss", "Internal", "Internal")
All_Ca_H2_LNS$Harvest<-c("H2")




# Phosphorous 

T1_LNS$P_NET<-T1_LNS$P_UP-T1_LNS$P_LF

T1_LNS$P_Harvested<-Tree_Nut_H2_LNS$P_Brk*.9+Tree_Nut_H2_LNS$P_Bol*.99

All_Proccesses_H2_LNS<-cbind(T1_LNS, Leaching_H2_LNS, Adsorb_H2_LNS) 

All_Proccesses_H2_LNS$P_WET = .201

All_Proccesses_H2_LNS$P_O4<-All_Proccesses_H2_LNS$PO4

All_Proccesses_H2_LNS$P_L<-All_Proccesses_H2_LNS$P


All_P_H2_LNS<-All_Proccesses_H2_LNS %>% select(matches("P_")) %>% select(P_NET, P_L, P_WET ,P_Minz, P_WTH, P_Harvested, P_O4, P_Org) %>% melt()

All_P_H2_LNS$Type<-c("Internal", "Loss", "Supply" ,"Internal", "Supply", "Loss", "Loss", "Supply")
All_P_H2_LNS$Harvest<-c("H2")



# Edit for H3


Bio_Cycle_H10_LNS<-Bio_Cycle_LNS %>% subset(YEAR %in% H10_T) %>% summarise(across(N_UP:S_MinSUM, ~sum (.x, na.rm=TRUE))) 

Abov_Flux_H10_LNS<-Abov_Flux_LNS %>% subset(YEAR %in% H10_T) %>% summarise(across(Ca_WET:P_WTH, ~sum(.x, na.rm=TRUE))) 

Tree_Nut_H10_LNS<- Tree_Nut_LNS %>% subset(YEAR %in% 2412 & Month %in% 8)

Adsorb_H10_LNS<- AEC_All_LNS %>% subset(Date %in% '2412-08-01')  %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

SOM_LNS_H10<-SOM_LNS %>% subset(Date %in% '2412-08-01') %>% summarise(across(C:P, ~sum(.x, na.rm=TRUE)))

Bio_Cycle_H10_LNS$P_Org <- SOM_LNS_H10$P*30.974*10

T1_LNS<-cbind(Bio_Cycle_H10_LNS, Abov_Flux_H10_LNS)

T1_LNS$Ca_NET<-T1_LNS$Ca_UP-T1_LNS$Ca_THRU-T1_LNS$Ca_LF

T1_LNS$Ca_Harvested<-Tree_Nut_H10_LNS$Ca_Brk*.9+Tree_Nut_H10_LNS$Ca_Bol

Leaching_H10_LNS<-Leaching_LNS %>% subset(YEAR %in% H10_T & group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) 

All_Proccesses_H10_LNS<-cbind(T1_LNS, Leaching_H10_LNS) 

All_Proccesses_H10_LNS<-as.data.frame(lapply(All_Proccesses_H10_LNS, as.numeric))


All_Ca_H10_LNS<-All_Proccesses_H10_LNS %>% select(matches("Ca")) %>% select(Ca_UP, Ca, Ca_WET, Ca_Minz, Ca_WTH, Ca_Harvested, Ca_LF, Ca_THRU) %>% melt()

All_Ca_H10_LNS$valueR<-All_Ca_H10_LNS$value/40

All_Ca_H10_LNS$Type<-c("Internal", "Loss", "Supply", "Internal", "Supply", "Loss", "Internal", "Internal")
All_Ca_H10_LNS$Harvest<-c("H10")




# Phosphorous 

T1_LNS$P_NET<-T1_LNS$P_UP-T1_LNS$P_LF

T1_LNS$P_Harvested<-Tree_Nut_H10_LNS$P_Brk*.9+Tree_Nut_H10_LNS$P_Bol*.99

All_Proccesses_H10_LNS<-cbind(T1_LNS, Leaching_H10_LNS, Adsorb_H10_LNS) 

All_Proccesses_H10_LNS$P_WET = .201

All_Proccesses_H10_LNS$P_O4<-All_Proccesses_H10_LNS$PO4

All_Proccesses_H10_LNS$P_L<-All_Proccesses_H10_LNS$P


All_P_H10_LNS<-All_Proccesses_H10_LNS %>% select(matches("P_")) %>% select(P_NET, P_L, P_WET ,P_Minz, P_WTH, P_Harvested, P_O4, P_Org) %>% melt()

All_P_H10_LNS$Type<-c("Internal", "Loss", "Supply" ,"Internal", "Supply", "Loss", "Loss", "Supply")
All_P_H10_LNS$Harvest<-c("H10")



# Bind per nutrient

Ca_Ready_LNS<-rbind(All_Ca_H1_LNS, All_Ca_H2_LNS, All_Ca_H10_LNS)

Ca_Ready_LNS$Harvest<-factor(Ca_Ready_LNS$Harvest, levels = c("H1", "H2", "H10"))

ggplot(Ca_Ready_LNS, aes(x=Type, y=valueR, fill=variable, position='stacked'))+geom_col()+
  #geom_col(aes(x="Internal", y=c(19.67, 19.67), fill=variable))+
  labs(x="Proccess", y="Ca Distribution (kg/ha)", fill="Legend", title= "LN SED: 40 BO")+
  scale_fill_discrete(labels=Fills)+theme_classic2()+facet_wrap(~Harvest)




P_Ready_LNS<-rbind(All_P_H1_LNS, All_P_H2_LNS, All_P_H10_LNS)

P_Ready_LNS$Harvest<-factor(P_Ready_LNS$Harvest, levels = c("H1", "H2", "H10"))

ggplot(P_Ready_LNS, aes(x=Type, y=value, fill=variable, position='stacked'))+geom_col()+
  labs(x="Proccess", y="P Distribution (kg/ha)", fill="Legend", title= "LN SED: 40 BO")+
  scale_fill_discrete(labels=Fills_Ad)+theme_classic2()+facet_wrap(~Harvest)