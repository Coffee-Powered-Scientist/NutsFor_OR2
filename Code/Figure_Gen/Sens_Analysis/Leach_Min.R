rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)
library(RColorBrewer)
library(ggpattern)
library(ggpubr)


# Update

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Soil_Soln_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Maximum/Mineral/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Maximum/Mineral/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Maximum/Mineral/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Maximum/Mineral/Soil_Soln_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_SED/40_BO/Sens_Analysis/Minimum/Mineral/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_SED/40_BO/Sens_Analysis/Minimum/Mineral/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/LN_BAS/40_BO/Sens_Analysis/Minimum/Mineral/Soil_Soln_Mutator.R")
source("~/Project_Master/Test_Rep/Code/HN_BAS/40_BO/Sens_Analysis/Minimum/Mineral/Soil_Soln_Mutator.R")

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

source("~/Project_Master/Test_Rep/Code/Functions/Per_Diff.R")
source("~/Project_Master/Test_Rep/Code/Functions/Sens_Coeff.R")

BaseLeaching<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/LeachingBase.csv")

# Original Leaching File

# Maximum
Mine_10_Plus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Min/Upper/Soil_Solution_All2.csv")

Mine_10_Plus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Min/Upper/Soil_Solution_All2.csv")

Mine_10_Plus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Min/Upper/Soil_Solution_All2.csv")

Mine_10_Plus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Min/Upper/Soil_Solution_All2.csv")

LNSED_Mine_Max<-Mine_10_Plus_LNSED %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_LNSED=Ca, Mg_LNSED=Mg, K_LNSED=K)

HNSED_Mine_Max<-Mine_10_Plus_HNSED %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_HNSED=Ca, Mg_HNSED=Mg, K_HNSED=K)

LNBAS_Mine_Max<-Mine_10_Plus_LNBAS %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_LNBAS=Ca, Mg_LNBAS=Mg, K_LNBAS=K)

HNBAS_Mine_Max<-Mine_10_Plus_HNBAS %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_HNBAS=Ca, Mg_HNBAS=Mg, K_HNBAS=K)

# Minimum

Mine_10_Minus_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Sens/Min/Lower/Soil_Solution_All2.csv")

Mine_10_Minus_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Sens/Min/Lower/Soil_Solution_All2.csv")

Mine_10_Minus_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Sens/Min/Lower/Soil_Solution_All2.csv")

Mine_10_Minus_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Sens/Min/Lower/Soil_Solution_All2.csv")

LNSED_Mine_Min<-Mine_10_Minus_LNSED %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_LNSED=Ca, Mg_LNSED=Mg, K_LNSED=K)

HNSED_Mine_Min<-Mine_10_Minus_HNSED %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_HNSED=Ca, Mg_HNSED=Mg, K_HNSED=K)

LNBAS_Mine_Min<-Mine_10_Minus_LNBAS %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_LNBAS=Ca, Mg_LNBAS=Mg, K_LNBAS=K)

HNBAS_Mine_Min<-Mine_10_Minus_HNBAS %>% filter(group_id %in% 8) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE))) %>%
  rename(Ca_HNBAS=Ca, Mg_HNBAS=Mg, K_HNBAS=K)

# Per Diff

PerChange_LNSED_Min_Ca<-Diff(LNSED_Mine_Min$Ca, BaseLeaching$Ca_LNSED)


PerChange_HNSED_Min_Ca<-Diff(HNSED_Mine_Min$Ca, BaseLeaching$Ca_HNSED)


PerChange_LNBAS_Min_Ca<-Diff(LNBAS_Mine_Min$Ca, BaseLeaching$Ca_LNBAS)


PerChange_HNBAS_Min_Ca<-Diff(HNBAS_Mine_Min$Ca, BaseLeaching$Ca_HNBAS)


PerChange_LNSED_Max_Ca<-Diff(LNSED_Mine_Max$Ca, BaseLeaching$Ca_LNSED)
PerChange_HNSED_Max_Ca<-Diff(HNSED_Mine_Max$Ca, BaseLeaching$Ca_HNSED)
PerChange_LNBAS_Max_Ca<-Diff(LNBAS_Mine_Max$Ca, BaseLeaching$Ca_LNBAS)
PerChange_HNBAS_Max_Ca<-Diff(HNBAS_Mine_Max$Ca, BaseLeaching$Ca_HNBAS)

