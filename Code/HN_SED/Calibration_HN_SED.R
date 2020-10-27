#This Script will source all relevant scripts, and allow for single-run visualization of all calibrate components through use of source
rm(list = ls())

#Soil Solution
source("~/Project_Master/Test_Rep/Code/HN_SED/Soil_Soln_HN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/Soil_Soln_HN_SED_Grapher.R")

#Weathering
source("~/Project_Master/Test_Rep/Code/HN_SED/Weathering_HN_SED_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/Weathering_HN_SED_Grapher.R")

#Total stand acquisition (pool) over time
