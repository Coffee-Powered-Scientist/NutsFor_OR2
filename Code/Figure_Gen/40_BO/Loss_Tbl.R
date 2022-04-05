
rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)
library(ggpubr)
library(grid)
library(gridExtra)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_BO")

Years<-seq(2005, 2505, 1)

# LN SED

Leaching_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_LNS<-Leaching_LNS %>% subset(group_id %in% 8 & YEAR %in% Years ) %>% summarise(across(Ca:DOP, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

Net_Removal_LNS<-Tree_Nut_LNS %>% subset(YEAR %in% c(2025, 2067, 2109, 2151, 2193, 2235, 2277, 2319, 2361, 2403, 2445, 2487
)) %>% subset(Month %in% 8)

Net_Removal_LNS$P_Brh<-as.numeric(Net_Removal_LNS$P_Brh)

Net_Removal_LNS<-Net_Removal_LNS %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/AEC_All.csv")

AEC_All_LNS<-AEC_All_LNS %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_LNS$SO4_Net<-diff(AEC_All_LNS$SO4) 


AEC_All_LNS$PO4_Net<-diff(AEC_All_LNS$PO4) 

AEC_All_LNS<-AEC_All_LNS %>% subset(Date %in% c('2005-08-01'))



Tot_Removed_LNS<-as.data.frame(Leaching_LNS$Ca+Net_Removal_LNS$Ca_F*0+Net_Removal_LNS$Ca_Bol*.97*.99+Net_Removal_LNS$Ca_Brh*0+Net_Removal_LNS$Ca_Brk*.9*.99) %>% rename(Ca_Tot=1)
Tot_Removed_LNS$Mg_Tot<-Leaching_LNS$Mg+Net_Removal_LNS$Mg_F*0+Net_Removal_LNS$Mg_Bol*.97*.99+Net_Removal_LNS$Mg_Brh*0+Net_Removal_LNS$Mg_Brk*.9*.99
Tot_Removed_LNS$K_Tot<-Leaching_LNS$K+Net_Removal_LNS$K_F*0+Net_Removal_LNS$K_Bol*.97*.99+Net_Removal_LNS$K_Brh*0+Net_Removal_LNS$K_Brk*.9*.99
Tot_Removed_LNS$N_Tot<-Leaching_LNS$NO3+Leaching_LNS$NH4+Net_Removal_LNS$N_F*0+Net_Removal_LNS$N_Bol*.97*.99+Net_Removal_LNS$N_Brh*0+Net_Removal_LNS$N_Brk*.9*.99
Tot_Removed_LNS$P_Tot<-AEC_All_LNS$PO4_Net+Leaching_LNS$P+Net_Removal_LNS$P_F*0+Net_Removal_LNS$P_Bol*.97*.99+Net_Removal_LNS$P_Brh*0+Net_Removal_LNS$P_Brk*.9*.99
Tot_Removed_LNS$S_Tot<-AEC_All_LNS$SO4_Net+Leaching_LNS$SO4+Net_Removal_LNS$S_F*0+Net_Removal_LNS$S_Bol*.97*.99+Net_Removal_LNS$S_Brh*0+Net_Removal_LNS$S_Brk*.9*.99

Tot_Removed_LNS$Ca_Har<-Net_Removal_LNS$Ca_F*0+Net_Removal_LNS$Ca_Bol*.97*.99+Net_Removal_LNS$Ca_Brh*0+Net_Removal_LNS$Ca_Brk*.9*.99
Tot_Removed_LNS$Mg_Har<-Net_Removal_LNS$Mg_F*0+Net_Removal_LNS$Mg_Bol*.97*.99+Net_Removal_LNS$Mg_Brh*0+Net_Removal_LNS$Mg_Brk*.9*.99
Tot_Removed_LNS$K_Har<-Net_Removal_LNS$K_F*0+Net_Removal_LNS$K_Bol*.97*.99+Net_Removal_LNS$K_Brh*0+Net_Removal_LNS$K_Brk*.9*.99
Tot_Removed_LNS$N_Har<-Net_Removal_LNS$N_F*0+Net_Removal_LNS$N_Bol*.97*.99+Net_Removal_LNS$N_Brh*0+Net_Removal_LNS$N_Brk*.9*.99
Tot_Removed_LNS$P_Har<-Net_Removal_LNS$P_F*0+Net_Removal_LNS$P_Bol*.97*.99+Net_Removal_LNS$P_Brh*0+Net_Removal_LNS$P_Brk*.9*.99
Tot_Removed_LNS$S_Har<-Net_Removal_LNS$S_F*0+Net_Removal_LNS$S_Bol*.97*.99+Net_Removal_LNS$S_Brh*0+Net_Removal_LNS$S_Brk*.9*.99

Tot_Removed_LNS$Ca_Leach<-Leaching_LNS$Ca
Tot_Removed_LNS$Mg_Leach<-Leaching_LNS$Mg
Tot_Removed_LNS$K_Leach<-Leaching_LNS$K
Tot_Removed_LNS$N_Leach<-Leaching_LNS$NO3+Leaching_LNS$NH4+Leaching_LNS$DON
Tot_Removed_LNS$P_Leach<-Leaching_LNS$P+Leaching_LNS$DOP
Tot_Removed_LNS$S_Leach<-Leaching_LNS$SO4

Tot_Removed_LNS$P_OCC<-AEC_All_LNS$PO4_Net
Tot_Removed_LNS$S_OCC<-AEC_All_LNS$SO4_Net

Tot_Removed_LNS$Site<-"LNS"




# LN BAS

Leaching_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_LNB<-Leaching_LNB %>% subset(group_id %in% 8 & YEAR %in% Years ) %>% summarise(across(Ca:DOP, ~sum(.x, na.rm=TRUE)))

Tree_Nut_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

Net_Removal_LNB<-Tree_Nut_LNB %>% subset(YEAR %in% c(2025, 2067, 2109, 2151, 2193, 2235, 2277, 2319, 2361, 2403, 2445, 2487
)) %>% subset(Month %in% 8)

Net_Removal_LNB$P_Brh<-as.numeric(Net_Removal_LNB$P_Brh)

Net_Removal_LNB<-Net_Removal_LNB %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/AEC_All.csv")

AEC_All_LNB<-AEC_All_LNB %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_LNB$SO4_Net<-diff(AEC_All_LNB$SO4) 


AEC_All_LNB$PO4_Net<-diff(AEC_All_LNB$PO4) 

AEC_All_LNB<-AEC_All_LNB %>% subset(Date %in% c('2005-08-01'))



Tot_Removed_LNB<-as.data.frame(Leaching_LNB$Ca+Net_Removal_LNB$Ca_F*0+Net_Removal_LNB$Ca_Bol*.97*.99+Net_Removal_LNB$Ca_Brh*0+Net_Removal_LNB$Ca_Brk*.9*.99) %>% rename(Ca_Tot=1)
Tot_Removed_LNB$Mg_Tot<-Leaching_LNB$Mg+Net_Removal_LNB$Mg_F*0+Net_Removal_LNB$Mg_Bol*.97*.99+Net_Removal_LNB$Mg_Brh*0+Net_Removal_LNB$Mg_Brk*.9*.99
Tot_Removed_LNB$K_Tot<-Leaching_LNB$K+Net_Removal_LNB$K_F*0+Net_Removal_LNB$K_Bol*.97*.99+Net_Removal_LNB$K_Brh*0+Net_Removal_LNB$K_Brk*.9*.99
Tot_Removed_LNB$N_Tot<-Leaching_LNB$NO3+Leaching_LNB$NH4+Net_Removal_LNB$N_F*0+Net_Removal_LNB$N_Bol*.97*.99+Net_Removal_LNB$N_Brh*0+Net_Removal_LNB$N_Brk*.9*.99
Tot_Removed_LNB$P_Tot<-AEC_All_LNB$PO4_Net+Leaching_LNB$P+Net_Removal_LNB$P_F*0+Net_Removal_LNB$P_Bol*.97*.99+Net_Removal_LNB$P_Brh*0+Net_Removal_LNB$P_Brk*.9*.99
Tot_Removed_LNB$S_Tot<-AEC_All_LNB$SO4_Net+Leaching_LNB$SO4+Net_Removal_LNB$S_F*0+Net_Removal_LNB$S_Bol*.97*.99+Net_Removal_LNB$S_Brh*0+Net_Removal_LNB$S_Brk*.9*.99

Tot_Removed_LNB$Ca_Har<-Net_Removal_LNB$Ca_F*0+Net_Removal_LNB$Ca_Bol*.97*.99+Net_Removal_LNB$Ca_Brh*0+Net_Removal_LNB$Ca_Brk*.9*.99
Tot_Removed_LNB$Mg_Har<-Net_Removal_LNB$Mg_F*0+Net_Removal_LNB$Mg_Bol*.97*.99+Net_Removal_LNB$Mg_Brh*0+Net_Removal_LNB$Mg_Brk*.9*.99
Tot_Removed_LNB$K_Har<-Net_Removal_LNB$K_F*0+Net_Removal_LNB$K_Bol*.97*.99+Net_Removal_LNB$K_Brh*0+Net_Removal_LNB$K_Brk*.9*.99
Tot_Removed_LNB$N_Har<-Net_Removal_LNB$N_F*0+Net_Removal_LNB$N_Bol*.97*.99+Net_Removal_LNB$N_Brh*0+Net_Removal_LNB$N_Brk*.9*.99
Tot_Removed_LNB$P_Har<-Net_Removal_LNB$P_F*0+Net_Removal_LNB$P_Bol*.97*.99+Net_Removal_LNB$P_Brh*0+Net_Removal_LNB$P_Brk*.9*.99
Tot_Removed_LNB$S_Har<-Net_Removal_LNB$S_F*0+Net_Removal_LNB$S_Bol*.97*.99+Net_Removal_LNB$S_Brh*0+Net_Removal_LNB$S_Brk*.9*.99

Tot_Removed_LNB$Ca_Leach<-Leaching_LNB$Ca
Tot_Removed_LNB$Mg_Leach<-Leaching_LNB$Mg
Tot_Removed_LNB$K_Leach<-Leaching_LNB$K
Tot_Removed_LNB$N_Leach<-Leaching_LNB$NO3+Leaching_LNB$NH4
Tot_Removed_LNB$P_Leach<-Leaching_LNB$P+Leaching_LNB$DOP
Tot_Removed_LNB$S_Leach<-Leaching_LNB$SO4

Tot_Removed_LNB$P_OCC<-AEC_All_LNB$PO4_Net
Tot_Removed_LNB$S_OCC<-AEC_All_LNB$SO4_Net

Tot_Removed_LNB$Site<-"LNB"




# HN SED

Leaching_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_HNS<-Leaching_HNS %>% subset(group_id %in% 8 & YEAR %in% Years ) %>% summarise(across(Ca:DOP, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

Net_Removal_HNS<-Tree_Nut_HNS %>% subset(YEAR %in% c(2025, 2067, 2109, 2151, 2193, 2235, 2277, 2319, 2361, 2403, 2445, 2487
)) %>% subset(Month %in% 8)

Net_Removal_HNS$P_Brh<-as.numeric(Net_Removal_HNS$P_Brh)

Net_Removal_HNS<-Net_Removal_HNS %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/AEC_All.csv")

AEC_All_HNS<-AEC_All_HNS %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_HNS$SO4_Net<-diff(AEC_All_HNS$SO4) 


AEC_All_HNS$PO4_Net<-diff(AEC_All_HNS$PO4) 

AEC_All_HNS<-AEC_All_HNS %>% subset(Date %in% c('2005-08-01'))



Tot_Removed_HNS<-as.data.frame(Leaching_HNS$Ca+Net_Removal_HNS$Ca_F*0+Net_Removal_HNS$Ca_Bol*.97*.99+Net_Removal_HNS$Ca_Brh*0+Net_Removal_HNS$Ca_Brk*.9*.99) %>% rename(Ca_Tot=1)
Tot_Removed_HNS$Mg_Tot<-Leaching_HNS$Mg+Net_Removal_HNS$Mg_F*0+Net_Removal_HNS$Mg_Bol*.97*.99+Net_Removal_HNS$Mg_Brh*0+Net_Removal_HNS$Mg_Brk*.9*.99
Tot_Removed_HNS$K_Tot<-Leaching_HNS$K+Net_Removal_HNS$K_F*0+Net_Removal_HNS$K_Bol*.97*.99+Net_Removal_HNS$K_Brh*0+Net_Removal_HNS$K_Brk*.9*.99
Tot_Removed_HNS$N_Tot<-Leaching_HNS$NO3+Leaching_HNS$NH4+Net_Removal_HNS$N_F*0+Net_Removal_HNS$N_Bol*.97*.99+Net_Removal_HNS$N_Brh*0+Net_Removal_HNS$N_Brk*.9*.99
Tot_Removed_HNS$P_Tot<-AEC_All_HNS$PO4_Net+Leaching_HNS$P+Net_Removal_HNS$P_F*0+Net_Removal_HNS$P_Bol*.97*.99+Net_Removal_HNS$P_Brh*0+Net_Removal_HNS$P_Brk*.9*.99
Tot_Removed_HNS$S_Tot<-AEC_All_HNS$SO4_Net+Leaching_HNS$SO4+Net_Removal_HNS$S_F*0+Net_Removal_HNS$S_Bol*.97*.99+Net_Removal_HNS$S_Brh*0+Net_Removal_HNS$S_Brk*.9*.99

Tot_Removed_HNS$Ca_Har<-Net_Removal_HNS$Ca_F*0+Net_Removal_HNS$Ca_Bol*.97*.99+Net_Removal_HNS$Ca_Brh*0+Net_Removal_HNS$Ca_Brk*.9*.99
Tot_Removed_HNS$Mg_Har<-Net_Removal_HNS$Mg_F*0+Net_Removal_HNS$Mg_Bol*.97*.99+Net_Removal_HNS$Mg_Brh*0+Net_Removal_HNS$Mg_Brk*.9*.99
Tot_Removed_HNS$K_Har<-Net_Removal_HNS$K_F*0+Net_Removal_HNS$K_Bol*.97*.99+Net_Removal_HNS$K_Brh*0+Net_Removal_HNS$K_Brk*.9*.99
Tot_Removed_HNS$N_Har<-Net_Removal_HNS$N_F*0+Net_Removal_HNS$N_Bol*.97*.99+Net_Removal_HNS$N_Brh*0+Net_Removal_HNS$N_Brk*.9*.99
Tot_Removed_HNS$P_Har<-Net_Removal_HNS$P_F*0+Net_Removal_HNS$P_Bol*.97*.99+Net_Removal_HNS$P_Brh*0+Net_Removal_HNS$P_Brk*.9*.99
Tot_Removed_HNS$S_Har<-Net_Removal_HNS$S_F*0+Net_Removal_HNS$S_Bol*.97*.99+Net_Removal_HNS$S_Brh*0+Net_Removal_HNS$S_Brk*.9*.99

Tot_Removed_HNS$Ca_Leach<-Leaching_HNS$Ca
Tot_Removed_HNS$Mg_Leach<-Leaching_HNS$Mg
Tot_Removed_HNS$K_Leach<-Leaching_HNS$K
Tot_Removed_HNS$N_Leach<-Leaching_HNS$NO3+Leaching_HNS$NH4+ Leaching_HNS$DON
Tot_Removed_HNS$P_Leach<-Leaching_HNS$P+Leaching_HNS$DOP
Tot_Removed_HNS$S_Leach<-Leaching_HNS$SO4

Tot_Removed_HNS$P_OCC<-AEC_All_HNS$PO4_Net
Tot_Removed_HNS$S_OCC<-AEC_All_HNS$SO4_Net

Tot_Removed_HNS$Site<-"HNS"

# HN BAS

Leaching_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_HNB<-Leaching_HNB %>% subset(group_id %in% 8 & YEAR %in% Years ) %>% summarise(across(Ca:DOP, ~sum(.x, na.rm=TRUE)))

Tree_Nut_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

Net_Removal_HNB<-Tree_Nut_HNB %>% subset(YEAR %in% c(2025, 2067, 2109, 2151, 2193, 2235, 2277, 2319, 2361, 2403, 2445, 2487
)) %>% subset(Month %in% 8)

Net_Removal_HNB$P_Brh<-as.numeric(Net_Removal_HNB$P_Brh)

Net_Removal_HNB<-Net_Removal_HNB %>% summarise(across(DW_F:P_Bol, ~sum(.x, na.rm=TRUE)))


AEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/AEC_All.csv")

AEC_All_HNB<-AEC_All_HNB %>% subset(Date %in% c('2005-08-01', '2505-08-01')) %>% 
  group_by(Date) %>% summarise(across(SO4:Cl, ~sum(.x, na.rm=TRUE)))

AEC_All_HNB$SO4_Net<-diff(AEC_All_HNB$SO4) 


AEC_All_HNB$PO4_Net<-diff(AEC_All_HNB$PO4) 

AEC_All_HNB<-AEC_All_HNB %>% subset(Date %in% c('2005-08-01'))



Tot_Removed_HNB<-as.data.frame(Leaching_HNB$Ca+Net_Removal_HNB$Ca_F*0+Net_Removal_HNB$Ca_Bol*.97*.99+Net_Removal_HNB$Ca_Brh*0+Net_Removal_HNB$Ca_Brk*.9*.99) %>% rename(Ca_Tot=1)
Tot_Removed_HNB$Mg_Tot<-Leaching_HNB$Mg+Net_Removal_HNB$Mg_F*0+Net_Removal_HNB$Mg_Bol*.97*.99+Net_Removal_HNB$Mg_Brh*0+Net_Removal_HNB$Mg_Brk*.9*.99
Tot_Removed_HNB$K_Tot<-Leaching_HNB$K+Net_Removal_HNB$K_F*0+Net_Removal_HNB$K_Bol*.97*.99+Net_Removal_HNB$K_Brh*0+Net_Removal_HNB$K_Brk*.9*.99
Tot_Removed_HNB$N_Tot<-Leaching_HNB$NO3+Leaching_HNB$NH4+Net_Removal_HNB$N_F*0+Net_Removal_HNB$N_Bol*.97*.99+Net_Removal_HNB$N_Brh*0+Net_Removal_HNB$N_Brk*.9*.99
Tot_Removed_HNB$P_Tot<-AEC_All_HNB$PO4_Net+Leaching_HNB$P+Net_Removal_HNB$P_F*0+Net_Removal_HNB$P_Bol*.97*.99+Net_Removal_HNB$P_Brh*0+Net_Removal_HNB$P_Brk*.9*.99
Tot_Removed_HNB$S_Tot<-AEC_All_HNB$SO4_Net+Leaching_HNB$SO4+Net_Removal_HNB$S_F*0+Net_Removal_HNB$S_Bol*.97*.99+Net_Removal_HNB$S_Brh*0+Net_Removal_HNB$S_Brk*.9*.99

Tot_Removed_HNB$Ca_Har<-Net_Removal_HNB$Ca_F*0+Net_Removal_HNB$Ca_Bol*.97*.99+Net_Removal_HNB$Ca_Brh*0+Net_Removal_HNB$Ca_Brk*.9*.99
Tot_Removed_HNB$Mg_Har<-Net_Removal_HNB$Mg_F*0+Net_Removal_HNB$Mg_Bol*.97*.99+Net_Removal_HNB$Mg_Brh*0+Net_Removal_HNB$Mg_Brk*.9*.99
Tot_Removed_HNB$K_Har<-Net_Removal_HNB$K_F*0+Net_Removal_HNB$K_Bol*.97*.99+Net_Removal_HNB$K_Brh*0+Net_Removal_HNB$K_Brk*.9*.99
Tot_Removed_HNB$N_Har<-Net_Removal_HNB$N_F*0+Net_Removal_HNB$N_Bol*.97*.99+Net_Removal_HNB$N_Brh*0+Net_Removal_HNB$N_Brk*.9*.99
Tot_Removed_HNB$P_Har<-Net_Removal_HNB$P_F*0+Net_Removal_HNB$P_Bol*.97*.99+Net_Removal_HNB$P_Brh*0+Net_Removal_HNB$P_Brk*.9*.99
Tot_Removed_HNB$S_Har<-Net_Removal_HNB$S_F*0+Net_Removal_HNB$S_Bol*.97*.99+Net_Removal_HNB$S_Brh*0+Net_Removal_HNB$S_Brk*.9*.99

Tot_Removed_HNB$Ca_Leach<-Leaching_HNB$Ca
Tot_Removed_HNB$Mg_Leach<-Leaching_HNB$Mg
Tot_Removed_HNB$K_Leach<-Leaching_HNB$K
Tot_Removed_HNB$N_Leach<-Leaching_HNB$NO3+Leaching_HNB$NH4+Leaching_HNB$DON
Tot_Removed_HNB$P_Leach<-Leaching_HNB$P+Leaching_HNB$DOP 
Tot_Removed_HNB$S_Leach<-Leaching_HNB$SO4

Tot_Removed_HNB$P_OCC<-AEC_All_HNB$PO4_Net
Tot_Removed_HNB$S_OCC<-AEC_All_HNB$SO4_Net

Tot_Removed_HNB$Site<-"HNB"


Loss_40BO<-rbind(Tot_Removed_LNS, Tot_Removed_LNB, Tot_Removed_HNS ,Tot_Removed_HNB)

Loss_40BO$Treatment<-"40BO"

write.csv(Loss_40BO, "Loss4B.csv")