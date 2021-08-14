
rm(list = ls())

library(dplyr)
library(reshape2)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated")


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

BO_40_LNSED_H4<-BO_40_LNSED %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H5<- BO_40_LNSED %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H6<-BO_40_LNSED %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNSED_H7<-BO_40_LNSED %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H8<- BO_40_LNSED %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H9<-BO_40_LNSED %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNSED_H10<-BO_40_LNSED %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H11<- BO_40_LNSED %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H12<- BO_40_LNSED %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))



BO_40_LNSED_H1_MELT<-melt(BO_40_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNSED_H2_MELT<-melt(BO_40_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H3_MELT<-melt(BO_40_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H4_MELT<-melt(BO_40_LNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNSED_H5_MELT<-melt(BO_40_LNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H6_MELT<-melt(BO_40_LNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H7_MELT<-melt(BO_40_LNSED_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNSED_H8_MELT<-melt(BO_40_LNSED_H8, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H9_MELT<-melt(BO_40_LNSED_H9, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H10_MELT<-melt(BO_40_LNSED_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNSED_H11_MELT<-melt(BO_40_LNSED_H11, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNSED_H12_MELT<-melt(BO_40_LNSED_H12, id.vars = c("Harvest", "Rock_Type", "N"))


BO_40_LNSED_Tot<-rbind(BO_40_LNSED_H1_MELT, BO_40_LNSED_H2_MELT, BO_40_LNSED_H3_MELT, BO_40_LNSED_H4_MELT, BO_40_LNSED_H5_MELT, BO_40_LNSED_H6_MELT, 
      BO_40_LNSED_H7_MELT, BO_40_LNSED_H8_MELT, BO_40_LNSED_H9_MELT, BO_40_LNSED_H10_MELT, BO_40_LNSED_H11_MELT, BO_40_LNSED_H12_MELT)

BO_40_LNSED_SUM<-sum(BO_40_LNSED_Tot$value)
BO_40_LNSED_Bol<-subset(BO_40_LNSED_Tot, variable %in% c("DW_Bol"))
BO_40_LNSED_Bol_SUM<-sum(BO_40_LNSED_Bol$value)


# 40 BO LN BAS

BO_40_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_LNBAS_H1<-BO_40_LNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H2<- BO_40_LNBAS %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H3<-BO_40_LNBAS %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNBAS_H4<-BO_40_LNBAS %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H5<- BO_40_LNBAS %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H6<-BO_40_LNBAS %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNBAS_H7<-BO_40_LNBAS %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H8<- BO_40_LNBAS %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H9<-BO_40_LNBAS %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNBAS_H10<-BO_40_LNBAS %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H11<- BO_40_LNBAS %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H12<- BO_40_LNBAS %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))



BO_40_LNBAS_H1_MELT<-melt(BO_40_LNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNBAS_H2_MELT<-melt(BO_40_LNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H3_MELT<-melt(BO_40_LNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H4_MELT<-melt(BO_40_LNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNBAS_H5_MELT<-melt(BO_40_LNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H6_MELT<-melt(BO_40_LNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H7_MELT<-melt(BO_40_LNBAS_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNBAS_H8_MELT<-melt(BO_40_LNBAS_H8, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H9_MELT<-melt(BO_40_LNBAS_H9, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H10_MELT<-melt(BO_40_LNBAS_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_LNBAS_H11_MELT<-melt(BO_40_LNBAS_H11, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_LNBAS_H12_MELT<-melt(BO_40_LNBAS_H12, id.vars = c("Harvest", "Rock_Type", "N"))

BO_40_LNBAS_Tot<-rbind(BO_40_LNBAS_H1_MELT, BO_40_LNBAS_H2_MELT, BO_40_LNBAS_H3_MELT, BO_40_LNBAS_H4_MELT, BO_40_LNBAS_H5_MELT, BO_40_LNBAS_H6_MELT, 
                       BO_40_LNBAS_H7_MELT, BO_40_LNBAS_H8_MELT, BO_40_LNBAS_H9_MELT, BO_40_LNBAS_H10_MELT, BO_40_LNBAS_H11_MELT, BO_40_LNBAS_H12_MELT)

BO_40_LNBAS_SUM<-sum(BO_40_LNBAS_Tot$value)
BO_40_LNBAS_Bol<-subset(BO_40_LNBAS_Tot, variable %in% c("DW_Bol"))
BO_40_LNBAS_Bol_SUM<-sum(BO_40_LNBAS_Bol$value)


# 40_BO HN BAS

BO_40_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_HNBAS_H1<-BO_40_HNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H2<- BO_40_HNBAS %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H3<-BO_40_HNBAS %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNBAS_H4<-BO_40_HNBAS %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H5<- BO_40_HNBAS %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H6<-BO_40_HNBAS %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNBAS_H7<-BO_40_HNBAS %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H8<- BO_40_HNBAS %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H9<-BO_40_HNBAS %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNBAS_H10<-BO_40_HNBAS %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H11<- BO_40_HNBAS %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H12<- BO_40_HNBAS %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))


BO_40_HNBAS_H1_MELT<-melt(BO_40_HNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNBAS_H2_MELT<-melt(BO_40_HNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H3_MELT<-melt(BO_40_HNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H4_MELT<-melt(BO_40_HNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNBAS_H5_MELT<-melt(BO_40_HNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H6_MELT<-melt(BO_40_HNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H7_MELT<-melt(BO_40_HNBAS_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNBAS_H8_MELT<-melt(BO_40_HNBAS_H8, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H9_MELT<-melt(BO_40_HNBAS_H9, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H10_MELT<-melt(BO_40_HNBAS_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNBAS_H11_MELT<-melt(BO_40_HNBAS_H11, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNBAS_H12_MELT<-melt(BO_40_HNBAS_H12, id.vars = c("Harvest", "Rock_Type", "N"))

BO_40_HNBAS_Tot<-rbind(BO_40_HNBAS_H1_MELT, BO_40_HNBAS_H2_MELT, BO_40_HNBAS_H3_MELT, BO_40_HNBAS_H4_MELT, BO_40_HNBAS_H5_MELT, BO_40_HNBAS_H6_MELT, 
                       BO_40_HNBAS_H7_MELT, BO_40_HNBAS_H8_MELT, BO_40_HNBAS_H9_MELT, BO_40_HNBAS_H10_MELT, BO_40_HNBAS_H11_MELT, BO_40_HNBAS_H12_MELT)

BO_40_HNBAS_SUM<-sum(BO_40_HNBAS_Tot$value)
BO_40_HNBAS_Bol<-subset(BO_40_HNBAS_Tot, variable %in% c("DW_Bol"))
BO_40_HNBAS_Bol_SUM<-sum(BO_40_HNBAS_Bol$value)


# 40 BO HN SED

BO_40_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_HNSED_H1<-BO_40_HNSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H2<- BO_40_HNSED %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H3<-BO_40_HNSED %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNSED_H4<-BO_40_HNSED %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H5<- BO_40_HNSED %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H6<-BO_40_HNSED %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNSED_H7<-BO_40_HNSED %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H8<- BO_40_HNSED %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H9<-BO_40_HNSED %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNSED_H10<-BO_40_HNSED %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H11<- BO_40_HNSED %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H12<- BO_40_HNSED %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))



BO_40_HNSED_H1_MELT<-melt(BO_40_HNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNSED_H2_MELT<-melt(BO_40_HNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H3_MELT<-melt(BO_40_HNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H4_MELT<-melt(BO_40_HNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNSED_H5_MELT<-melt(BO_40_HNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H6_MELT<-melt(BO_40_HNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H7_MELT<-melt(BO_40_HNSED_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNSED_H8_MELT<-melt(BO_40_HNSED_H8, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H9_MELT<-melt(BO_40_HNSED_H9, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H10_MELT<-melt(BO_40_HNSED_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_40_HNSED_H11_MELT<-melt(BO_40_HNSED_H11, id.vars = c("Harvest", "Rock_Type", "N"))
BO_40_HNSED_H12_MELT<-melt(BO_40_HNSED_H12, id.vars = c("Harvest", "Rock_Type", "N"))

BO_40_HNSED_Tot<-rbind(BO_40_HNSED_H1_MELT, BO_40_HNSED_H2_MELT, BO_40_HNSED_H3_MELT, BO_40_HNSED_H4_MELT, BO_40_HNSED_H5_MELT, BO_40_HNSED_H6_MELT, 
                       BO_40_HNSED_H7_MELT, BO_40_HNSED_H8_MELT, BO_40_HNSED_H9_MELT, BO_40_HNSED_H10_MELT, BO_40_HNSED_H11_MELT, BO_40_HNSED_H12_MELT)

BO_40_HNSED_SUM<-sum(BO_40_HNSED_Tot$value)
BO_40_HNSED_Bol<-subset(BO_40_HNSED_Tot, variable %in% c("DW_Bol"))
BO_40_HNSED_Bol_SUM<-sum(BO_40_HNSED_Bol$value)

BO_40_Tot<-cbind(BO_40_LNBAS_SUM, BO_40_HNBAS_SUM, BO_40_LNSED_SUM, BO_40_HNSED_SUM)

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

WTH_40_LNSED_H4<-WTH_40_LNSED %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNSED_H5<- WTH_40_LNSED %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNSED_H6<-WTH_40_LNSED %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_LNSED_H7<-WTH_40_LNSED %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNSED_H8<- WTH_40_LNSED %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNSED_H9<-WTH_40_LNSED %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_LNSED_H10<-WTH_40_LNSED %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNSED_H11<- WTH_40_LNSED %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNSED_H12<- WTH_40_LNSED %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))



WTH_40_LNSED_H1_MELT<-melt(WTH_40_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNSED_H2_MELT<-melt(WTH_40_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H3_MELT<-melt(WTH_40_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H4_MELT<-melt(WTH_40_LNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNSED_H5_MELT<-melt(WTH_40_LNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H6_MELT<-melt(WTH_40_LNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H7_MELT<-melt(WTH_40_LNSED_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNSED_H8_MELT<-melt(WTH_40_LNSED_H8, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H9_MELT<-melt(WTH_40_LNSED_H9, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H10_MELT<-melt(WTH_40_LNSED_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNSED_H11_MELT<-melt(WTH_40_LNSED_H11, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNSED_H12_MELT<-melt(WTH_40_LNSED_H12, id.vars = c("Harvest", "Rock_Type", "N"))

WTH_40_LNSED_Tot<-rbind(WTH_40_LNSED_H1_MELT, WTH_40_LNSED_H2_MELT, WTH_40_LNSED_H3_MELT, WTH_40_LNSED_H4_MELT, WTH_40_LNSED_H5_MELT, WTH_40_LNSED_H6_MELT, 
                        WTH_40_LNSED_H7_MELT, WTH_40_LNSED_H8_MELT, WTH_40_LNSED_H9_MELT, WTH_40_LNSED_H10_MELT, WTH_40_LNSED_H11_MELT, WTH_40_LNSED_H12_MELT)

WTH_40_LNSED_SUM<-sum(WTH_40_LNSED_Tot$value)
WTH_40_LNSED_Bol<-subset(WTH_40_LNSED_Tot, variable %in% c("DW_Bol"))
WTH_40_LNSED_Bol_SUM<-sum(WTH_40_LNSED_Bol$value)

# 40 BO LN BAS

WTH_40_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Edited Data/Tree_Nut_All.csv")

WTH_40_LNBAS_H1<-WTH_40_LNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNBAS_H2<- WTH_40_LNBAS %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNBAS_H3<-WTH_40_LNBAS %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_LNBAS_H4<-WTH_40_LNBAS %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNBAS_H5<- WTH_40_LNBAS %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNBAS_H6<-WTH_40_LNBAS %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_LNBAS_H7<-WTH_40_LNBAS %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNBAS_H8<- WTH_40_LNBAS %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNBAS_H9<-WTH_40_LNBAS %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_LNBAS_H10<-WTH_40_LNBAS %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_LNBAS_H11<- WTH_40_LNBAS %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_LNBAS_H12<- WTH_40_LNBAS %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))


WTH_40_LNBAS_H1_MELT<-melt(WTH_40_LNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNBAS_H2_MELT<-melt(WTH_40_LNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H3_MELT<-melt(WTH_40_LNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H4_MELT<-melt(WTH_40_LNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNBAS_H5_MELT<-melt(WTH_40_LNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H6_MELT<-melt(WTH_40_LNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H7_MELT<-melt(WTH_40_LNBAS_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNBAS_H8_MELT<-melt(WTH_40_LNBAS_H8, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H9_MELT<-melt(WTH_40_LNBAS_H9, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H10_MELT<-melt(WTH_40_LNBAS_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_LNBAS_H11_MELT<-melt(WTH_40_LNBAS_H11, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_LNBAS_H12_MELT<-melt(WTH_40_LNBAS_H12, id.vars = c("Harvest", "Rock_Type", "N"))

WTH_40_LNBAS_Tot<-rbind(WTH_40_LNBAS_H1_MELT, WTH_40_LNBAS_H2_MELT, WTH_40_LNBAS_H3_MELT, WTH_40_LNBAS_H4_MELT, WTH_40_LNBAS_H5_MELT, WTH_40_LNBAS_H6_MELT, 
                        WTH_40_LNBAS_H7_MELT, WTH_40_LNBAS_H8_MELT, WTH_40_LNBAS_H9_MELT, WTH_40_LNBAS_H10_MELT, WTH_40_LNBAS_H11_MELT, WTH_40_LNBAS_H12_MELT)

WTH_40_LNBAS_SUM<-sum(WTH_40_LNBAS_Tot$value)
WTH_40_LNBAS_Bol<-subset(WTH_40_LNBAS_Tot, variable %in% c("DW_Bol"))
WTH_40_LNBAS_Bol_SUM<-sum(WTH_40_LNBAS_Bol$value)


# 40_WTH HN BAS

WTH_40_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Tree_Nut_All.csv")

WTH_40_HNBAS_H1<-WTH_40_HNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNBAS_H2<- WTH_40_HNBAS %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNBAS_H3<-WTH_40_HNBAS %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_HNBAS_H4<-WTH_40_HNBAS %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNBAS_H5<- WTH_40_HNBAS %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNBAS_H6<-WTH_40_HNBAS %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_HNBAS_H7<-WTH_40_HNBAS %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNBAS_H8<- WTH_40_HNBAS %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNBAS_H9<-WTH_40_HNBAS %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_HNBAS_H10<-WTH_40_HNBAS %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNBAS_H11<- WTH_40_HNBAS %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNBAS_H12<- WTH_40_HNBAS %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))



WTH_40_HNBAS_H1_MELT<-melt(WTH_40_HNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNBAS_H2_MELT<-melt(WTH_40_HNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H3_MELT<-melt(WTH_40_HNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H4_MELT<-melt(WTH_40_HNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNBAS_H5_MELT<-melt(WTH_40_HNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H6_MELT<-melt(WTH_40_HNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H7_MELT<-melt(WTH_40_HNBAS_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNBAS_H8_MELT<-melt(WTH_40_HNBAS_H8, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H9_MELT<-melt(WTH_40_HNBAS_H9, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H10_MELT<-melt(WTH_40_HNBAS_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNBAS_H11_MELT<-melt(WTH_40_HNBAS_H11, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNBAS_H12_MELT<-melt(WTH_40_HNBAS_H12, id.vars = c("Harvest", "Rock_Type", "N"))

WTH_40_HNBAS_Tot<-rbind(WTH_40_HNBAS_H1_MELT, WTH_40_HNBAS_H2_MELT, WTH_40_HNBAS_H3_MELT, WTH_40_HNBAS_H4_MELT, WTH_40_HNBAS_H5_MELT, WTH_40_HNBAS_H6_MELT, 
                        WTH_40_HNBAS_H7_MELT, WTH_40_HNBAS_H8_MELT, WTH_40_HNBAS_H9_MELT, WTH_40_HNBAS_H10_MELT, WTH_40_HNBAS_H11_MELT,  WTH_40_HNBAS_H12_MELT)

WTH_40_HNBAS_SUM<-sum(WTH_40_HNBAS_Tot$value)
WTH_40_HNBAS_Bol<-subset(WTH_40_HNBAS_Tot, variable %in% c("DW_Bol"))
WTH_40_HNBAS_Bol_SUM<-sum(WTH_40_HNBAS_Bol$value)

# 40 BO HN SED

WTH_40_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data/Tree_Nut_All.csv")

WTH_40_HNSED_H1<-WTH_40_HNSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNSED_H2<- WTH_40_HNSED %>% 
  filter(YEAR == "2067" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNSED_H3<-WTH_40_HNSED %>%
  filter(YEAR == "2109" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_HNSED_H4<-WTH_40_HNSED %>% 
  filter(YEAR == "2151" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNSED_H5<- WTH_40_HNSED %>% 
  filter(YEAR == "2193" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNSED_H6<-WTH_40_HNSED %>%
  filter(YEAR == "2235" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_HNSED_H7<-WTH_40_HNSED %>% 
  filter(YEAR == "2277" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNSED_H8<- WTH_40_HNSED %>% 
  filter(YEAR == "2319" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNSED_H9<-WTH_40_HNSED %>%
  filter(YEAR == "2361" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_40_HNSED_H10<-WTH_40_HNSED %>% 
  filter(YEAR == "2403" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_40_HNSED_H11<- WTH_40_HNSED %>% 
  filter(YEAR == "2445" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_40_HNSED_H12<- WTH_40_HNSED %>% 
  filter(YEAR == "2487" & Month == "8") %>% 
  mutate(Harvest="H12", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))



WTH_40_HNSED_H1_MELT<-melt(WTH_40_HNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNSED_H2_MELT<-melt(WTH_40_HNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H3_MELT<-melt(WTH_40_HNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H4_MELT<-melt(WTH_40_HNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNSED_H5_MELT<-melt(WTH_40_HNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H6_MELT<-melt(WTH_40_HNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H7_MELT<-melt(WTH_40_HNSED_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNSED_H8_MELT<-melt(WTH_40_HNSED_H8, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H9_MELT<-melt(WTH_40_HNSED_H9, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H10_MELT<-melt(WTH_40_HNSED_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_40_HNSED_H11_MELT<-melt(WTH_40_HNSED_H11, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_40_HNSED_H12_MELT<-melt(WTH_40_HNSED_H12, id.vars = c("Harvest", "Rock_Type", "N"))

WTH_40_HNSED_Tot<-rbind(WTH_40_HNSED_H1_MELT, WTH_40_HNSED_H2_MELT, WTH_40_HNSED_H3_MELT, WTH_40_HNSED_H4_MELT, WTH_40_HNSED_H5_MELT, WTH_40_HNSED_H6_MELT, 
                        WTH_40_HNSED_H7_MELT, WTH_40_HNSED_H8_MELT, WTH_40_HNSED_H9_MELT, WTH_40_HNSED_H10_MELT, WTH_40_HNSED_H11_MELT, WTH_40_HNSED_H12_MELT)

WTH_40_HNSED_SUM<-sum(WTH_40_HNSED_Tot$value)
WTH_40_HNSED_Bol<-subset(WTH_40_HNSED_Tot, variable %in% c("DW_Bol"))
WTH_40_HNSED_Bol_SUM<-sum(WTH_40_HNSED_Bol$value)


WTH_40_Tot<-cbind(WTH_40_LNBAS_SUM, WTH_40_HNBAS_SUM, WTH_40_LNSED_SUM, WTH_40_HNSED_SUM)


BO_80_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Tree_Nut_All.csv")

BO_80_LNSED_H1<-BO_80_LNSED %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_LNSED_H2<- BO_80_LNSED %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_LNSED_H3<-BO_80_LNSED %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_80_LNSED_H4<-BO_80_LNSED %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_LNSED_H5<- BO_80_LNSED %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_LNSED_H6<-BO_80_LNSED %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))







BO_80_LNSED_H1_MELT<-melt(BO_80_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_LNSED_H2_MELT<-melt(BO_80_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_LNSED_H3_MELT<-melt(BO_80_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_LNSED_H4_MELT<-melt(BO_80_LNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_LNSED_H5_MELT<-melt(BO_80_LNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_LNSED_H6_MELT<-melt(BO_80_LNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))

BO_80_LNSED_Tot<-rbind(BO_80_LNSED_H1_MELT, BO_80_LNSED_H2_MELT, BO_80_LNSED_H3_MELT, BO_80_LNSED_H4_MELT, BO_80_LNSED_H5_MELT, BO_80_LNSED_H6_MELT)

BO_80_LNSED_SUM<-sum(BO_80_LNSED_Tot$value)
BO_80_LNSED_Bol<-subset(BO_80_LNSED_Tot, variable %in% c("DW_Bol"))
BO_80_LNSED_Bol_SUM<-sum(BO_80_LNSED_Bol$value)

# 80_BO LN BAS

BO_80_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Tree_Nut_All.csv")

BO_80_LNBAS_H1<-BO_80_LNBAS %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_LNBAS_H2<- BO_80_LNBAS %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_LNBAS_H3<-BO_80_LNBAS %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_80_LNBAS_H4<-BO_80_LNBAS %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_LNBAS_H5<- BO_80_LNBAS %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_LNBAS_H6<-BO_80_LNBAS %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))






BO_80_LNBAS_H1_MELT<-melt(BO_80_LNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_LNBAS_H2_MELT<-melt(BO_80_LNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_LNBAS_H3_MELT<-melt(BO_80_LNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_LNBAS_H4_MELT<-melt(BO_80_LNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_LNBAS_H5_MELT<-melt(BO_80_LNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_LNBAS_H6_MELT<-melt(BO_80_LNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))


BO_80_LNBAS_Tot<-rbind(BO_80_LNBAS_H1_MELT, BO_80_LNBAS_H2_MELT, BO_80_LNBAS_H3_MELT, BO_80_LNBAS_H4_MELT, BO_80_LNBAS_H5_MELT, BO_80_LNBAS_H6_MELT)

BO_80_LNBAS_SUM<-sum(BO_80_LNBAS_Tot$value)
BO_80_LNBAS_Bol<-subset(BO_80_LNBAS_Tot, variable %in% c("DW_Bol"))
BO_80_LNBAS_Bol_SUM<-sum(BO_80_LNBAS_Bol$value)


# 80_BO HN BAS

BO_80_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Tree_Nut_All.csv")

BO_80_HNBAS_H1<-BO_80_HNBAS %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_HNBAS_H2<- BO_80_HNBAS %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_HNBAS_H3<-BO_80_HNBAS %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_80_HNBAS_H4<-BO_80_HNBAS %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_HNBAS_H5<- BO_80_HNBAS %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_HNBAS_H6<-BO_80_HNBAS %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))





BO_80_HNBAS_H1_MELT<-melt(BO_80_HNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_HNBAS_H2_MELT<-melt(BO_80_HNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNBAS_H3_MELT<-melt(BO_80_HNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNBAS_H4_MELT<-melt(BO_80_HNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_HNBAS_H5_MELT<-melt(BO_80_HNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNBAS_H6_MELT<-melt(BO_80_HNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNBAS_H7_MELT<-melt(BO_80_HNBAS_H7, id.vars = c("Harvest", "Rock_Type", "N"))

BO_80_HNBAS_Tot<-rbind(BO_80_HNBAS_H1_MELT, BO_80_HNBAS_H2_MELT, BO_80_HNBAS_H3_MELT, BO_80_HNBAS_H4_MELT, BO_80_HNBAS_H5_MELT, BO_80_HNBAS_H6_MELT)

BO_80_HNBAS_SUM<-sum(BO_80_HNBAS_Tot$value)
BO_80_HNBAS_Bol<-subset(BO_80_HNBAS_Tot, variable %in% c("DW_Bol"))
BO_80_HNBAS_Bol_SUM<-sum(BO_80_HNBAS_Bol$value)

# 80 BO HN SED

BO_80_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Tree_Nut_All.csv")

BO_80_HNSED_H1<-BO_80_HNSED %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_HNSED_H2<- BO_80_HNSED %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_HNSED_H3<-BO_80_HNSED %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_80_HNSED_H4<-BO_80_HNSED %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_80_HNSED_H5<- BO_80_HNSED %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_80_HNSED_H6<-BO_80_HNSED %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))





BO_80_HNSED_H1_MELT<-melt(BO_80_HNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_HNSED_H2_MELT<-melt(BO_80_HNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNSED_H3_MELT<-melt(BO_80_HNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNSED_H4_MELT<-melt(BO_80_HNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
BO_80_HNSED_H5_MELT<-melt(BO_80_HNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNSED_H6_MELT<-melt(BO_80_HNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))
BO_80_HNSED_H7_MELT<-melt(BO_80_HNSED_H7, id.vars = c("Harvest", "Rock_Type", "N"))



BO_80_HNSED_Tot<-rbind(BO_80_HNSED_H1_MELT, BO_80_HNSED_H2_MELT, BO_80_HNSED_H3_MELT, BO_80_HNSED_H4_MELT, BO_80_HNSED_H5_MELT, BO_80_HNSED_H6_MELT)

BO_80_HNSED_SUM<-sum(BO_80_HNSED_Tot$value)
BO_80_HNSED_Bol<-subset(BO_80_HNSED_Tot, variable %in% c("DW_Bol"))
BO_80_HNSED_Bol_SUM<-sum(BO_80_HNSED_Bol$value)

BO_80_Tot<-cbind(BO_80_LNBAS_SUM, BO_80_HNBAS_SUM, BO_80_LNSED_SUM, BO_80_HNSED_SUM)

WTH_80_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_LNSED_H1<-WTH_80_LNSED %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNSED_H2<- WTH_80_LNSED %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNSED_H3<-WTH_80_LNSED %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_LNSED_H4<-WTH_80_LNSED %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNSED_H5<- WTH_80_LNSED %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNSED_H6<-WTH_80_LNSED %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))






WTH_80_LNSED_H1_MELT<-melt(WTH_80_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNSED_H2_MELT<-melt(WTH_80_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNSED_H3_MELT<-melt(WTH_80_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNSED_H4_MELT<-melt(WTH_80_LNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNSED_H5_MELT<-melt(WTH_80_LNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNSED_H6_MELT<-melt(WTH_80_LNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))


WTH_80_LNSED_Tot<-rbind(WTH_80_LNSED_H1_MELT, WTH_80_LNSED_H2_MELT, WTH_80_LNSED_H3_MELT, WTH_80_LNSED_H4_MELT, WTH_80_LNSED_H5_MELT, WTH_80_LNSED_H6_MELT)

WTH_80_LNSED_SUM<-sum(WTH_80_LNSED_Tot$value)
WTH_80_LNSED_Bol<-subset(WTH_80_LNSED_Tot, variable %in% c("DW_Bol"))
WTH_80_LNSED_Bol_SUM<-sum(WTH_80_LNSED_Bol$value)

# 80_WTH LN BAS

WTH_80_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_LNBAS_H1<-WTH_80_LNBAS %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNBAS_H2<- WTH_80_LNBAS %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNBAS_H3<-WTH_80_LNBAS %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_LNBAS_H4<-WTH_80_LNBAS %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNBAS_H5<- WTH_80_LNBAS %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNBAS_H6<-WTH_80_LNBAS %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))



WTH_80_LNBAS_H1_MELT<-melt(WTH_80_LNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNBAS_H2_MELT<-melt(WTH_80_LNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNBAS_H3_MELT<-melt(WTH_80_LNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNBAS_H4_MELT<-melt(WTH_80_LNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNBAS_H5_MELT<-melt(WTH_80_LNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNBAS_H6_MELT<-melt(WTH_80_LNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))


WTH_80_LNBAS_Tot<-rbind(WTH_80_LNBAS_H1_MELT, WTH_80_LNBAS_H2_MELT, WTH_80_LNBAS_H3_MELT, WTH_80_LNBAS_H4_MELT, WTH_80_LNBAS_H5_MELT, WTH_80_LNBAS_H6_MELT)

WTH_80_LNBAS_SUM<-sum(WTH_80_LNBAS_Tot$value)
WTH_80_LNBAS_Bol<-subset(WTH_80_LNBAS_Tot, variable %in% c("DW_Bol"))
WTH_80_LNBAS_Bol_SUM<-sum(WTH_80_LNBAS_Bol$value)


# 80_WTH HN BAS

WTH_80_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_HNBAS_H1<-WTH_80_HNBAS %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNBAS_H2<- WTH_80_HNBAS %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNBAS_H3<-WTH_80_HNBAS %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_HNBAS_H4<-WTH_80_HNBAS %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNBAS_H5<- WTH_80_HNBAS %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNBAS_H6<-WTH_80_HNBAS %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))



WTH_80_HNBAS_H1_MELT<-melt(WTH_80_HNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNBAS_H2_MELT<-melt(WTH_80_HNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNBAS_H3_MELT<-melt(WTH_80_HNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNBAS_H4_MELT<-melt(WTH_80_HNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNBAS_H5_MELT<-melt(WTH_80_HNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNBAS_H6_MELT<-melt(WTH_80_HNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))


WTH_80_HNBAS_Tot<-rbind(WTH_80_HNBAS_H1_MELT, WTH_80_HNBAS_H2_MELT, WTH_80_HNBAS_H3_MELT, WTH_80_HNBAS_H4_MELT, WTH_80_HNBAS_H5_MELT, WTH_80_HNBAS_H6_MELT)

WTH_80_HNBAS_SUM<-sum(WTH_80_HNBAS_Tot$value)
WTH_80_HNBAS_Bol<-subset(WTH_80_HNBAS_Tot, variable %in% c("DW_Bol"))
WTH_80_HNBAS_Bol_SUM<-sum(WTH_80_HNBAS_Bol$value)

# 80 BO HN SED

WTH_80_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_HNSED_H1<-WTH_80_HNSED %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNSED_H2<- WTH_80_HNSED %>% 
  filter(YEAR == "2147" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNSED_H3<-WTH_80_HNSED %>%
  filter(YEAR == "2229" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_HNSED_H4<-WTH_80_HNSED %>% 
  filter(YEAR == "2311" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNSED_H5<- WTH_80_HNSED %>% 
  filter(YEAR == "2393" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNSED_H6<-WTH_80_HNSED %>%
  filter(YEAR == "2475" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))




WTH_80_HNSED_H1_MELT<-melt(WTH_80_HNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNSED_H2_MELT<-melt(WTH_80_HNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNSED_H3_MELT<-melt(WTH_80_HNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNSED_H4_MELT<-melt(WTH_80_HNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNSED_H5_MELT<-melt(WTH_80_HNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNSED_H6_MELT<-melt(WTH_80_HNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))




WTH_80_HNSED_Tot<-rbind(WTH_80_HNSED_H1_MELT, WTH_80_HNSED_H2_MELT, WTH_80_HNSED_H3_MELT, WTH_80_HNSED_H4_MELT, WTH_80_HNSED_H5_MELT, WTH_80_HNSED_H6_MELT)

WTH_80_HNSED_SUM<-sum(WTH_80_HNSED_Tot$value)
WTH_80_HNSED_Bol<-subset(WTH_80_HNSED_Tot, variable %in% c("DW_Bol"))
WTH_80_HNSED_Bol_SUM<-sum(WTH_80_HNSED_Bol$value)

WTH_80_Tot<-cbind(WTH_80_LNBAS_SUM, WTH_80_HNBAS_SUM, WTH_80_LNSED_SUM, WTH_80_HNSED_SUM)


Tot_All<-cbind(WTH_80_Tot, BO_80_Tot, BO_40_Tot, WTH_40_Tot)

write.csv2(Tot_All, "All_Biomass.csv")

write.csv(Tot_All, "All_Bio_Tbl.csv")


BO_40_LNSED_HarvestTOT<- BO_40_LNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_40_HNSED_HarvestTOT<- BO_40_HNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_40_LNBAS_HarvestTOT<- BO_40_LNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_40_HNBAS_HarvestTOT<- BO_40_HNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_40_LNSED_HarvestTOT<- WTH_40_LNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_40_HNSED_HarvestTOT<- WTH_40_HNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_40_LNBAS_HarvestTOT<- WTH_40_LNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_40_HNBAS_HarvestTOT<- WTH_40_HNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_80_LNSED_HarvestTOT<- WTH_80_LNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_80_HNSED_HarvestTOT<- WTH_80_HNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_80_LNBAS_HarvestTOT<- WTH_80_LNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

WTH_80_HNBAS_HarvestTOT<- WTH_80_HNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_80_LNSED_HarvestTOT<- BO_80_LNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_80_HNSED_HarvestTOT<- BO_80_HNSED_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_80_LNBAS_HarvestTOT<- BO_80_LNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))

BO_80_HNBAS_HarvestTOT<- BO_80_HNBAS_Tot %>%
  group_by(Harvest, Rock_Type, N) %>%
  summarise(across(value, ~sum(.x, na.rm = TRUE)))



Biomass_Harvest<-rbind(BO_40_LNSED_HarvestTOT, BO_40_HNSED_HarvestTOT, BO_40_LNBAS_HarvestTOT, BO_40_HNBAS_HarvestTOT,
                       WTH_40_LNSED_HarvestTOT, WTH_40_HNSED_HarvestTOT, WTH_40_LNBAS_HarvestTOT, WTH_40_HNBAS_HarvestTOT,
                       BO_80_LNSED_HarvestTOT, BO_80_HNSED_HarvestTOT, BO_80_LNBAS_HarvestTOT, BO_80_HNBAS_HarvestTOT,
                       WTH_80_LNSED_HarvestTOT, WTH_80_HNSED_HarvestTOT, WTH_80_LNBAS_HarvestTOT, WTH_80_HNBAS_HarvestTOT)

Bol_Harvest<-rbind(BO_40_LNSED_Bol_SUM, BO_40_HNSED_Bol_SUM, BO_40_LNBAS_Bol_SUM, BO_40_HNBAS_Bol_SUM,
                   WTH_40_LNSED_Bol_SUM, WTH_40_HNSED_Bol_SUM, WTH_40_LNBAS_Bol_SUM, WTH_40_HNBAS_Bol_SUM,
                   BO_80_LNSED_Bol_SUM, BO_80_HNSED_Bol_SUM, BO_80_LNBAS_Bol_SUM, BO_80_HNBAS_Bol_SUM,
                   WTH_80_LNSED_Bol_SUM, WTH_80_HNSED_Bol_SUM, WTH_80_LNBAS_Bol_SUM, WTH_80_HNBAS_Bol_SUM)

write.csv2(Biomass_Harvest, "Biomass_Harvest.csv")

write.csv(Bol_Harvest, "Bol_Harvest.csv")







