rm(list = ls())

library(dpylr)

setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data")


Above_Flux<-read.csv2("~/NutsForSEDHN/40_WTH/Output data/Budgets/Above ground fluxes.csv", header=FALSE)
Bio_Flux<-read.csv2("~/NutsForSEDHN/40_WTH/Output data/Budgets/Biological cycle.csv",header=FALSE)

Bio_Flux<-Bio_Flux %>% rename(Year=V1, N_TU=V2, Ca_TU=V3, Mg_TU=V4, K_TU=V5, S_TU=V6, P_TU=V7, 
                   N_LF=V8, Ca_LF=V9, Mg_LF=V10, K_LF=V11, S_LF=V12, P_LF=V13,
                   N_L_Min=V14, Ca_L_Min=V15, Mg_L_Min=V16, K_L_Min=V17, S_L_Min=V18, P_L_Min=V19,
                   N_SOM_Min=V20, Ca_SOM_Min=V21, Mg_SOM_Min=V22, K_SOM_Min=V23, S_SOM_Min=V24, P_SOM_Min=V25)

Above_Flux<-Above_Flux  %>% rename(Ca_Wet=V2, Mg_Wet=V3, K_Wet=V4, NO3_Wet=V5, NH4_Wet=V6, Ntot_Wet=V7, 
                       SO4_Wet=V8, Na_Wet=V9, Cl_Wet=V10, Al_Wet=V11, Ca_Folx=V42, Mg_Folx=V43, K_Folx=V44, NO3_Folx=V45, NH4_Folx=V46, Ntot_Folx=V47, 
                       SO4_Folx=V48, Na_Folx=V49, Cl_Folx=V50, Ca_WTH=V72, Mg_WTH=V73, K_WTH=V74, Na_WTH=V75, Al_WTH=V76, P_WTH=V78, Si_Wet=V77)

All_Flux<-cbind(Above_Flux, Bio_Flux)

All_Flux[2:104]<-lapply(All_Flux[2:104], as.numeric)

All_Flux<-All_Flux %>% drop_na(Ca_Wet)

All_Flux<-All_Flux %>% select(-c(11:43,51:71 ))

write.csv2(All_Flux, "Analysis_1.csv")