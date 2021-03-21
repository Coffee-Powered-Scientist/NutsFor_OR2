
#Generates manuscript ready tables
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Manuscript/Images/LN_SED/Base")

library(kableExtra)
library(dplyr)

# LN_SED/Base Simulated Lysimeter

Cal_Pretable_Parent<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_SS<-Cal_Pretable_Parent %>% filter(group_id %in% c("10", "11", "12", "13", "14", "15", "16", "17"))
Cal_Pretable_SS$group_id<-as.character(Cal_Pretable_SS$group_id)
Cal_Pretable_SS$Date<-as.Date(Cal_Pretable_SS$Date)


#Kg/ha
Cal_Pretable_LL<-Cal_Pretable_Parent %>% filter(group_id %in% c("1", "2", "3", "4", "5", "6", "7", "8"))
Cal_Pretable_LL$group_id<-as.character(Cal_Pretable_LL$group_id)


Sim_Lysimeter_Flux<-Cal_Pretable_LL %>% filter(group_id %in% c("2", "8")) %>% group_by(group_id, YEAR) %>% summarise(across(Ca:HR, ~sum(.x, na.rm=TRUE))) %>% select(-H, -pH, -R, -HR) %>% filter (YEAR %in% c("2005", "2006")) %>% rename(Depth="group_id")


Sim_Lys_Tab<-Sim_Lysimeter_Flux %>% mutate_if(is.numeric, format, digits=2, nsmall= 0) %>%
  kbl(caption = "Simulated Lysimeter Fluxes by Depth (2005-2006)", format="latex", booktabs=TRUE, escape=FALSE, align="c") %>% t(.) %>% kable_styling(latex_options = c("striped", "scale_down", "HOLD_position")) %>% 
  kable_styling(font_size = 12) %>% kable_classic(full_width = F, html_font = "Times") %>% add_header_above(c(" "=2,  "kg/ha"=12)) %>%  save_kable(file="test.pdf")