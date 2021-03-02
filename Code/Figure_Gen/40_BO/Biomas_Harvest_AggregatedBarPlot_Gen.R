# This specific code is for the 40_BO

rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)

# Set Working Directory

setwd("~Project_Master/Test_Rep/Manuscript/Images/Aggregated")

# 40_BO LN SED

BO_40_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_LNSED_H1<-BO_40_LNSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
    mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low") %>% 
      select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H2<- BO_40_LNSED %>% 
  filter(YEAR == "2068" & Month == "8") %>% 
    mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low") %>% 
      select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H3<-BO_40_LNSED %>%
  filter(YEAR == "2154" & Month == "8") %>%
    mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low") %>%
        select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNSED_H4<-BO_40_LNSED %>% 
  filter(YEAR == "2197" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H5<- BO_40_LNSED %>% 
  filter(YEAR == "2240" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H6<-BO_40_LNSED %>%
  filter(YEAR == "2283" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNSED_H7<-BO_40_LNSED %>% 
  filter(YEAR == "2283" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H8<- BO_40_LNSED %>% 
  filter(YEAR == "2326" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNSED_H9<-BO_40_LNSED %>%
  filter(YEAR == "2369" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNSED_H10<-BO_40_LNSED %>% 
  filter(YEAR == "2412" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNSED_H11<- BO_40_LNSED %>% 
  filter(YEAR == "2498" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="Low") %>% 
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


# 40_BO LN BAS

BO_40_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_LNBAS_H1<-BO_40_LNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H2<- BO_40_LNBAS %>% 
  filter(YEAR == "2068" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H3<-BO_40_LNBAS %>%
  filter(YEAR == "2154" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNBAS_H4<-BO_40_LNBAS %>% 
  filter(YEAR == "2197" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H5<- BO_40_LNBAS %>% 
  filter(YEAR == "2240" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H6<-BO_40_LNBAS %>%
  filter(YEAR == "2283" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNBAS_H7<-BO_40_LNBAS %>% 
  filter(YEAR == "2283" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H8<- BO_40_LNBAS %>% 
  filter(YEAR == "2326" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_LNBAS_H9<-BO_40_LNBAS %>%
  filter(YEAR == "2369" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_LNBAS_H10<-BO_40_LNBAS %>% 
  filter(YEAR == "2412" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_LNBAS_H11<- BO_40_LNBAS %>% 
  filter(YEAR == "2498" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Basalt", N="Low") %>% 
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



# 40_BO HN BAS

BO_40_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_HNBAS_H1<-BO_40_HNBAS %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H2<- BO_40_HNBAS %>% 
  filter(YEAR == "2068" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H3<-BO_40_HNBAS %>%
  filter(YEAR == "2154" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="high") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNBAS_H4<-BO_40_HNBAS %>% 
  filter(YEAR == "2197" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H5<- BO_40_HNBAS %>% 
  filter(YEAR == "2240" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H6<-BO_40_HNBAS %>%
  filter(YEAR == "2283" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="high") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNBAS_H7<-BO_40_HNBAS %>% 
  filter(YEAR == "2283" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H8<- BO_40_HNBAS %>% 
  filter(YEAR == "2326" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNBAS_H9<-BO_40_HNBAS %>%
  filter(YEAR == "2369" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="high") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNBAS_H10<-BO_40_HNBAS %>% 
  filter(YEAR == "2412" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Basalt", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNBAS_H11<- BO_40_HNBAS %>% 
  filter(YEAR == "2498" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Basalt", N="high") %>% 
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

# 40 BO HN SED

BO_40_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

BO_40_HNSED_H1<-BO_40_HNSED %>% 
  filter(YEAR == "2025" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H2<- BO_40_HNSED %>% 
  filter(YEAR == "2068" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H3<-BO_40_HNSED %>%
  filter(YEAR == "2154" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="high") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNSED_H4<-BO_40_HNSED %>% 
  filter(YEAR == "2197" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H5<- BO_40_HNSED %>% 
  filter(YEAR == "2240" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H6<-BO_40_HNSED %>%
  filter(YEAR == "2283" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="high") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNSED_H7<-BO_40_HNSED %>% 
  filter(YEAR == "2283" & Month == "8") %>% 
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H8<- BO_40_HNSED %>% 
  filter(YEAR == "2326" & Month == "8") %>% 
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

BO_40_HNSED_H9<-BO_40_HNSED %>%
  filter(YEAR == "2369" & Month == "8") %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="high") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

BO_40_HNSED_H10<-BO_40_HNSED %>% 
  filter(YEAR == "2412" & Month == "8") %>% 
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="high") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

BO_40_HNSED_H11<- BO_40_HNSED %>% 
  filter(YEAR == "2498" & Month == "8") %>% 
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="high") %>% 
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


# BIND, SET, RUCK!!!!

Biomass_Master<-cbind(BO_40_LNSED_H1_MELT, BO_40_LNSED_H2_MELT, BO_40_LNSED_H3_MELT, BO_40_LNSED_H4_MELT,
                      BO_40_LNSED_H5_MELT, BO_40_LNSED_H6_MELT, BO_40_LNSED_H7_MELT, BO_40_LNSED_H8_MELT,
                      BO_40_LNSED_H9_MELT, BO_40_LNSED_H8_MELT, BO_40_LNSED_H9_MELT, BO_40_LNSED_H10_MELT,
                      BO_40_LNSED_H11_MELT, BO_40_HNSED_H1_MELT, BO_40_HNSED_H2_MELT, BO_40_HNSED_H3_MELT, BO_40_HNSED_H4_MELT,
                      BO_40_HNSED_H5_MELT, BO_40_HNSED_H6_MELT, BO_40_HNSED_H7_MELT, BO_40_HNSED_H8_MELT,
                      BO_40_HNSED_H9_MELT, BO_40_HNSED_H8_MELT, BO_40_HNSED_H9_MELT, BO_40_HNSED_H10_MELT,
                      BO_40_HNSED_H11_MELT,BO_40_HNBAS_H1_MELT, BO_40_HNBAS_H2_MELT, BO_40_HNBAS_H3_MELT, BO_40_HNBAS_H4_MELT,
                      BO_40_HNBAS_H5_MELT, BO_40_HNBAS_H6_MELT, BO_40_HNBAS_H7_MELT, BO_40_HNBAS_H8_MELT,
                      BO_40_HNBAS_H9_MELT, BO_40_HNBAS_H8_MELT, BO_40_HNBAS_H9_MELT, BO_40_HNBAS_H10_MELT,
                      BO_40_HNBAS_H11_MELT, BO_40_LNBAS_H1_MELT, BO_40_LNBAS_H2_MELT, BO_40_LNBAS_H3_MELT, BO_40_LNBAS_H4_MELT,
                      BO_40_LNBAS_H5_MELT, BO_40_LNBAS_H6_MELT, BO_40_LNBAS_H7_MELT, BO_40_LNBAS_H8_MELT,
                      BO_40_LNBAS_H9_MELT, BO_40_LNBAS_H8_MELT, BO_40_LNBAS_H9_MELT, BO_40_LNBAS_H10_MELT,
                      BO_40_LNBAS_H11_MELT)


# Graphs


BO_Aggregated_Biomass<-ggplot(Biomass_Master, aes(fill=variable, y=value, x=Harvest, group=N)) + 
  geom_bar(position="stack", stat="identity")+ facet_grid(~Rock_Type+N)

#Save to Image Directory

png("BO_Biomass.png")
print(BO_Aggregated_Biomass)
dev.off()

  
  