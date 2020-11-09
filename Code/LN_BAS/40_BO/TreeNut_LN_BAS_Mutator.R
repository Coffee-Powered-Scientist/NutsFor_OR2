rm(list = ls())
#Set wd to edited data in mutator files; that way writecsv always deposits it in one place
setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data")

library(dplyr)
library(janitor)
library(lubridate)

#Maybe have a function script-maybe have a script library of individual scripts
Tree_Nut<-read.csv2("~/NutsForBASLN/40_BO/Output data/Biomass/Tree data.csv", header=FALSE)

Tree_Nut_2<-Tree_Nut %>% group_by(V1, V2) %>%
  select(V3, V10:V15, V16, V23:V29, V36:V42, V50:V61)

Tree_Foliage<-Tree_Nut_2 %>% select(V1:V15) %>% row_to_names (row_number=2) %>%  mutate(Date = make_date(YEAR, Month))%>%
  rename(K='K kg/ha', Ca="Ca kg/ha", N="N kg/ha", Mg="Mg kg/ha", S="S kg/ha", P="P kg/ha", Year=YEAR)

Tree_Foliage[c(1:9)]<-lapply(Tree_Foliage[c(1:9)], as.numeric)

Tree_Wood<-Tree_Nut_2 %>% select(V1:V2, V16:V28) %>% row_to_names (row_number=2) %>%  mutate(Date = make_date(YEAR, Month)) %>%
  rename(K='K kg/ha', Ca="Ca kg/ha", N="N kg/ha", Mg="Mg kg/ha", S="S kg/ha", P="P kg/ha", Year=YEAR)
Tree_Wood[c(1:9)]<-lapply(Tree_Wood[c(1:9)], as.numeric)

Tree_Bark<-Tree_Nut_2 %>% select(V1:V2, V29:V41) %>% row_to_names (row_number=2) %>%  mutate(Date = make_date(YEAR, Month)) %>%
  rename(K='K kg/ha', Ca="Ca kg/ha", N="N kg/ha", Mg="Mg kg/ha", S="S kg/ha", P="P kg/ha", Year=YEAR)
Tree_Bark[c(1:9)]<-lapply(Tree_Bark[c(1:9)], as.numeric)

Tree_Branch<-Tree_Nut_2 %>% select(V1:V1, V42:V54) %>% row_to_names (row_number=2) %>%  mutate(Date = make_date(YEAR, Month)) %>%
  rename(K='K kg/ha', Ca="Ca kg/ha", Mg="Mg kg/ha", S="S kg/ha", P="P kg/ha", Year=YEAR)

Tree_Branch[c(1:8)]<-lapply(Tree_Branch[c(1:8)], as.numeric)

Tree_Ligneous<-Tree_Nut_2 %>% select(V1:V1, V55:V61) %>% row_to_names (row_number=2) %>%  mutate(Date = make_date(YEAR, Month)) %>%
  rename(K='K kg/ha', Ca="Ca kg/ha", N="N kg/ha", Mg="Mg kg/ha", S="S kg/ha", P="P kg/ha", Year=YEAR)
Tree_Ligneous[c(1:9)]<-lapply(Tree_Ligneous[c(1:9)], as.numeric)




write.csv2(Tree_Foliage, "Tree_Foliage.csv")
write.csv2(Tree_Branch, "Tree_Branch.csv")
write.csv2(Tree_Wood, "Tree_Wood.csv")
write.csv2(Tree_Bark, "Tree_Bark.csv")
write.csv2(Tree_Ligneous, "Tree_Ligneous.csv")