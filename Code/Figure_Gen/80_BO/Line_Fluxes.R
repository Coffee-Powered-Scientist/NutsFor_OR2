

rm(list = ls())

library(ggplot2)
library(dplyr)
library(ggpubr)
library(gridExtra)
library(grid)


Years<-seq(2005, 2105, 1)


# Low N Sed

Bio_Cycle_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Abov_Flux.csv")

Leaching_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS<-Leaching_LNS %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/AEC_All.csv")

SOM_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/SOM.csv")

SOM_Min_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/SOM_Min.csv")

Litter_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Litter_Pool.csv")




SOM_LNS<-SOM_LNS%>% group_by(Year, Month) %>% select(Year, Month, C, N, Ca, Mg, K, S, P, MB_N) %>% summarise(across(C:MB_N, ~sum(.x, na.rm=TRUE)))

SOM_LNS_1<-SOM_LNS %>% subset(Month %in% c(1))

SOM_LNS_12<-SOM_LNS %>% subset(Month %in% c(12))

SOM_LNS_Net<-data.frame(SOM_LNS_1, SOM_LNS_12)

SOM_LNS_Net$dSOMN<-(SOM_LNS_Net$N.1-SOM_LNS_Net$N)*14*10*-1

SOM_LNS_Net$dMic<-(SOM_LNS_Net$MB_N.1-SOM_LNS_Net$MB_N)*14*10*-1


# Litter Mut


Litter_LNS_1<-Litter_LNS %>% subset(Month %in% c(1))

Litter_LNS_12<-Litter_LNS %>% subset(Month %in% c(12))

Litter_LNS_Net<-data.frame(Litter_LNS_1, Litter_LNS_12)

Litter_LNS_Net$dLitterN<-(Litter_LNS_Net$N.1-Litter_LNS_Net$N)*-1


SOM_LNS_Net$dOrgN<-SOM_LNS_Net$dSOM+Litter_LNS_Net$dLitterN+SOM_LNS_Net$dMic


Bio_Cycle_LNS$N_MinST<-ifelse(Bio_Cycle_LNS$N_MinSUM < 0, 0, Bio_Cycle_LNS$N_MinSUM)


TimeSteps<-seq(1, 513, 1)

Bio_Cycle_LNS$TS<-TimeSteps
Abov_Flux_LNS$TS<-TimeSteps
Leaching_8_LNS$TS<-TimeSteps
Tree_Nut_LNS$TS<-TimeSteps
AEC_All_LNS$TS<-TimeSteps
SOM_LNS_Net$TS<-TimeSteps
SOM_Min_LNS$TS<-TimeSteps

N_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=N_UP-N_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(subset(SOM_LNS_Net, Year %in% Years), mapping=aes(x=TS, y=dOrgN, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=TS, y=NO3+NH4, color="Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange"))+
  theme_classic()+
  ggtitle("LN Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 15, 30, 45, 60, 75, 90), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

Abov_Temp_LNS<-subset(Abov_Flux_LNS, YEAR %in% Years)

Ca_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=(Ca_UP-Ca_LF)-Abov_Temp_LNS$Ca_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )


Mg_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=Mg_UP-Mg_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Mg, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),
        axis.title.x = element_text(size=12, face="bold", colour = "black"),
        axis.title.y = element_text(size=12, face="bold", colour = "black"), 
        axis.text.x = element_text(size=12, face="bold", colour = "black"),
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+ 
  scale_y_continuous(breaks=c(1,2,3,4, 5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

K_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=K_UP-K_LF-Abov_Temp_LNS$K_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=TS, y=K, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=K_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=K_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 10, 20, 30, 40), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 40))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

S_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=S_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=TS, y=SO4, color="Leaching"))+
  #geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=S_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+ 
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )



