
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Manuscript/Images/LN_SED/40_BO")

library(dplyr)

# SOM Files: In mol/m2

Files<- list.files("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Output data/SOM",
                   pattern = "SOM", full.names = TRUE)


SOM<-sapply(Files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")

Headers<-c("ID", "Year", "Month", "C_SOM", "N_SOM", "Ca_SOM", "Mg_SOM", "K_SOM", "S_SOM", "P_SOM", 
           "Delete", "Delete", "Delete", "Delete", "Delete", "Delete", "Delete",
           "MB_C", "MB_N", "MB_Ca", "MB_Mg", "MB_K", "MB_S", "MB_P")

SOM[c(2:25)]<-lapply(SOM[c(2:25)], as.numeric)

SOM<-SOM[-c(25)]

SOM<-na.omit(SOM)

colnames(SOM) = Headers

SOM <- SOM %>% select(-contains("Delete"))

SOM$group_id <- SOM %>% 
  group_by(ID)%>%
  group_indices(ID)


SOM_Initial<-subset(SOM, Year == 2005 & Month ==1)

SOM_Final<-SOM_Initial %>% summarise(across(C_SOM:MB_P, ~sum(.x, na.rm=TRUE)))


SOM_Final<-SOM_Final %>% mutate(C_SOM = (C_SOM+MB_C)*10*12.01, N_SOM = (N_SOM+MB_N)*10*14.0067, Ca_SOM = (Ca_SOM+MB_Ca)*40.078*10, 
                     Mg_SOM = (Mg_SOM+MB_Mg)*24.305*10 , K_SOM = (K_SOM+MB_K)*39.0983*10 ,
                     S_SOM = (S_SOM+MB_S)*32.065*10, P_SOM = (P_SOM+MB_P)*30.974*10)


# CEC 

files <- list.files(path = "~/NutsforSEDLN/40_BO/Output data/CEC", pattern = "CEC", full.names = TRUE)

CEC_All<- sapply(files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")

CEC_All[c(2:16)]<-lapply(CEC_All[c(2:16)], as.numeric)


CEC_All<-CEC_All[-c(4:10)]

CEC_Headers <-c("id", "Year", "Month", "Ca", "Mg", "K", "Na", "NH4", "Al")

colnames(CEC_All) = CEC_Headers

CEC_All<-na.omit(CEC_All)

CEC_All$group_id <- CEC_All %>% 
  group_by(id)%>%
  group_indices(id)

CEC_All <- subset(CEC_All, Year == 2005 & Month == 1)

CEC_Final<-CEC_All %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE)))

# AEC

# Make sure to check kg/ha units (as P or PO4, S or SO4)

AEC_Files <- list.files(path = "~/NutsforSEDLN/40_BO/Output data/AEC", pattern = "AEC", full.names = TRUE)

AEC_All<- sapply(AEC_Files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")

AEC_All<-AEC_All[-c(4:6)]

AEC_Headers<-c("id", "Year", "Month", "S", "P", "Cl")

AEC_All[c(2:6)]<-lapply(AEC_All[c(2:6)], as.numeric)

AEC_All<-na.omit(AEC_All)

colnames(AEC_All) = AEC_Headers

AEC_Final <- subset(AEC_All, Year == 2005 & Month ==1) %>% summarise(across(S:Cl, ~sum(.x, na.rm=TRUE)))

# Litter 

Litter<-read.csv2("~/NutsforSEDLN/40_BO/Output data/Litter/Litter pool kg_ha data.csv")

Litter_Headers<-c("Year", "Month", "C", "N", "Ca", "Mg", "K", "S", "P")

Litter<-Litter[-c(10:38)]

colnames(Litter) = Litter_Headers

Litter[c(1:9)]<-lapply(Litter[c(1:9)], as.numeric)

Litter<-na.omit(Litter)

Litter<-subset(Litter, Year == 2005 & Month ==1)

Litter[c(3:9)]<-lapply(Litter[c(3:9)], as.numeric)


# Initial Soil Table

Ca = Litter$Ca+CEC_Final$Ca+SOM_Final$Ca_SOM
Mg = Litter$Mg+CEC_Final$Mg+SOM_Final$Mg_SOM
K= Litter$K+CEC_Final$K+SOM_Final$K_SOM
N=Litter$N+CEC_Final$NH4+SOM_Final$N_SOM 
P = Litter$P+AEC_Final$P+SOM_Final$P_SOM
S= Litter$S+AEC_Final$S+SOM_Final$S_SOM
C = Litter$C+SOM_Final$C_SOM

Initial_Tbl<-cbind(Ca, Mg, K, N, P, S, C)

write.csv(Initial_Tbl, "Initial_Nutrients.csv")

