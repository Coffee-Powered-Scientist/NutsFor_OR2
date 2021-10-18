
# Manually calculate net annual mineralization

rm(list = ls())

library(dplyr)


setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data")



Litter_Pre<-read.csv2("~/NutsForSEDHN/40_BO/Output data/Litter/Litter pool kg_ha data.csv")


Litter_N<-Litter_Pre %>% rename("Year"=X, "Month"=X.1, "N"=X.2, "Ca"=X.3, "Mg"=X.4, "K"=X.5, "S"=X.6, "P"=X.7) %>% select(Year, Month, N, Ca, Mg, K, S, P)


Litter_N<-Litter_N %>% mutate_if(is.character,as.numeric)

Litter_Final<-Litter_N[-c(38) ]

Litter_Final<-na.omit(Litter_Final)

write.csv2(Litter_Final, "Litter_Pool.csv")