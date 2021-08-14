#This Code will take soil solution concentration data from all 8 layers of simulated ecosystem
#This code will then stitch the needed data together into a single .csv, and export to "Edited Data"
#The code will then source to another 2 graphing codes, which tend to be very slow


#Need to note units for different files, they are in different goddamn units
rm(list = ls())


setwd("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data")

library(dplyr)
library(tidyverse)
library(lubridate)
library(car)

#Reads all files in folder at once, then 
files <- list.files(path = "~/NutsforSEDLN/80_WTH/Output data/Weathering", pattern = "Layer", full.names = TRUE)

Weathering_All<- sapply(files, read.csv2, simplify=FALSE, header=FALSE) %>% 
  bind_rows(.id = "id")


#The below codes don't like being thrown into a function (x) type arguement, likely because lapply is a loop 
#(although, I'm not sure what's wrong with the indexing)
Weathering_All[,c(2:10)] <- lapply(Weathering_All[,c(2:10)], as.numeric)


Weathering_All<-filter(Weathering_All,  !is.na(V1))

Weathering_All$YEAR<-Weathering_All$V1
Weathering_All$Month<-Weathering_All$V2
Weathering_All$Ca<-Weathering_All$V3
Weathering_All$Mg<-Weathering_All$V4
Weathering_All$K<-Weathering_All$V5
Weathering_All$Na<-Weathering_All$V6
Weathering_All$Al<-Weathering_All$V7
Weathering_All$Si<-Weathering_All$V8
Weathering_All$P<-Weathering_All$V9

Weathering_All<-Weathering_All[-c(2:10)]



Weathering_All$group_id <- Weathering_All %>% 
  group_by(id)%>%
    group_indices(id)


Weathering_All$group_id<- as.character(Weathering_All$group_id)
  
Weathering_All<- Weathering_All %>%
      mutate(group_id=recode(group_id, "'1'='Layer 1' ; '2'='Layer 2' ; 
                                              '3'='Layer 3' ; '4'='Layer 4'; '5'='Layer 5'; '6'='Layer 6'; 
                                              '7'='Layer 7'; '8'='Layer 8'"))

Weathering_All<-Weathering_All %>% mutate(Date=make_date(YEAR,Month))


#write csv
write.csv2(Weathering_All, "Weathering_All.csv", row.names=TRUE)
