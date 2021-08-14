
# Sens Updater

rm(list = ls())

# Update leaching and biomass output
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/BC_Leaching_Gen.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Tot_Biomass_Gen.R")


# Update data files that calculate sensitivity 

source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Atm_Sens_Bio.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Atm_Sens_CaWEATH.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Exch_Sens_Bio.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Exch_Sens_Weath.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Growth_Bio.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Growth_CaWEATH.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Leach_Atm.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Leach_Exch.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Leach_Growth.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Leach_Min.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Leach_Nit.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Leach_SOMP.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Mineral_Sens_Bio.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Mineral_Sens_CaWEATH.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Nit_Sens_Bio.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Nit_Sen_CaWEATH.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/SOMP_CaWEATH.R")
source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/SOMP_Growth.R")

# Generate images for manuscript

source("~/Project_Master/Test_Rep/Code/Figure_Gen/Sens_Analysis/Sens_Grouped.R")
