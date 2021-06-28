

rm(list = ls())

library(ggplot2)
library(dplyr)
library(ggpubr)
library(gridExtra)
library(grid)


Years<-seq(2005, 2105, 1)


# Low N Sed

Bio_Cycle_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Abov_Flux.csv")

Leaching_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS<-Leaching_LNS %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/AEC_All.csv")

SOM_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/SOM.csv")

Bio_Cycle_LNS$N_MinST<-ifelse(Bio_Cycle_LNS$N_MinSUM < 0, 0, Bio_Cycle_LNS$N_MinSUM)

N_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=N_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(aes(y=N_MinST, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=NO3+NH4, color="Leached"))+
  labs(y="N Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple"))+
  theme_classic()+
  ggtitle("LN Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),
        axis.title.x = element_text(size=12, face="bold", colour = "black"),    
        axis.title.y = element_text(size=12, face="bold", colour = "black"),    
        axis.text.x = element_text(size=12, face="bold", colour = "black"), 
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(15, 30, 45, 60, 75, 90))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 


Ca_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=Ca_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca, color="Leached"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WTH, color="Weathered"))+
  labs(y="Ca Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),
        axis.title.x = element_text(size=12, face="bold", colour = "black"),
        axis.title.y = element_text(size=12, face="bold", colour = "black"),
        axis.text.x = element_text(size=12, face="bold", colour = "black"), 
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(5,10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 


Mg_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=Mg_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg, color="Leached"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WTH, color="Weathered"))+
  labs(y="Mg Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),
        axis.title.x = element_text(size=12, face="bold", colour = "black"),
        axis.title.y = element_text(size=12, face="bold", colour = "black"), 
        axis.text.x = element_text(size=12, face="bold", colour = "black"),
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(1,2,3,4, 5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

K_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=K_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=K, color="Leached"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WTH, color="Weathered"))+
  labs(y="K Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),
    axis.title.x = element_text(size=12, face="bold", colour = "black"),
    axis.title.y = element_text(size=12, face="bold", colour = "black"),
    axis.text.x = element_text(size=12, face="bold", colour = "black"),          
    axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 30))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

S_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=S_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=SO4, color="Leached"))+
  #geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WTH, color="Weathered"))+
  labs(y="S Fluxes (kg/ha/yr)", x="Year", color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 



P_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=P_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=P, color="Leached"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=YEAR, y=P_WTH, color="Weathered"))+
  labs(y="P Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),            
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(1,2, 3, 4, 5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

# HN SED

Bio_Cycle_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Abov_Flux.csv")

Leaching_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS<-Leaching_HNS %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/AEC_All.csv")

SOM_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/SOM.csv")

Manual_Minz<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Litter_Pool_Minz.csv")

Bio_Cycle_HNS$N_MinST<-ifelse(Bio_Cycle_HNS$N_MinSUM < 0, 0, Bio_Cycle_HNS$N_MinSUM)


Test_Flux<-Bio_Cycle_HNS$N_UP+Leaching_8_HNS$NO3+Leaching_8_HNS$NH4-Bio_Cycle_HNS$N_Minz

N_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=N_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(aes(y=N_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=NO3+NH4, color="Leached"))+
  geom_line()+
  labs(y="N Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  theme_classic()+
  ggtitle("HN Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(15, 30, 45, 60, 75, 90))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

Ca_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=Ca_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca, color="Leached"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WTH, color="Weathered"))+
  labs(y="Ca Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 


Mg_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=Mg_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg, color="Leached"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WTH, color="Weathered"))+
  labs(y="Mg Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(1,2,3,4,5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

K_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=K_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=K, color="Leached"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WTH, color="Weathered"))+
  labs(y="K Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 30))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

S_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=S_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=SO4, color="Leached"))+
  #geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WTH, color="Weathered"))+
  labs(y="S Fluxes (Kg/ha/yr)", x="Year", color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "blacS"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),    
        axis.title.x = element_text(size=12, face="bold", colour = "black"),           
        axis.title.y = element_text(size=12, face="bold", colour = "black"),           
        axis.text.x = element_text(size=12, face="bold", colour = "black"),         
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 



P_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=P_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=P, color="Leached"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=P_WTH, color="Weathered"))+
  labs(y="P Fluxes (Kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),            
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(1,2, 3, 4, 5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

# LN BAS

Bio_Cycle_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Abov_Flux.csv")

Leaching_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB<-Leaching_LNB %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/AEC_All.csv")

SOM_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/SOM.csv")

Bio_Cycle_LNB$N_MinST<-ifelse(Bio_Cycle_LNB$N_MinSUM < 0, 0, Bio_Cycle_LNB$N_MinSUM)

N_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=YEAR, y=N_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(aes(y=N_MinST, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=NO3+NH4, color="Leached"))+
  labs(y="N Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple"))+
  theme_classic()+
  ggtitle("LN Basalt")+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(15, 30, 45, 60, 75, 90))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

