rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)

#Reads all files in folder at once, then 
files <- list.files(path = "~/NutsforSEDLN/Output data/SOM", pattern = "*.csv", full.names = TRUE)
SOM<- sapply(files, read.csv2, simplify=FALSE) %>% 
  bind_rows(.id = "id")


#The below codes don't like being thrown into a function (x) type arguement, likely because lapply is a loop 
#(although, I'm not sure what's wrong with the indexing)
SOM[,c(3:21)] <- lapply(SOM[,c(3:21)], as.numeric)


SOM<- SOM %>%
  mutate(Date = make_date(YEAR, Month))

SOM$group_id <- SOM %>% 
  group_by(id)%>%
  group_indices(id) 

SOM<- SOM %>%
  mutate(group_id=recode(group_id, "'1'='Layer 1' ; '2'='Layer 2' ; 
                                              '3'='Layer 3' ; '4'='Layer 4'; '5'='Layer 5'; '6'='Layer 6'; 
                                              '7'='Layer 7'; '8'='Layer 8'"))


write.csv2(SOM, "SOM.csv", row.names=TRUE)

