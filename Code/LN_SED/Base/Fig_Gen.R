
#Generates figures (graphs) for main body of manuscript, appendix figures generated in Appendix_Fig_Gen
rm(list = ls())

setwd("~/Project_Master/Test_Rep/Manuscript/Images/LN_SED/Base")

library(ggplot2)
library(dplyr)

#LN_SED/Base Limitation (PU-AU) Graphs
Plant_Pool<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Plant_Pool.csv")
source("~/Project_master/Test_Rep/Code/Functions/Grapher_PP.R")

N_Diff<-Plant_Pool_Graph(Plant_Pool$Year, Plant_Pool$N_Diff)

N_Diff<-N_Diff+labs(x="Year", y="N Potential-Actual Uptake Difference")

png("N_Diff.png")
print(N_Diff)
dev.off()

P_Diff<-Plant_Pool_Graph(Plant_Pool$Year, Plant_Pool$P_Diff)

png("P_Diff.png")
print(P_Diff)
dev.off()

Ca_Diff<-Plant_Pool_Graph(Plant_Pool$Year, Plant_Pool$Ca_Diff)

png("Ca_Diff.png")
print(Ca_Diff)
dev.off()


Mg_Diff<-Plant_Pool_Graph(Plant_Pool$Year, Plant_Pool$Mg_Diff)

png("Mg_Diff.png")
print(Mg_Diff)
dev.off()

K_Diff<-Plant_Pool_Graph(Plant_Pool$Year, Plant_Pool$K_Diff)

png("K_Diff.png")
print(K_Diff)
dev.off()


#LN_SED Biomass/Percent Biomass of target Graphs



#LN_SED Accumulated Nutrient vs. Available Nutrient




#Total Ecosystem Loss Per Harvest