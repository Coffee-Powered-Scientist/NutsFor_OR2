
#libraries

library(dplyr)

#source


#read data files

setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data")

# For Equation 1

SOM_Monthly<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/SOM.csv")
LitP_Monthly<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Litter_Pool.csv")
BioCycle_An<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Bio_Cycle.csv")


# For equation 2

Harvest_Years<-c(2025, 2067, 2109, 2151, 2193, 2235, 2277, 2319, 2361, 2403, 2445, 2487)

Soil_Soln<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")
Tree_Nut_All<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")
Abov_Flux<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Abov_Flux.csv")


# Mutate SOM file
SOM_Monthly$Date<-NULL

SOM_Annual<-SOM_Monthly %>% subset(Month %in% c(1,12)) %>%
                group_by(Year,Month) %>%
                summarise(across(C:MB_N, ~sum(.x, na.rm = TRUE)))

SOM_Ann_1<-SOM_Annual %>% subset(Month %in% 1)

SOM_Ann_12<-SOM_Annual %>% subset(Month %in% 12)

dSOM<-SOM_Ann_12-SOM_Ann_1 #Stores all change in pool size for all nutrients in SOM and microbial storage

# Mutate Litter Pool file

LitP_Annual<-LitP_Monthly %>% subset(Month %in% c(1,12)) %>%
  group_by(YEAR, Month) %>%
  select(YEAR:P) %>% 
  summarise(across(C:P, ~sum(.x, na.rm = TRUE)))

LitP_Ann_1<-LitP_Annual %>% subset(Month %in% 1)

LitP_Ann_12<-LitP_Annual %>% subset(Month %in% 12)

dLitter<-LitP_Ann_12-LitP_Ann_1 #Stores all change in pool size for all nutrients in the litter pool (Coarse, fine, humus)


#Mutate Bio_Cycle

Bio_Cycle<-BioCycle_An %>% select(YEAR:P_LF)

Bio_Cycle$dBioN<-Bio_Cycle$N_UP#-Bio_Cycle$N_LF
Bio_Cycle$dBioCa<-Bio_Cycle$Ca_UP-Bio_Cycle$Ca_LF
Bio_Cycle$dBioMg<-Bio_Cycle$Mg_UP-Bio_Cycle$Mg_LF
Bio_Cycle$dBioK<-Bio_Cycle$K_UP-Bio_Cycle$K_LF
Bio_Cycle$dBioS<-Bio_Cycle$S_UP-Bio_Cycle$S_LF
Bio_Cycle$dBioP<-Bio_Cycle$P_UP-Bio_Cycle$P_LF

Bio_Cycle<-Bio_Cycle %>% select(dBioN:dBioP)

Tree_Nut_All

# Solve Equation 1 per year

#dSom-dMB-dL+dCEC+dBiomass

#note, change Dbiomass to be the difference between Jan and December tota above ground nutrient storage instead of what it is currently

dStockN1<-dSOM$N+dSOM$MB_N+dLitter$N+Bio_Cycle$dBioN

sum(dStockN1)


# Prepare equation 2

#Atm-Leached-Harvested (cumulative because of harvest time steps)

# Mutate Tree Nutrients

Tree_Nut_All$P_Brh<-as.numeric(Tree_Nut_All$P_Brh)

Tree_Nut_All$N<-Tree_Nut_All$N_F+Tree_Nut_All$N_Brk+Tree_Nut_All$N_Brh+Tree_Nut_All$N_Bol
Tree_Nut_All$Ca<-Tree_Nut_All$Ca_F+Tree_Nut_All$Ca_Brk+Tree_Nut_All$Ca_Brh+Tree_Nut_All$Ca_Bol
Tree_Nut_All$Mg<-Tree_Nut_All$Mg_F+Tree_Nut_All$Mg_Brk+Tree_Nut_All$Mg_Brh+Tree_Nut_All$Mg_Bol
Tree_Nut_All$K<-Tree_Nut_All$K_F+Tree_Nut_All$K_Brk+Tree_Nut_All$K_Brh+Tree_Nut_All$K_Bol
Tree_Nut_All$S<-Tree_Nut_All$S_F+Tree_Nut_All$S_Brk+Tree_Nut_All$S_Brh+Tree_Nut_All$S_Bol
Tree_Nut_All$P<-Tree_Nut_All$P_F+Tree_Nut_All$P_Brk+Tree_Nut_All$P_Brh+Tree_Nut_All$P_Bol

Exported<-Tree_Nut_All %>% subset(Month %in% c(8) & YEAR %in% Harvest_Years) %>%
    select(N:P) %>%
      summarize(across(N:P, ~sum(.x, na.rm=TRUE)))

# Mutate atmospheric deposition

Abov_Flux$X.2<-NULL
Abov_Flux$X.3<-NULL

Abov_Flux<-Abov_Flux %>% select(YEAR:S_WET, Ca_THRU:K_THRU) %>% summarize(across(Ca_WET:K_THRU, ~sum(.x, na.rm =TRUE)))

# Mutate Soil Solution 

Leaching<-Soil_Soln %>% subset(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))



#Solve Equation 2 cumulatively


dStockN2<-Abov_Flux$N_WET-Leaching$NO3+Leaching$NH4-Exported$N