P_LNS<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=P_UP-P_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_LNS, YEAR %in% Years), mapping=aes(x=TS, y=P, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=P_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange", "black"))+
  ggtitle("LN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 1, 2, 3,4, 5), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  ) 

# HN SED

Bio_Cycle_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Abov_Flux.csv")

Leaching_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS<-Leaching_HNS %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/AEC_All.csv")

SOM_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/SOM.csv")

Manual_Minz<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Litter_Pool_Minz.csv")

SOM_Min_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/SOM_Min.csv")

Litter_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Litter_Pool.csv")

Bio_Cycle_HNS$N_MinST<-ifelse(Bio_Cycle_HNS$N_MinSUM < 0, 0, Bio_Cycle_HNS$N_MinSUM)

# SOM Mut

SOM_HNS<-SOM_HNS%>% group_by(Year, Month) %>% select(Year, Month, C, N, Ca, Mg, K, S, P, MB_N) %>% summarise(across(C:MB_N, ~sum(.x, na.rm=TRUE)))

SOM_HNS_1<-SOM_HNS %>% subset(Month %in% c(1))

SOM_HNS_12<-SOM_HNS %>% subset(Month %in% c(12))

SOM_HNS_Net<-data.frame(SOM_HNS_1, SOM_HNS_12)

SOM_HNS_Net$dSOMN<-(SOM_HNS_Net$N.1-SOM_HNS_Net$N)*14*10*-1

SOM_HNS_Net$dMic<-(SOM_HNS_Net$MB_N.1-SOM_HNS_Net$MB_N)*14*10*-1

# Litter Mut


Litter_HNS_1<-Litter_HNS %>% subset(Month %in% c(1))

Litter_HNS_12<-Litter_HNS %>% subset(Month %in% c(12))

Litter_HNS_Net<-data.frame(Litter_HNS_1, Litter_HNS_12)

Litter_HNS_Net$dLitterN<-(Litter_HNS_Net$N.1-Litter_HNS_Net$N)*-1


SOM_HNS_Net$dOrgN<-SOM_HNS_Net$dSOM+Litter_HNS_Net$dLitterN+SOM_HNS_Net$dMic

Bio_Cycle_HNS$TS<-TimeSteps
Abov_Flux_HNS$TS<-TimeSteps
Leaching_8_HNS$TS<-TimeSteps
Tree_Nut_HNS$TS<-TimeSteps
AEC_All_HNS$TS<-TimeSteps
SOM_HNS_Net$TS<-TimeSteps
SOM_Min_HNS$TS<-TimeSteps
Litter_HNS_Net$TS<-TimeSteps

Test_Flux<-Bio_Cycle_HNS$N_UP+Leaching_8_HNS$NO3+Leaching_8_HNS$NH4-Bio_Cycle_HNS$N_Minz

Abov_Temp_HNS<-subset(Abov_Flux_HNS, YEAR %in% Years)


N_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=TS, y=N_UP-N_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(subset(SOM_HNS_Net, Year %in% Years), mapping=aes(x=TS, y=dOrgN, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=TS, y=NO3+NH4, color="Leaching"))+
  geom_line()+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange"))+
  theme_classic()+
  ggtitle("HN Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 15, 30, 45, 60, 75, 90), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

Ca_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=TS, y=Ca_UP-Ca_LF-Abov_Temp_HNS$Ca_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Ca_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )


Mg_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=TS, y=Mg_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Mg, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+ 
  scale_y_continuous(breaks=c(1,2,3,4,5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

K_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=TS, y=K_UP-K_LF-Abov_Temp_HNS$K_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=TS, y=K, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=K_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=K_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 10, 20, 30, 40), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 40))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

S_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=TS, y=S_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=TS, y=SO4, color="Leaching"))+
  #geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=S_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "blacS"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),    
        axis.title.x = element_text(size=12, face="bold", colour = "black"),           
        axis.title.y = element_text(size=12, face="bold", colour = "black"),           
        axis.text.x = element_text(size=12, face="bold", colour = "black"),         
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )



P_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=TS, y=P_UP-P_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=TS, y=P, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=TS, y=P_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange", "black"))+
  ggtitle("HN Sedimentary")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 1, 2, 3,4, 5), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

# LN BAS

Bio_Cycle_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Abov_Flux.csv")

Leaching_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB<-Leaching_LNB %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/AEC_All.csv")