PerChange_LNSED_Min_K<-Diff(LNSED_Mine_Min$K, BaseLeaching$K_LNSED)


PerChange_HNSED_Min_K<-Diff(HNSED_Mine_Min$K, BaseLeaching$K_HNSED)


PerChange_LNBAS_Min_K<-Diff(LNBAS_Mine_Min$K, BaseLeaching$K_LNBAS)


PerChange_HNBAS_Min_K<-Diff(HNBAS_Mine_Min$K, BaseLeaching$K_HNBAS)


PerChange_LNSED_Max_K<-Diff(LNSED_Mine_Max$K, BaseLeaching$K_LNSED)
PerChange_HNSED_Max_K<-Diff(HNSED_Mine_Max$K, BaseLeaching$K_HNSED)
PerChange_LNBAS_Max_K<-Diff(LNBAS_Mine_Max$K, BaseLeaching$K_LNBAS)
PerChange_HNBAS_Max_K<-Diff(HNBAS_Mine_Max$K, BaseLeaching$K_HNBAS)

PerChange_LNSED_Min_Mg<-Diff(LNSED_Mine_Min$Mg, BaseLeaching$Mg_LNSED)


PerChange_HNSED_Min_Mg<-Diff(HNSED_Mine_Min$Mg, BaseLeaching$Mg_HNSED)


PerChange_LNBAS_Min_Mg<-Diff(LNBAS_Mine_Min$Mg, BaseLeaching$Mg_LNBAS)


PerChange_HNBAS_Min_Mg<-Diff(HNBAS_Mine_Min$Mg, BaseLeaching$Mg_HNBAS)


#Sens

Sens_Coeff_LNSED_Min_Ca<-Sens_Coeff(LNSED_Mine_Min$Ca, BaseLeaching$Ca_LNSED, .5, 1)


Sens_Coeff_HNSED_Min_Ca<-Sens_Coeff(HNSED_Mine_Min$Ca, BaseLeaching$Ca_HNSED, .5, 1)


Sens_Coeff_LNBAS_Min_Ca<-Sens_Coeff(LNBAS_Mine_Min$Ca, BaseLeaching$Ca_LNBAS, .5, 1)


Sens_Coeff_HNBAS_Min_Ca<-Sens_Coeff(HNBAS_Mine_Min$Ca, BaseLeaching$Ca_HNBAS, .5, 1)


Sens_Coeff_LNSED_Max_Ca<-Sens_Coeff(LNSED_Mine_Max$Ca, BaseLeaching$Ca_LNSED, 1.5, 1)
Sens_Coeff_HNSED_Max_Ca<-Sens_Coeff(HNSED_Mine_Max$Ca, BaseLeaching$Ca_HNSED, 1.5, 1)
Sens_Coeff_LNBAS_Max_Ca<-Sens_Coeff(LNBAS_Mine_Max$Ca, BaseLeaching$Ca_LNBAS, 1.5, 1)
Sens_Coeff_HNBAS_Max_Ca<-Sens_Coeff(HNBAS_Mine_Max$Ca, BaseLeaching$Ca_HNBAS, 1.5, 1)

Sens_Coeff_LNSED_Min_K<-Sens_Coeff(LNSED_Mine_Min$K, BaseLeaching$K_LNSED, .5, 1)


Sens_Coeff_HNSED_Min_K<-Sens_Coeff(HNSED_Mine_Min$K, BaseLeaching$K_HNSED, .5, 1)


Sens_Coeff_LNBAS_Min_K<-Sens_Coeff(LNBAS_Mine_Min$K, BaseLeaching$K_LNBAS, .5, 1)


Sens_Coeff_HNBAS_Min_K<-Sens_Coeff(HNBAS_Mine_Min$K, BaseLeaching$K_HNBAS, .5, 1)


