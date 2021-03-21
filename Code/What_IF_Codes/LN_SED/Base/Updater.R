

# Updates Dataset before R code is Run
rm(list = ls())

# Read in any libraries I forgot to put into original scripts
library(janitor)

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Weathering_LN_SED_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Soil_Soln_LN_SED_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Litter_Pool_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/TreeNut_LN_SED_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/CEC_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/AEC_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Analysis_1_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Hydro_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/SOM_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Plant_Pool_Mutator.R")