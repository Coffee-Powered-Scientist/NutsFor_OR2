  
  library(dplyr)
  library(ggplot2)
  
  x<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Analysis_1.csv", header=TRUE)
  Cal_Pretable_Parent<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
  Cal_Pretable_LL<-Cal_Pretable_Parent %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
  Cal_Pretable_LL$group_id<-as.character(Cal_Pretable_LL$group_id)
  
  Leaching<-Tab_Func_LL_Yr(Cal_Pretable_LL)
  Leaching_Table_1m<-Leaching %>% filter(group_id %in% c(8))
                                         
  BOUND<- cbind(Leaching_Table_1m, x)                                       
  
  Analysis_1<-BOUND %>% group_by(V1) %>% 
    mutate(Ca_Net=Ca_Wet+Ca_WTH+Ca_L_Min+Ca_SOM_Min-Ca_TU-Ca) %>%
    mutate(Mg_Net=Mg_Wet+Mg_WTH+Mg_L_Min+Mg_SOM_Min-Mg_TU-Mg) %>% 
    mutate(K_Net=K_Wet+K_WTH+K_L_Min+K_SOM_Min-K_TU-K+K_Folx) %>%
    mutate(SO4_Net=SO4_Wet+ S_L_Min+S_SOM_Min-S_TU-SO4) %>%
    mutate(N_Net=Ntot_Wet+ N_L_Min+N_SOM_Min-N_TU-SO4) %>%
    mutate(P_Net=P_WTH+ P_L_Min+P_SOM_Min-P_TU-P)


  Analysis_I_Grapher<-function (x) {
    ggplot(Analysis_1, aes(x=Year, y=x))+geom_line()
  }
  
  Analysis_I_Grapher(Analysis_1$P_Net)
  