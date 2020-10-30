#This Script Prepares Edited Data for direct report/manuscript calibration

library(dplyr)

Tab_Func_SS<-function(x){
  x %>% group_by(group_id, YEAR) %>% summarise(across(Ca:HR, ~ mean(.x, na.rm = TRUE))) %>%
  filter(group_id %in% c(10, 11, 12, 13, 14, 15, 16, 17))
   
  
}

