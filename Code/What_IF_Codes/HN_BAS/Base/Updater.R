

# Updates Dataset before R code is Run
rm(list = ls())

# Read in any libraries I forgot to put into original scripts
library(janitor)

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Soil_Soln_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Litter_Pool_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/TreeNut_HN_BAS_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/CEC_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/AEC_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Analysis_1_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Hydro_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/SOM_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/Base/Plant_Pool_Mutator.R")