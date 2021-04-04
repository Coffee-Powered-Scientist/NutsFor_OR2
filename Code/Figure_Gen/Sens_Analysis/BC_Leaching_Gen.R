

# This code generates the 40_BO cumulative leaching of original sites, to be used 

rm(list = ls())

library(dplyr)


setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")


# Tot Leaching Calculator (40 BO)

# LN SED

LN_SED_Orig<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

LN_SED_OrigL1 <-LN_SED_Orig %>% filter(group_id %in% 8)

LN_SED_OrigL2 <- LN_SED_OrigL1 %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_LNSED=Ca, Mg_LNSED=Mg, K_LNSED=K)


# HN SED

HN_SED_Orig<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

HN_SED_OrigL1 <-HN_SED_Orig %>% filter(group_id %in% 8)

HN_SED_OrigL2 <- HN_SED_OrigL1 %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_HNSED=Ca, Mg_HNSED=Mg, K_HNSED=K)



# HN BAS

HN_BAS_Orig<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

HN_BAS_OrigL1 <-HN_BAS_Orig %>% filter(group_id %in% 8)

HN_BAS_OrigL2 <- HN_BAS_OrigL1 %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_HNBAS=Ca, Mg_HNBAS=Mg, K_HNBAS=K)

# LN BAS

LN_BAS_Orig<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

LN_BAS_OrigL1 <-LN_BAS_Orig %>% filter(group_id %in% 8)

LN_BAS_OrigL2 <- LN_BAS_OrigL1 %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_LNBAS=Ca, Mg_LNBAS=Mg, K_LNBAS=K)


Final<-cbind(LN_SED_OrigL2, HN_SED_OrigL2, LN_BAS_OrigL2, HN_BAS_OrigL2)


write.csv2(Final, "LeachingBase.csv")