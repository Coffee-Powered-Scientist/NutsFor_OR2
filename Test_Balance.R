

Test_SOM<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/SOM.csv")


Litter<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Litter_Pool.csv")

Tree_Nut<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

Abov<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Abov_Flux.csv")


Soil_SOLN<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Tree_UP<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Bio_Cycle.csv")

CEC<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/CEC_All.csv")

# CEC

CEC<-CEC %>% group_by(Date) %>%  summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE)))

dates <- strptime(as.character(CEC$Date),format="%Y-%m-%d")
CEC$Year <- format(dates, "%Y")
CEC$Month <- format(dates, "%m")

CEC_1<-CEC %>% subset(Month %in% c("01"))

CEC_12<-CEC %>% subset(Month %in% c("12"))

dCEC<-CEC_12$NH4-CEC_1$NH4

# Total Leached

Soil_SOLN<-Soil_SOLN %>% subset(group_id %in% c(8)) %>% group_by(YEAR) %>% summarise(across(Ca:NH4, ~sum(.x, na.rm=TRUE)))

Soil_SOLN$N_L<-Soil_SOLN$NO3+Soil_SOLN$NH4

# Total Deposited



# delta Litter pool

Litter<-Litter %>% group_by(YEAR)

Litter_1<-Litter %>% subset (Month %in% c(1))

Litter_12<-Litter %>% subset (Month %in% c(12))

dLitter<-(Litter_12$N-Litter_1$N)



# delta Tree

Tree_Nut$Tot_N<-Tree_Nut$N_F+Tree_Nut$N_Bol+Tree_Nut$N_Brk+Tree_Nut$N_Brh

Tree_1<-Tree_Nut %>% subset(Month %in% c(1))

Tree_12<-Tree_Nut %>% subset(Month %in% c(12))

dTreeN<-Tree_12$Tot_N-Tree_1$Tot_N


# delta SOM

Test_SOM<-SOM_Mut %>% group_by(Year, Month) %>% select(Year, Month, C, N, Ca, Mg, K, S, P, MB_N) %>% summarise(across(C:MB_N, ~sum(.x, na.rm=TRUE)))

Test_SOM$Month<-as.numeric(Test_SOM$Month)

Test_SOM_1<-Test_SOM %>% subset (Month %in% c(1))

Test_SOM_12<-Test_SOM %>% subset (Month %in% c(12))


dSOM<-(Test_SOM_12$N-Test_SOM_1$N)*14*10

dMic<-(Test_SOM_12$MB_N-Test_SOM_1$MB_N)*14*10
# total stock change


dStock<--1*(dSOM+dLitter+dMic+dCEC)-(Tree_UP$N_UP-Tree_UP$N_LF)

dStock2<-Abov$N_WET-Soil_SOLN$N_L


Balance<-dStock+dStock2

J<-mean(Soil_SOLN$N_L)

ggplot(Soil_SOLN, aes(x=YEAR, y=N_L))+geom_line()+
  geom_hline(yintercept=J)
