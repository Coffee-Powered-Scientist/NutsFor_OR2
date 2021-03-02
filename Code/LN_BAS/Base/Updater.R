

# Updates Dataset before R code is Run
rm(list = ls())

# Read in any libraries I forgot to put into original scripts
library(janitor)

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Weathering_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Soil_Soln_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Litter_Pool_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/CEC_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/AEC_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Analysis_1_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Hydro_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/SOM_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/Base/Plant_Pool_Mutator.R")