
rm(list = ls())

Files<- list.files("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data")

Files_Rdy<-Files[-8]


#LNS


file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/80_BO/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/80_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDLN/80_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

#HNS

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/80_BO/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/80_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForSEDHN/80_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

#LNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/80_BO/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/80_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASLN/80_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

#HNB

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/80_BO/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/80_WTH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/40_BO/Input data/", Files_Rdy),
          to = paste0("C:/Users/siahl/OneDrive - Oregon State University/Documents/NutsForBASHN/80_OH/Input data/", Files_Rdy), 
          overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)