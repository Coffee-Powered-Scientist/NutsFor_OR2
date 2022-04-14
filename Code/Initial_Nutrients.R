
library(dpylr)

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


SOM_Initial %>% mutate(Ca = (Ca_SOM+MB_Ca)*)