

rm(list = ls())

###Read in NTN_OR2####

library(dplyr)
library(lubridate)

setwd("~/Project_Master/Test_Rep/Data")

PET<-read.csv2("~/Project_Master/Test_Rep/Data/PET_1yr.csv")

PET<-do.call("rbind", replicate(550, PET, simplify = FALSE))


write.csv(PET, "PET_AllYears.csv")