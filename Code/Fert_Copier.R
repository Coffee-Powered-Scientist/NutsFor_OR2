
rm(list = ls())

##-- Takes 40 BO base files and pastes them into the Fert. Folder of sites --##

Files<- list.files("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data")

Files_Rdy<-Files[-5]


# LNS


file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/Fertilized/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)


# HNS


file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/Fertilized/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)


# LNB


file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/Fertilized/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

# HNB 




file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/Fertilized/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)
