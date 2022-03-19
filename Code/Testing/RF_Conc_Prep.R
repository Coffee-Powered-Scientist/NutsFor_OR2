
rm(list = ls())

###Read in NTN_OR2####

library(dplyr)
library(lubridate)

setwd("~/Project_Master/Test_Rep/Data")

RF_Chem<-read.csv2("~/Project_Master/Test_Rep/Data/NTN_OR2.csv")

RF_Chem[,7:16] <- sapply(RF_Chem[,7:16],as.numeric)

#Get rid of leap year days

RF_Chem<-RF_Chem[!grepl("1979", RF_Chem$yr),]

RF_Chem$pH<-(10^-RF_Chem$pH)*1e6

RF_Chem[RF_Chem < 0] <- NA

RF_Chem<-RF_Chem[-c(15)]

RF_Chem<-na.omit(RF_Chem)

RF_Chem_AVG<- RF_Chem %>% group_by(month) %>% summarise(across(Ca:pH, ~mean(.x, na.rm=TRUE)))


# Convert mg/L to umol/L (H+ from mol to umol)

RF_Chem_AVG$Ca<-RF_Chem_AVG$Ca*1000/40.078
RF_Chem_AVG$Mg<-RF_Chem_AVG$Mg*1000/24.305
RF_Chem_AVG$K<-RF_Chem_AVG$K*1000/39.0983
RF_Chem_AVG$Na<-RF_Chem_AVG$Na*1000/22.989769
RF_Chem_AVG$NH4<-RF_Chem_AVG$NH4*1000/14.0067
RF_Chem_AVG$NO3<-RF_Chem_AVG$NO3*1000/14.0067
RF_Chem_AVG$Cl<-RF_Chem_AVG$Cl*1000/35.453
RF_Chem_AVG$SO4<-RF_Chem_AVG$SO4*1000/32.065

RF_Chem_AVG<-do.call("rbind", replicate(550, RF_Chem_AVG, simplify = FALSE))


RF_Chem_AVG$YEAR<-rep(2005:2554, each=12)

# Add Sollins 1980-Calculated P concentration (average)

RF_Chem_AVG$P<-.194

write.csv(RF_Chem_AVG, "Rainfall_Conc.csv")