SOM_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/SOM.csv")

SOM_Min_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/SOM_Min.csv")

Litter_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Litter_Pool.csv")


SOM_LNB<-SOM_LNB%>% group_by(Year, Month) %>% select(Year, Month, C, N, Ca, Mg, K, S, P, MB_N) %>% summarise(across(C:MB_N, ~sum(.x, na.rm=TRUE)))

SOM_LNB_1<-SOM_LNB %>% subset(Month %in% c(1))

SOM_LNB_12<-SOM_LNB %>% subset(Month %in% c(12))

SOM_LNB_Net<-data.frame(SOM_LNB_1, SOM_LNB_12)

SOM_LNB_Net$dSOMN<-(SOM_LNB_Net$N.1-SOM_LNB_Net$N)*14*10*-1

SOM_LNB_Net$dMic<-(SOM_LNB_Net$MB_N.1-SOM_LNB_Net$MB_N)*14*10*-1


# Litter Mut


Litter_LNB_1<-Litter_LNB %>% subset(Month %in% c(1))

Litter_LNB_12<-Litter_LNB %>% subset(Month %in% c(12))

Litter_LNB_Net<-data.frame(Litter_LNB_1, Litter_LNB_12)

Litter_LNB_Net$dLitterN<-(Litter_LNB_Net$N.1-Litter_LNB_Net$N)*-1


SOM_LNB_Net$dOrgN<-SOM_LNB_Net$dSOM+Litter_LNB_Net$dLitterN+SOM_LNB_Net$dMic


Bio_Cycle_LNB$N_MinST<-ifelse(Bio_Cycle_LNB$N_MinSUM < 0, 0, Bio_Cycle_LNB$N_MinSUM)

Bio_Cycle_LNB$TS<-TimeSteps
Abov_Flux_LNB$TS<-TimeSteps
Leaching_8_LNB$TS<-TimeSteps
Tree_Nut_LNB$TS<-TimeSteps
AEC_All_LNB$TS<-TimeSteps
SOM_LNB$TS<-TimeSteps
SOM_Min_LNB$TS<-TimeSteps
SOM_LNB_Net$TS<-TimeSteps

Abov_Temp_LNB<-subset(Abov_Flux_LNB, YEAR %in% Years)

N_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=TS, y=N_UP-N_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(subset(SOM_LNB_Net, Year %in% Years), mapping=aes(x=TS, y=dOrgN, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=TS, y=NO3+NH4, color="Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange"))+
  theme_classic()+
  ggtitle("LN Basalt")+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 15, 30, 45, 60, 75, 90), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

Ca_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=TS, y=Ca_UP-Ca_LF-Abov_Temp_LNB$Ca_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )


Mg_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=TS, y=Mg_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Mg, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+ 
  scale_y_continuous(breaks=c(1,2,3,4,5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

K_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=TS, y=K_UP-K_LF-Abov_Temp_LNB$K_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=TS, y=K, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=K_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=K_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 10, 20, 30, 40), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 40))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

S_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=TS, y=S_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=TS, y=SO4, color="Leaching"))+
  #geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=S_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "blacS"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),            
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+ 
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )



