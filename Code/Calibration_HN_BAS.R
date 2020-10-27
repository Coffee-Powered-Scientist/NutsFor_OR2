#This Script will source all relevant scripts, and allow for single-run visualization of all calibrate components through use of source
rm(list = ls())

#Soil Solution
source("~/Project_Master/Test_Rep/Code/HN_BAS/Soil_Soln_HN_BAS_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/Soil_Soln_HN_BAS_Grapher.R")

#Weathering
source("~/Project_Master/Test_Rep/Code/HN_BAS/Weathering_HN_BAS_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/Weathering_HN_BAS_Grapher.R")