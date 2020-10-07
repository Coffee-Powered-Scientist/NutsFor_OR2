#This file calls datasets and then  transmutes them into useable forms, before outputting them into a .csv
#The point of this code is to set up modularity of code
#Compare Weathering and Deposited Ca

setwd("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data")
Above_Grd_Flux<-read.csv2("~/NutsForSEDLN/Output data/Budgets/Above ground fluxes.csv", header=TRUE)

#Rename variables or else graphing will be very difficult later on
Above_Grd_Flux$Ca_Dep<-Above_Grd_Flux$Wet.Deposition.kg.ha.yr
Above_Grd_Flux$Mg_Dep<-Above_Grd_Flux$X
Above_Grd_Flux$K_Dep<-Above_Grd_Flux$X.1
Above_Grd_Flux$Na_Dep<-Above_Grd_Flux$X.6
Above_Grd_Flux$Al_Dep<-Above_Grd_Flux$X.8
Above_Grd_Flux$Ca_Weather<-Above_Grd_Flux$Weathering.flux.kg.ha.yr

Weather_Depo_Comp<-Above_Grd_Flux[-c(1:79)]
Weather_Depo_Comp<-Weather_Depo_Comp[-c(1),]
Weather_Depo_Comp$Date<-seq(as.Date("2005/1/1"), by = "year", length.out = 11)

Weather_Depo_Comp[c(1:6)]<- lapply(Weather_Depo_Comp[c(1:6)], as.numeric)

write.csv2(Weather_Depo_Comp,"Weather_Depo_Comp.csv", row.names = TRUE)

#Pulls Graphing code, which directs output to "Comparison Graphs" section
source("~/Project_Master/Test_Rep/Code/Above_Flux_Weather_Depo.R")