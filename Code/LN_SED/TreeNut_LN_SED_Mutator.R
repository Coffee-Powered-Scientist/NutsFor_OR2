
rm(list = ls())
#Set wd to edited data in mutator files; that way writecsv always deposits it in one place
setwd("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data")

#Maybe have a function script-maybe have a script library of individual scripts
Tree_Nut<-read.csv2("~/NutsForSEDLN/Output data/Biomass/Tree data.csv", header=FALSE)



Tree_Nut$N_F<-Tree_Nut$V10
Tree_Nut$Ca_F<-Tree_Nut$V11
Tree_Nut$Mg_F<-Tree_Nut$V12
Tree_Nut$K_F<-Tree_Nut$V13
Tree_Nut$S_F<-Tree_Nut$V14
Tree_Nut$P_F<-Tree_Nut$V15


Tree_Nut$N_W<-Tree_Nut$V23
Tree_Nut$Ca_W<-Tree_Nut$V24
Tree_Nut$Mg_W<-Tree_Nut$V25
Tree_Nut$K_W<-Tree_Nut$V26
Tree_Nut$S_W<-Tree_Nut$V27
Tree_Nut$P_W<-Tree_Nut$V28

Tree_Nut<-Tree_Nut[-c(1:2),]

#Convert from character to numeric
Tree_Nut[,c(1:41)] <- lapply(Tree_Nut[,c(1:41)], as.character)
Tree_Nut[,c(1:41)] <- lapply(Tree_Nut[,c(1:41)], as.numeric)



#Convert biomass from g/meters squared to kg/hectare, generate "total" pools
Tree_Nut$WoodBiomass<-Tree_Nut$V16*10
Tree_Nut$FoliarBiomass<-Tree_Nut$V3*10

#Totals
Tree_Nut$TotBiomass<-Tree_Nut$WoodBiomass+Tree_Nut$WoodBiomass
Tree_Nut$Ca_Tot<-Tree_Nut$Ca_F+Tree_Nut$Ca_W
Tree_Nut$Mg_Tot<-Tree_Nut$Mg_F+Tree_Nut$Mg_W
Tree_Nut$N_Tot<-Tree_Nut$N_F+Tree_Nut$N_W
Tree_Nut$S_Tot<-Tree_Nut$S_F+Tree_Nut$S_W
Tree_Nut$P_Tot<-Tree_Nut$P_F+Tree_Nut$P_W
Tree_Nut$K_Tot<-Tree_Nut$K_F+Tree_Nut$K_W


#Get rid of variables in the wrong unit, and of duplicated data
Tree_Nut<-Tree_Nut[-c(1:29)]


write.csv2(Tree_Nut, "Tree_Nutrients_Biomass.csv")