P_LNB<-ggplot(subset(Bio_Cycle_LNB, YEAR %in% Years), aes(x=TS, y=P_UP-P_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_LNB, YEAR %in% Years), mapping=aes(x=TS, y=P, color="Leaching"))+
  geom_line(subset(Abov_Flux_LNB, YEAR %in% Years), mapping=aes(x=TS, y=P_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange", "black"))+
  ggtitle("LN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 1, 2, 3,4, 5), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

# HN BAS

Bio_Cycle_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Abov_Flux.csv")

Leaching_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB<-Leaching_HNB %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/AEC_All.csv")

SOM_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/SOM.csv")

SOM_Min_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/SOM_Min.csv")

Litter_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Litter_Pool.csv")

Bio_Cycle_HNB$N_MinST<-ifelse(Bio_Cycle_HNB$N_MinSUM < 0, 0, Bio_Cycle_HNB$N_MinSUM)

SOM_HNB<-SOM_HNB%>% group_by(Year, Month) %>% select(Year, Month, C, N, Ca, Mg, K, S, P, MB_N) %>% summarise(across(C:MB_N, ~sum(.x, na.rm=TRUE)))

SOM_HNB_1<-SOM_HNB %>% subset(Month %in% c(1))

SOM_HNB_12<-SOM_HNB %>% subset(Month %in% c(12))

SOM_HNB_Net<-data.frame(SOM_HNB_1, SOM_HNB_12)

SOM_HNB_Net$dSOMN<-(SOM_HNB_Net$N.1-SOM_HNB_Net$N)*14*10*-1

SOM_HNB_Net$dMic<-(SOM_HNB_Net$MB_N.1-SOM_HNB_Net$MB_N)*14*10*-1


# Litter Mut


Litter_HNB_1<-Litter_HNB %>% subset(Month %in% c(1))

Litter_HNB_12<-Litter_HNB %>% subset(Month %in% c(12))

Litter_HNB_Net<-data.frame(Litter_HNB_1, Litter_HNB_12)

Litter_HNB_Net$dLitterN<-(Litter_HNB_Net$N.1-Litter_HNB_Net$N)*-1


SOM_HNB_Net$dOrgN<-SOM_HNB_Net$dSOM+Litter_HNB_Net$dLitterN+SOM_HNB_Net$dMic



Bio_Cycle_HNB$TS<-TimeSteps
Abov_Flux_HNB$TS<-TimeSteps
Leaching_8_HNB$TS<-TimeSteps
Tree_Nut_HNB$TS<-TimeSteps
AEC_All_HNB$TS<-TimeSteps
SOM_HNB$TS<-TimeSteps
SOM_Min_HNB$TS<-TimeSteps
SOM_HNB_Net$TS<-TimeSteps

Abov_Temp_HNB<-subset(Abov_Flux_HNB, YEAR %in% Years)

N_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=TS, y=N_UP-N_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(subset(SOM_HNB_Net, Year %in% Years), mapping=aes(x=TS, y=dOrgN, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=TS, y=NO3+NH4, color="Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange"))+
  theme_classic()+
  ggtitle("HN Basalt")+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 15, 30, 45, 60, 75, 90), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 80))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

Ca_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=TS, y=Ca_UP-Ca_LF-Abov_Temp_HNB$Ca_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Ca_LF, color="Litterfall"))+
  geom_line(aes(y=Ca_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Ca_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 20))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

Mg_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=TS, y=Mg_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=Mg_LF, color="Litterfall"))+
  geom_line(aes(y=Mg_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Mg, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=Mg_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),         
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+ 
  scale_y_continuous(breaks=c(1,2,3,4,5))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )

K_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=TS, y=K_UP-K_LF-Abov_Temp_HNB$K_THRU, color="Net Increment"))+geom_line()+
  geom_line(aes(y=K_LF, color="Litterfall"))+
  geom_line(aes(y=K_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=K_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=TS, y=K, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=K_WTH, color="Weathering"))+
  geom_line(subset(Abov_Flux_LNS, YEAR %in% Years), mapping=aes(x=TS, y=K_THRU, color="Foliar Leaching"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "green4","purple","green","orange", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 10, 20, 30, 40), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 40))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )


S_HNB<-ggplot(subset(Bio_Cycle_HNB, YEAR %in% Years), aes(x=TS, y=S_UP, color="Net Increment"))+geom_line()+
  geom_line(aes(y=S_LF, color="Litterfall"))+
  geom_line(aes(y=S_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=S_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=TS, y=SO4, color="Leaching"))+
  #geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=S_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Srocess")+
  scale_color_manual(values = c("red", "green", "blue", "orange", "purple", "blacS"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),            
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"))+
  scale_y_continuous(breaks=c(2, 4, 6, 8, 10))+
  coord_cartesian(ylim = c(0, 10))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )



