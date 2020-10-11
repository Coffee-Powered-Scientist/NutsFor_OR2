#Analyze Leaching Flux from the System Over time

#Analyze Uptake over the same time frame

#Write Equation (Deposition+Litterfall+Foliar Exchange)-(Leaching+ Total Uptake)
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Output_LN_SED/Analysis_Depletion")

Above_Ground<-read.csv2("~/NutsForSEDLN/Output data/Budgets/Above ground fluxes.csv", header= FALSE)
Bio_Cycle<-read.csv2("~/NutsForSEDLN/Output data/Budgets/Biological cycle.csv", header= FALSE)

