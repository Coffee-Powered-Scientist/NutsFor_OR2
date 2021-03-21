
rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)

# Read in Data with 500 years applied harvest

# 40_WTH LN SED

WTH_40_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data/Tree_Nut_All.csv")

WTH_40_LNSED_H1<-WTH_40_LNSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
    mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low") %>% 
      select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNSED_H2<- WTH_40_LNSED %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
    mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low") %>% 
      select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNSED_H3<-WTH_40_LNSED %>%
  filter(YEAR == "2109" & Month == "8") %>%
    mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low") %>%
        select(Harvest, Rock_Type, N, matches ("DW"))


WTH_40_LNSED_H1_MELT<-melt(WTH_40_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNSED_H2_MELT<-melt(WTH_40_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H3_MELT<-melt(WTH_40_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))

# 40_WTH LN BAS

WTH_40_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Edited Data/Tree_Nut_All.csv")

WTH_40_LNBAS_H1<-WTH_40_LNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type,N ,matches("DW"))

WTH_40_LNBAS_H2<- WTH_40_LNBAS %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type, N , matches("DW"))

WTH_40_LNBAS_H3<-WTH_40_LNBAS %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_LNBAS_H1_MELT<-melt(WTH_40_LNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNBAS_H2_MELT<-melt(WTH_40_LNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H3_MELT<-melt(WTH_40_LNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))

# 40_WTH HN SED

WTH_40_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data/Tree_Nut_All.csv")

WTH_40_HNSED_H1<-WTH_40_NSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNSED_H2<- WTH_40_HNSED %>% 
  filter(YEAR == "2067" & Month == "7") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))


WTH_40_HNSED_H1_MELT<-melt(WTH_40_HNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNSED_H2_MELT<-melt(WTH_40_HNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))





Biomass_Master<-rbind(WTH_40_LNSED_H1_MELT, WTH_40_LNSED_H2_MELT, WTH_40_LNSED_H3_MELT, WTH_40_LNBAS_H1_MELT,
                      WTH_40_LNBAS_H2_MELT, WTH_40_LNBAS_H3_MELT)


# Graphs


ggplot(Biomass_Master, aes(fill=variable, y=value, x=Harvest, group=N)) + 
  geom_bar(position="stack", stat="identity")+ facet_grid(~Rock_Type+N)


  
# BOH

# Read in Data with 500 years applied harvest

# 40_BO LN SED

BO_40_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_LNSED_H1<-BO_40_LNSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H2<- BO_40_LNSED %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H3<-BO_40_LNSED %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))


BO_40_LNSED_H1_MELT<-melt(BO_40_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNSED_H2_MELT<-melt(BO_40_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H3_MELT<-melt(BO_40_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))

Biomass_Master_BO<-rbind(BO_40_LNSED_H1_MELT, BO_40_LNSED_H2_MELT, BO_40_LNSED_H3_MELT)  

ggplot(Biomass_Master_BO, aes(fill=variable, y=value, x=Harvest, group=N)) + 
  geom_bar(position="stack", stat="identity")+ facet_grid(~Rock_Type+N)

  
  