#This Script Prepares Edited Data for direct report/manuscript calibration

library(dplyr)

#For Soil solution (SS)
Tab_Func_SS_Yr<-function(x){
  x %>% group_by(group_id, YEAR) %>% summarise(across(Ca:HR, ~ mean(.x, na.rm = TRUE))) %>%
  filter(group_id %in% c(10, 11, 12, 13, 14, 15, 16, 17))
   
  
}

Tab_Func_SS_Reliable<-function(x){
  x %>% group_by(group_id, Month) %>% 
      filter(YEAR>=2007) %>%
        filter(group_id %in% c(10, 11, 12, 13, 14, 15, 16, 17)) %>%
            filter(Month %in% c(1, 2, 3, 4, 5, 11, 12)) %>%
            summarise(across(Ca:HR, ~mean(.x, na.rm=TRUE)))
  
}

#For weathering (W)
Tab_Func_W_Yr<-function(x){
  x %>% group_by(YEAR) %>% summarise(across(Ca:P, ~ sum(.x, na.rm = TRUE)))
  
  
}


#Not really needed to be honest
Tab_Func_SOM_Yr<-function(x) {
  x %>% group_by(YEAR, group_id, Month) %>%
    rename(C= C.mol.m²) %>% rename(N= N.mol.m²) %>%rename(Ca= Ca.mol.m²) %>% rename(Mg= Mg.mol.m²) %>%
    rename(K= K.mol.m²) %>% rename(S= S.mol.m²) %>%
    rename(P= P.mol.m²) %>% rename(Year=YEAR) %>%
    select(C, N, Ca, Mg, K, S, Date)
    
  
}