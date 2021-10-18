
# Manually calculate net annual mineralization

rm(list = ls())

library(dplyr)
library(ggplot2)


setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data")


# litter 
Litter_Pre<-read.csv2("~/NutsForSEDHN/40_BO/Output data/Litter/Litter pool kg_ha data.csv")


Litter_N<-Litter_Pre %>% rename("Year"=X, "Month"=X.1, "N"=X.2, "Ca"=X.3, "Mg"=X.4, "K"=X.5, "S"=X.6, "P"=X.7) %>% select(Year, Month, N, Ca, Mg, K, S, P)


Litter_N<-Litter_N %>% mutate_if(is.character,as.numeric)

Litter_Final<-Litter_N[-c(38) ]

Litter_Final<-na.omit(Litter_Final)

L1<-Litter_Final %>% group_by(Year) %>% filter(Month %in% 1)

L12<-Litter_Final %>% group_by(Year) %>% filter(Month %in% 12)


Net_N_Minz<-L1-L12

# SOM

SOM_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/SOM.csv")

SOM_SUM<-SOM_HNS %>% group_by(Year, Month) %>% select(-Date) %>% summarise(across(C:MB_N, ~sum(.x, na.rm=TRUE)))

SOM1<-SOM_SUM %>% group_by(Year, Month) %>% filter(Month %in% 1)


SOM12<-SOM_SUM %>% group_by(Year, Month) %>% filter(Month %in% 12)


Net_Min<-(SOM1$N-SOM12$N)*14*10

Net_Min_Mb<-(SOM1$MB_N-SOM12$MB_N)*14*10


Bjormp<-Net_N_Minz$N+Net_Min+Net_Min_Mb

#Check

Yearz<-seq(2005, 2529, 1)

Bormp<-cbind(Bjormp, Yearz)

X<-as.data.frame(Bormp)

#X$Bjormp<-ifelse(X$Bjormp< 0, 0, X$Bjormp)



write.csv2(Net_N_Minz, "Litter_Pool_Minz.csv")
# BEEMP

Years<-seq(2005, 2105, 1)

Bio_Cycle_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Bio_Cycle.csv")

Abov_Flux_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Abov_Flux.csv")

Leaching_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS<-Leaching_HNS %>% subset(group_id %in% 8) %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/AEC_All.csv")

SOM_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/SOM.csv")

Manual_Minz<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Litter_Pool_Minz.csv")

Bio_Cycle_HNS$N_MinST<-ifelse(Bio_Cycle_HNS$N_MinSUM < 0, 0, Bio_Cycle_HNS$N_MinSUM)


J<-Bio_Cycle_HNS$N_Minz-Leaching_8_HNS$NO3-Bio_Cycle_HNS$N_UP+Abov_Flux_HNS$N_WET+Bio_Cycle_HNS$N_LF

XX_1<-X$Bjormp+Leaching_8_HNS$NO3-Bio_Cycle_HNS$N_UP

Z<-Bio_Cycle_HNS$N_Minz-Leaching_8_HNS$NO3-Bio_Cycle_HNS$N_UP

Test_Min<-Bio_Cycle_HNS$N_Minz-X$Bjormp

Inter<-Test_Min-Leaching_8_HNS$NO3-Bio_Cycle_HNS$N_UP+Abov_Flux_HNS$N_WET

N_HNS<-ggplot(subset(Bio_Cycle_HNS, YEAR %in% Years), aes(x=YEAR, y=N_UP, color="Uptake"))+geom_line()+
  geom_line(aes(y=N_LF, color="Litterfall"))+
  geom_line(aes(y=N_Minz, color="Mineralization"))+
  geom_line(subset(Abov_Flux_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=N_WET, color="Deposition"))+
  geom_line(subset(Leaching_8_HNS, YEAR %in% Years), mapping=aes(x=YEAR, y=NO3+NH4, color="Leached"))+
  geom_line(subset(X, Yearz %in% Years), mapping=aes(x=Years, y=Bjormp, color="TRUE_MINZ"))+
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


ggplot(X, aes(x=Years, y=Bjormp))+geom_line()


write.csv(Net_Min_Mb, "SOM_Min_Manual2.csv")
write.csv(Leaching_8_HNS, "L8_Manual.csv")
write.csv2(Net_N_Minz, "Litter_Pool_Minz.csv")