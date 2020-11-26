#This Script Prepares Edited Data for direct report/manuscript calibration

library(dplyr)

#For Soil solution (SS)
Tab_Func_SS_Yr<-function(x){
  x %>% group_by(group_id, YEAR) %>% summarise(across(Ca:HR, ~ mean(.x, na.rm = TRUE))) %>%
  filter(group_id %in% c(10, 11, 12, 13, 14, 15, 16, 17))
   
  
}

Tab_Func_SS_Reliable<-function(x){
  x %>% group_by(group_id, Month) %>% 
      filter(YEAR<2007) %>%
        filter(group_id %in% c(10, 11, 12, 13, 14, 15, 16, 17)) %>%
            filter(Month %in% c(1, 2, 3, 4, 11, 12)) %>%
            summarise(across(where(is.numeric), ~mean(.x, na.rm=TRUE))) %>%select(-YEAR)
  
}

#For weathering (W)
Tab_Func_W_Yr<-function(x){
  x %>% group_by(YEAR) %>% summarise(across(Ca:P, ~ sum(.x, na.rm = TRUE)))
  
  
}

#For Leaching Layers
Tab_Func_LL_Yr<-function(x){
  x %>% group_by(YEAR, group_id) %>% summarise(across(Ca:HR, ~ sum(.x, na.rm = TRUE)))
  
  
}

#Litterfall
Tab_Func_LF_Yr<-function(x){
  x %>% group_by(Date) %>% summarise(across(Dry.weight:P, ~ sum(.x, na.rm = TRUE)))
  
  
}

