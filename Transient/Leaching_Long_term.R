#Look at Leaching of everything over time to identify causes of cation accelerated leaching

library(dplyr)
library(ggplot2)

source("~/Project_Master/Test_Rep/Code/HN_SED/Base/Soil_Soln_Mutator.R")

Cal_Pretable_Parent<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Sens/Soil_Solution_All2.csv", header=TRUE)

Cal_Pretable_LL_Shallow<-Cal_Pretable_Parent %>% filter(group_id %in% c("2"))
Cal_Pretable_LL_Shallow$group_id<-as.character(Cal_Pretable_LL$group_id)


BEEMP<-Cal_Pretable_LL_Shallow %>% group_by(YEAR) %>% summarize(across(Ca:Si, ~sum(.x, na.rm = TRUE)))




ggplot(BEEMP, aes(x=YEAR, y=Ca, color="Ca"))+geom_line()+
  geom_line(aes(y=NO3, color="NO3"))+
  geom_line(aes(y=Al*10, color="Al"))+
  geom_line(aes(y=K, color="K"))+
  geom_line(aes(y=DOC, color="DOC"))+
  geom_line(aes(y=Mg, color="Mg"))+
  geom_line(aes(y=P, color="P"))
  


Cal_Pretable_LL_Deep<-Cal_Pretable_Parent %>% filter(group_id %in% c("8"))
Cal_Pretable_LL_Deep$group_id<-as.character(Cal_Pretable_LL$group_id)


BEEMP2<-Cal_Pretable_LL_Deep %>% group_by(YEAR) %>% summarize(across(Ca:Si, ~sum(.x, na.rm = TRUE)))

ggplot(BEEMP2, aes(x=YEAR, y=Ca, color="Ca"))+geom_line()+
  geom_line(aes(y=NO3, color="NO3"))+
  geom_line(aes(y=Al*10, color="Al"))+
  geom_line(aes(y=DOC, color="DOC"))+
  geom_line(aes(y=K, color="K"))+
  geom_line(aes(y=Mg, color="Mg"))+
  geom_line(aes(y=P, color="P"))