Ca_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=YEAR, y=Ca_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca, color="Leached"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WTH, color="Weathered"))+
  labs(y="Ca Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),            
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 



Mg_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=YEAR, y=Mg_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg, color="Leached"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WTH, color="Weathered"))+
  labs(y="Mg Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(1,2,3,4,5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

K_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=YEAR, y=K_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=K, color="Leached"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WTH, color="Weathered"))+
  labs(y="K Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),         
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 30))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

S_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=YEAR, y=S_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=SO4, color="Leached"))+
  #geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WTH, color="Weathered"))+
  labs(y="S Fluxes (Kg/ha/yr)", x="Year", color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "blacS"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),            
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 




P_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=YEAR, y=P_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=P, color="Leached"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=YEAR, y=P_WTH, color="Weathered"))+
  labs(y="P Fluxes (Kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),         
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(1,2, 3, 4, 5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

# HN BAS

Bio_Cycle_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Abov_Flux.csv")

Leaching_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB<-Leaching_HNB %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/AEC_All.csv")

SOM_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/SOM.csv")

Bio_Cycle_HNB$N_MinST<-ifelse(Bio_Cycle_HNB$N_MinSUM < 0, 0, Bio_Cycle_HNB$N_MinSUM)

N_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=YEAR, y=N_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(aes(y=N_MinST, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=NO3+NH4, color="Leached"))+
  labs(y="N Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple"))+
  theme_classic()+
  ggtitle("HN Basalt")+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),         
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(15, 30, 45, 60, 75, 90))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

Ca_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=YEAR, y=Ca_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca, color="Leached"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Ca_WTH, color="Weathered"))+
  labs(y="Ca Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),         
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 


Mg_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=YEAR, y=Mg_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg, color="Leached"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=Mg_WTH, color="Weathered"))+
  labs(y="Mg Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(1,2,3,4,5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

K_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=YEAR, y=K_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=K, color="Leached"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=K_WTH, color="Weathered"))+
  labs(y="K Fluxes (kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),            
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(5,10, 15, 20, 25, 30))+
  coord_cartesian(ylim = c(0, 30))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 


S_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=YEAR, y=S_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=SO4, color="Leached"))+
  #geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=S_WTH, color="Weathered"))+
  labs(y="S Fluxes (Kg/ha/yr)", x="Year", color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "blacS"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),            
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 



P_HNB<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=YEAR, y=P_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=P, color="Leached"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=YEAR, y=P_WTH, color="Weathered"))+
  labs(y="P Fluxes (Kg/ha/yr)", x="Year", color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=12, face="bold", color="black"),
        axis.title.x = element_text(size=12, face="bold", colour = "black"),
        axis.title.y = element_text(size=12, face="bold", colour = "black"),
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black"))+ 
  scale_y_continuous(breaks=c(1,2, 3, 4, 5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 2025, y = 80,
    xend = 2025, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )+
  geom_segment(
    x = 2067, y = 80,
    xend = 2067, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 
  


setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_BO")


ggarrange(N_LNS, N_HNS, N_LNB, N_HNB, labels=c("A", "B", "C", "D"),
          ncol = 1, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="N.png", height=1000, width=650, res=100)

ggarrange(Ca_LNS, Ca_HNS, Ca_LNB, Ca_HNB, labels=c("A", "B", "C", "D"),
          ncol = 1, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="Ca.png", height=1000, width=650, res=100)

ggarrange(Mg_LNS, Mg_HNS, Mg_LNB, Mg_HNB, labels=c("A", "B", "C", "D"),
          ncol = 1, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="Mg.png", height=1000, width=650, res=100)

ggarrange(K_LNS, K_HNS, K_LNB, K_HNB, labels=c("A", "B", "C", "D"),
          ncol = 1, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="K.png", height=1000, width=650, res=100)

ggarrange(P_LNS, P_HNS, P_LNB, P_HNB, labels=c("A", "B", "C", "D"),
          ncol = 1, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="P.png", height=1000, width=650, res=100)

ggarrange(S_LNS, S_HNS, S_LNB, S_HNB, labels=c("A", "B", "C", "D"),
          ncol = 1, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="S.png", height=1000, width=650, res=100)