Sens_Coeff_LNSED_Max_K<-Sens_Coeff(LNSED_Mine_Max$K, BaseLeaching$K_LNSED, 1.5, 1)
Sens_Coeff_HNSED_Max_K<-Sens_Coeff(HNSED_Mine_Max$K, BaseLeaching$K_HNSED, 1.5, 1)
Sens_Coeff_LNBAS_Max_K<-Sens_Coeff(LNBAS_Mine_Max$K, BaseLeaching$K_LNBAS, 1.5, 1)
Sens_Coeff_HNBAS_Max_K<-Sens_Coeff(HNBAS_Mine_Max$K, BaseLeaching$K_HNBAS, 1.5, 1)

Sens_Coeff_LNSED_Min_Mg<-Sens_Coeff(LNSED_Mine_Min$Mg, BaseLeaching$Mg_LNSED, .5, 1)


Sens_Coeff_HNSED_Min_Mg<-Sens_Coeff(HNSED_Mine_Min$Mg, BaseLeaching$Mg_HNSED, .5, 1)


Sens_Coeff_LNBAS_Min_Mg<-Sens_Coeff(LNBAS_Mine_Min$Mg, BaseLeaching$Mg_LNBAS, .5, 1)


Sens_Coeff_HNBAS_Min_Mg<-Sens_Coeff(HNBAS_Mine_Min$Mg, BaseLeaching$Mg_HNBAS, .5, 1)


Sens_Coeff_LNSED_Max_Mg<-Sens_Coeff(LNSED_Mine_Max$Mg, BaseLeaching$Mg_LNSED, 1.5, 1)
Sens_Coeff_HNSED_Max_Mg<-Sens_Coeff(HNSED_Mine_Max$Mg, BaseLeaching$Mg_HNSED, 1.5, 1)
Sens_Coeff_LNBAS_Max_Mg<-Sens_Coeff(LNBAS_Mine_Max$Mg, BaseLeaching$Mg_LNBAS, 1.5, 1)
Sens_Coeff_HNBAS_Max_Mg<-Sens_Coeff(HNBAS_Mine_Max$Mg, BaseLeaching$Mg_HNBAS, 1.5, 1)

Sens_Coeff_Df_Ca<-cbind(Sens_Coeff_LNSED_Min_Ca, Sens_Coeff_HNSED_Min_Ca,Sens_Coeff_LNBAS_Min_Ca,Sens_Coeff_HNBAS_Min_Ca,Sens_Coeff_LNSED_Max_Ca,Sens_Coeff_HNSED_Max_Ca,
                        Sens_Coeff_LNBAS_Max_Ca,Sens_Coeff_HNBAS_Max_Ca)
Sens_Coeff_Df_Mg<-cbind(Sens_Coeff_LNSED_Min_Mg, Sens_Coeff_HNSED_Min_Mg,Sens_Coeff_LNBAS_Min_Mg,Sens_Coeff_HNBAS_Min_Mg,Sens_Coeff_LNSED_Max_Mg,Sens_Coeff_HNSED_Max_Mg,
                        Sens_Coeff_LNBAS_Max_Mg,Sens_Coeff_HNBAS_Max_Mg)
Sens_Coeff_Df_K<-cbind(Sens_Coeff_LNSED_Min_K, Sens_Coeff_HNSED_Min_K,Sens_Coeff_LNBAS_Min_K,Sens_Coeff_HNBAS_Min_K,Sens_Coeff_LNSED_Max_K,Sens_Coeff_HNSED_Max_K,
                       Sens_Coeff_LNBAS_Max_K,Sens_Coeff_HNBAS_Max_K)

See<-cbind(Sens_Coeff_Df_Ca, Sens_Coeff_Df_Mg, Sens_Coeff_Df_K)
See<-data.frame(See)
See$ID<-"Mineral"



PerChange_LNSED_Max_Mg<-Diff(LNSED_Mine_Max$Mg, BaseLeaching$Mg_LNSED)
PerChange_HNSED_Max_Mg<-Diff(HNSED_Mine_Max$Mg, BaseLeaching$Mg_HNSED)
PerChange_LNBAS_Max_Mg<-Diff(LNBAS_Mine_Max$Mg, BaseLeaching$Mg_LNBAS)
PerChange_HNBAS_Max_Mg<-Diff(HNBAS_Mine_Max$Mg, BaseLeaching$Mg_HNBAS)



