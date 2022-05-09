
rm(list = ls())

##-Copy paste file for Sensitivty Analysis Folders-##

# Takes 40 BO files and gives them to sens. folders (excluding key files, changed in the sens. analysis)

# ATM: Include all files except for rainfall conc

Files<- list.files("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data")


# Many redundant files, but it helps with categorization

Files_Atm<-Files[-5]

Files_Exch<-Files[-6]

Files_Growth<-Files[-9]

Files_Min<-Files[-6]

Files_Nit<-Files[-6]
  
Files_SOMP<-Files[-6]

# Atmospheric Deposition

## ATM: LNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/LN_SED/Maximum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/LN_SED/Minimum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## ATM: LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/LN_BAS/Maximum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/LN_BAS/Minimum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## ATM: HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/HN_SED/Maximum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/HN_SED/Minimum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## ATM: HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/HN_BAS/Maximum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Atm),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Atm/HN_BAS/Minimum/Input data/", Files_Atm), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)



# Exchangeable Pool

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/LN_SED/40_BO/Maximum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/LN_SED/40_BO/Minimum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Exch: LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/LN_BAS/40_BO/Maximum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/LN_BAS/40_BO/Minimum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Exch: HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/HN_SED/40_BO/Maximum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/HN_SED/40_BO/Minimum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Exch: HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/HN_BAS/40_BO/Maximum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Exch),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Exch/HN_BAS/40_BO/Minimum/Input data/", Files_Exch), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)


# Growth Deposition

## Growth: LNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/LN_SED/Maximum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/LN_SED/Minimum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Growth: LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/LN_BAS/Maximum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/LN_BAS/Minimum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Growth: HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/HN_SED/Maximum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/HN_SED/Minimum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Growth: HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/HN_BAS/Maximum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Growth),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Growth/HN_BAS/Minimum/Input data/", Files_Growth), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)


# Mineral Pool

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/LN_SED/40_BO/Maximum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/LN_SED/40_BO/Minimum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Min: LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/LN_BAS/40_BO/Maximum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/LN_BAS/40_BO/Minimum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Min: HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/HN_SED/40_BO/Maximum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/HN_SED/40_BO/Minimum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Min: HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/HN_BAS/40_BO/Maximum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Min),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Min/HN_BAS/40_BO/Minimum/Input data/", Files_Min), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)



# Nitrification Pool

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/LN_SED/40_BO/Maximum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/LN_SED/40_BO/Minimum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Nit: LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/LN_BAS/40_BO/Maximum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/LN_BAS/40_BO/Minimum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Nit: HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/HN_SED/40_BO/Maximum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/HN_SED/40_BO/Minimum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## Nit: HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/HN_BAS/40_BO/Maximum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Nit),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_Nit/HN_BAS/40_BO/Minimum/Input data/", Files_Nit), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)


# SOM-P

## SOMP: LNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/LN_SED/Maximum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/LN_SED/Minimum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## SOMP: LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/LN_BAS/Maximum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/LN_BAS/Minimum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## SOMP: HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/HN_SED/Maximum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/HN_SED/Minimum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

## SOMP: HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/HN_BAS/Maximum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_SOMP),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/Sens_Parent/Sens_SOMP/HN_BAS/Minimum/Input data/", Files_SOMP), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)




