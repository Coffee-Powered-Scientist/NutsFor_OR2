#This the "parent" figure generation script, it is meant to call upon figure scripts (found for each site in Code)
#Deposits figures in a a folder that is not yet part of this repo

# Update Data Files (make sure to clear environment in every updater)

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Updater.R")
source("~/Project_Master/Test_Rep/Code/LN_SED/40_WTH/Updater.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_WTH/Updater.R")


# Call on Figure Generating Codes (also make sure to clear environment)

# LN_SED

## Base

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Fig_Gen.R")