PerChange_Df_Ca<-cbind(PerChange_LNSED_Min_Ca, PerChange_HNSED_Min_Ca,PerChange_LNBAS_Min_Ca,PerChange_HNBAS_Min_Ca,PerChange_LNSED_Max_Ca,PerChange_HNSED_Max_Ca,
                       PerChange_LNBAS_Max_Ca,PerChange_HNBAS_Max_Ca)

PerChange_Df_Ca<-as.data.frame(PerChange_Df_Ca)

PerChange_Df_Mg<-cbind(PerChange_LNSED_Min_Mg, PerChange_HNSED_Min_Mg,PerChange_LNBAS_Min_Mg,PerChange_HNBAS_Min_Mg,PerChange_LNSED_Max_Mg,PerChange_HNSED_Max_Mg,
                       PerChange_LNBAS_Max_Mg,PerChange_HNBAS_Max_Mg)

PerChange_Df_Mg<-as.data.frame(PerChange_Df_Mg)

PerChange_Df_K<-cbind(PerChange_LNSED_Min_K, PerChange_HNSED_Min_K,PerChange_LNBAS_Min_K,PerChange_HNBAS_Min_K,PerChange_LNSED_Max_K,PerChange_HNSED_Max_K,
                      PerChange_LNBAS_Max_K,PerChange_HNBAS_Max_K)

PerChange_Df_K<-as.data.frame(PerChange_Df_K)

PerChange_Df<-cbind(PerChange_Df_Ca, PerChange_Df_K, PerChange_Df_Mg)

Ca<-melt(PerChange_Df_Ca)

Ca$ID<-c("Lower", "Lower", "Lower", "Lower",
         "Upper", "Upper", "Upper", "Upper")

Ca$Site<-c("LN SED", "HN SED", "LN BAS", "HN BAS",
           "LN SED", "HN SED", "LN BAS", "HN BAS")

Ca$Species<-"Ca"

Mg<-melt(PerChange_Df_Mg)

Mg$Site<-c("LN SED", "HN SED", "LN BAS", "HN BAS",
           "LN SED", "HN SED", "LN BAS", "HN BAS")

Mg$ID<-c("Lower", "Lower", "Lower", "Lower",
         "Upper", "Upper", "Upper", "Upper")

Mg$Species<-"Mg"

K<-melt(PerChange_Df_K)

K$Site<-c("LN SED", "HN SED", "LN BAS", "HN BAS",
          "LN SED", "HN SED", "LN BAS", "HN BAS")

K$ID<-c("Lower", "Lower", "Lower", "Lower",
        "Upper", "Upper", "Upper", "Upper")
K$Species<-"K"

Y<-rbind(Ca, Mg, K)

Y$Site <- factor(Y$Site,levels = c("LN SED", "HN SED", "LN BAS", "HN BAS"))

Y$Sens<-"Min"
Y$Response<-"Leach"

Y$value2<-ifelse(abs(Y$value)==0, "NR", " ")

G_LMIN<-ggplot(data = Y, aes(x = Site, y = value, fill=ID, pattern = Species, width=.75)) +
  geom_col_pattern(position = position_dodge(preserve = "single"),
                   color = "black", 
                   pattern_fill = "black",
                   pattern_angle = 45,
                   pattern_density = 0.1,
                   pattern_spacing = 0.025,
                   pattern_key_scale_factor = 0.6) + 
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange1"), labels=c("Lower"="Lower (-50%)", "Upper"="Upper (+50%)")) +
  scale_pattern_manual(values = c(Ca = "stripe", K = "none", Mg='circle')) +
  labs(x = "Site", y = "Base Cation Leaching % Change", pattern = "Species", fill="Increment") + 
  guides(pattern = guide_legend(override.aes = list(fill = "white")),
         fill = guide_legend(override.aes = list(pattern = "none")))+ theme_bw()+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+ggtitle("Mineral Abundance")+
  theme(plot.title = element_text(hjust = 0.5, size=14))

png("Leach_Min.png", width=1000, height=500, res=115)
plot(G_LMIN)
dev.off()

write.csv2(See, "Sens_Tbl_Mineral_Leach.csv")
write.csv2(Y, "Min_Leach.csv")
write.csv(PerChange_Df, "MinLeach_Per.csv")