P_HNB<-ggplot(subset(Bio_Cycle_LNS, YEAR %in% Years), aes(x=TS, y=P_UP-P_LF, color="Net Increment"))+geom_line()+
  geom_line(aes(y=P_LF, color="Litterfall"))+
  geom_line(aes(y=P_Minz, color="\u0394 OM"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=1, color="Deposition"))+
  geom_line(subset(Leaching_8_HNB, YEAR %in% Years), mapping=aes(x=TS, y=P, color="Leaching"))+
  geom_line(subset(Abov_Flux_HNB, YEAR %in% Years), mapping=aes(x=TS, y=P_WTH, color="Weathering"))+
  labs(y=NULL, x=NULL, color="Process")+
  scale_color_manual(values = c("red", "blue", "purple","green", "orange", "black"))+
  ggtitle("HN Basalt")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size=20, face="bold", color="black"),        
        axis.title.x = element_text(size=12, face="bold", colour = "black"),             
        axis.title.y = element_text(size=12, face="bold", colour = "black"),             
        axis.text.x = element_text(size=12, face="bold", colour = "black"),          
        axis.text.y = element_text(size=12,  colour = "black", face="bold"),
        legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=20),
        plot.margin = unit(c(1.5, 1.5, 1.5, 1.5), "lines"))+ 
  scale_y_continuous(breaks=c(0, 1, 2, 3,4, 5), expand = expansion(mult = c(0, 0)))+
  scale_x_continuous(expand = expansion(mult = c(0, 0)), limits=c(0, 100))+
  coord_cartesian(ylim = c(0, 5))+
  geom_segment(
    x = 60, y = 80,
    xend =60, yend = 0,
    lineend = "round", # See available arrow types in example above
    linejoin = "round",
    size = 1, 
    arrow = arrow(length = unit(0.15, "inches"), type = "closed"),
    colour = "black" # Also accepts "red", "blue' etc
  )



setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_BO")


ggarrange(N_LNS, N_HNS, N_LNB, N_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("N Fluxes ( kg"~'⋅'~ha^{-1}~'⋅'~yr^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,fontsize=15,
                                                                                                                          font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3,fontsize=15)), top=textGrob("80 BO")) %>% 
  ggexport(filename="N.png", height=1000, width=1250, res=100)


ggarrange(Ca_LNS, Ca_HNS, Ca_LNB, Ca_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("Ca Fluxes ( kg"~'⋅'~ha^{-1}~'⋅'~yr^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3 ,fontsize=15,
                                                                                                                           font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3,fontsize=15)), top=textGrob("80 BO")) %>% 
  ggexport(filename="Ca.png", height=1000, width=1250, res=100)

ggarrange(Mg_LNS, Mg_HNS, Mg_LNB, Mg_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1) %>%
  annotate_figure(left = textGrob(expression("Mg Fluxes ( kg"~'⋅'~ha^{-1}~'⋅'~yr^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,fontsize=15,
                                                                                                                           font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3,fontsize=15)), top=textGrob("80 BO")) %>% 
  ggexport(filename="Mg.png", height=1000, width=1250, res=100)

ggarrange(K_LNS, K_HNS, K_LNB, K_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("K Fluxes ( kg"~'⋅'~ha^{-1}~'⋅'~yr^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,fontsize=15,
                                                                                                                          font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3,fontsize=15)), top=textGrob("80 BO")) %>% 
  ggexport(filename="K.png", height=1000, width=1250, res=100)

ggarrange(P_LNS, P_HNS, P_LNB, P_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  annotate_figure(left = textGrob(expression("P Fluxes ( kg"~'⋅'~ha^{-1}~'⋅'~yr^{-1}~')'), rot = 90, vjust=.45, gp = gpar(cex = 1.3,fontsize=15,
                                                                                                                          font.label = list(size = 14, color = "black", face = "bold"))),
                  bottom = textGrob("Time Step (Year)", gp = gpar(cex = 1.3,fontsize=15)), top=textGrob("80 BO")) %>% 
  ggexport(filename="P.png", height=1000, width=1250, res=100)

ggarrange(S_LNS, S_HNS, S_LNB, S_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="S.png", height=1000, width=1250, res=100)