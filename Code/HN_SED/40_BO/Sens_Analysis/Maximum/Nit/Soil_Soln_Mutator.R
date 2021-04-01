#This Code will take soil solution concentration data from all 8 layers of simulated ecosystem
#This code will then stitch the needed data together into a single .csv, and export to "Edited Data"
#The code will then source to another 2 graphing codes, which tend to be very slow


#Need to note units for different files, they are in different goddamn units
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Nit/Upper")

library(dplyr)
library(tidyverse)
library(lubridate)

#Reads all files in folder at once, then 
files <- list.files(path = "~/Sens_Parent/Sens_Nit/HN_SED/40_BO/Maximum/Output data/Soil solution", pattern = "*.csv", full.names = TRUE)
Soil_Soln<- sapply(files, read.csv2, simplify=FALSE) %>% 
  bind_rows(.id = "id")


#The below codes don't like being thrown into a function (x) type arguement, likely because lapply is a loop 
#(although, I'm not sure what's wrong with the indexing)
Soil_Soln[,c(2:19)] <- lapply(Soil_Soln[,c(2:19)], as.numeric)


Soil_Soln<-filter(Soil_Soln,  !is.na(YEAR))


Soil_Soln$group_id <- Soil_Soln %>% 
  group_by(id)%>%
  group_indices(id)


Soil_Soln<- Soil_Soln %>% mutate(Date=make_date(YEAR, Month))

write.csv2(Soil_Soln, "Soil_Solution_All2.csv", row.names=TRUE)


