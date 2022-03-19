
rm(list = ls())

# The Fertilization Calculator

# Calculates Required fertilization based on mutable parameters, repeats and appends data into CSV file


# Read in One year of normal rainfall concentration data and 1 year rainfall volume

library(dplyr)

setwd("~/Project_Master/Test_Rep/Data")

RF_Chem_1<-read.csv("~/Project_Master/Test_Rep/Data/Rainfall_Conc.csv", sep = ";")

RF_Chem<-RF_Chem_1[1:12,]

Hydrology_1<-read.csv("~/NutsForSEDLN/Base/Output data/Hydrology/Hydrology Monthly Output.csv", sep = ";")

RF<-Hydrology_1$X.2

RF<-na.omit(as.numeric(RF[1:14]))

# Add functions to calculate kmol Nutrient required per month

kmol_Func<-function(x, y){
  
  (x/300/y)
  
  }

check_Func<-function(x1,x2,x3,x4){
  
  (x1+x2)*x3*x4*10000/1e9
  
  }



# Parameters

FertCa = 721.59
FertK = 479.5
FertN = 225

MW_Ca = 40.078
MW_K = 39.0983
MW_N = 14.0067

# Run Calculations

Ca_Fert<-(kmol_Func(FertCa, MW_Ca)*1e9/RF/10000) + RF_Chem$Ca

K_Fert<-(kmol_Func(FertK, MW_K)*1e9/RF/10000) + RF_Chem$K

NH4_Fert<-(kmol_Func(FertN, MW_N)*1e9/RF/10000/2) + RF_Chem$NH4

NO3_Fert<-(kmol_Func(FertN, MW_N)*1e9/RF/10000/2) + RF_Chem$NO3


# Required Anions: K needs 1 mol Cl: 1 mol K, and Ca needs 2 mol Cl: 1 mol Ca

Cl_Ca<- Ca_Fert*2 + RF_Chem$Cl

Cl_K<- K_Fert + RF_Chem$Cl

# For co-limited sites, need to get rid of doubled RF Cl

Cl_Ca_K <- Cl_K + Cl_Ca - RF_Chem$Cl


# Check should be the Fert + Original Deposition within 25 year period

Ca_Check<-sum(25*(check_Func(Ca_Fert, 0, MW_Ca, RF)))

K_Check<-sum(25*(check_Func(K_Fert, 0, MW_K, RF)))

N_Check<-sum(25*(check_Func(NH4_Fert+NO3_Fert, 0, MW_N, RF)))


RF_Chem_NFERT<-RF_Chem
RF_CHEM_CaFERT<-RF_Chem
RF_CHEM_KCaFERT<-RF_Chem

# Replace columns with new calculations

RF_Chem_NFERT$NO3<-NO3_Fert
RF_Chem_NFERT$NH4<-NH4_Fert

RF_CHEM_CaFERT$Ca<-Ca_Fert
RF_CHEM_CaFERT$Cl<-Cl_Ca

RF_CHEM_KCaFERT$K<-K_Fert
RF_CHEM_KCaFERT$Ca<-Ca_Fert
RF_CHEM_KCaFERT$Cl<-Cl_Ca_K

# Create year column

Fert_Years<-c(Years = rep(2042:2067, each=12), Years = rep(2084:2109, each = 12)
                  ,Years = rep(2126:2151, each = 12),Years = rep(2168:2193,each = 12),
                  Years = rep(2210:2235, each = 12), Years = rep(2252:2277, each=12), 
                  Years = rep(2294:2319, each = 12), Years = rep(2336:2361, each = 12),
                  Years = rep(2378:2403, each=12), Years = rep(2420:2445, each=12),
                  Years = rep(2462:2487, each=12))

nrow(Fert_Years)/12


####Rep. of Fert Years
##### N

RF_Chem_NFERT<-do.call("rbind", replicate(nrow(data.frame(Fert_Years))/12, RF_Chem_NFERT, simplify = FALSE))

RF_Chem_NFERT$YEAR<-Fert_Years

All_Years<-data.frame(Years = rep(2005:2505, each =12))

#####Ca

RF_CHEM_CaFERT<-do.call("rbind", replicate(nrow(data.frame(Fert_Years))/12, RF_CHEM_CaFERT, simplify = FALSE))

RF_CHEM_CaFERT$YEAR<-Fert_Years

#####Ca/K

RF_CHEM_KCaFERT<-do.call("rbind", replicate(nrow(data.frame(Fert_Years))/12, RF_CHEM_KCaFERT, simplify = FALSE))

RF_CHEM_KCaFERT$YEAR<-Fert_Years



#Non Fert Rep

Non_Fert_Years<-data.frame(All_Years[!All_Years$Years %in% Fert_Years,])

Non_Fert_CHEM<-do.call("rbind", replicate(nrow(Non_Fert_Years)/12, RF_Chem, simplify = FALSE))

Non_Fert_CHEM$YEAR<-Non_Fert_Years$All_Years..All_Years.Years..in..Fert_Years...


#Final Dataset

#N
Final_N<-rbind(RF_Chem_NFERT, Non_Fert_CHEM)

Final_N<-Final_N[order(Final_N$YEAR),]

Final_N <- Final_N %>% relocate(YEAR, .before = month)

#Ca

Final_Ca<-rbind(RF_CHEM_CaFERT, Non_Fert_CHEM)

Final_Ca<-Final_Ca[order(Final_Ca$YEAR),]

Final_Ca <- Final_Ca %>% relocate(YEAR, .before = month)


#K/Ca

Final_K<-rbind(RF_CHEM_KCaFERT, Non_Fert_CHEM)

Final_K<-Final_K[order(Final_K$YEAR),]

Final_K <- Final_K %>% relocate(YEAR, .before = month)

# Write to CSVs, save data and then copy paste it to permanent dataset

write.csv(Final_N, "Rainfall_Conc_Fert_N.csv")
write.csv(Final_Ca, "Rainfall_Conc_Fert_Ca.csv")
write.csv(Final_K, "Rainfall_Conc_Fert_K.csv")


