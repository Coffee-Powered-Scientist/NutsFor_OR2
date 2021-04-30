# This specific code is for the 80_WTH

rm(list = ls())

library(dplyr)
library(ggplot2)
library(reshape2)
library(ggthemes)
library(gridExtra)
library(extrafont)

# Update Files

source("~/Project_Master/Test_Rep/Code/LN_SED/80_WTH/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_SED/80_WTH/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/LN_BAS/80_WTH/TreeNut_Mutator.R")

source("~/Project_Master/Test_Rep/Code/HN_BAS/80_WTH/TreeNut_Mutator.R")


# Set Working Directory

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/80_WTH")

# 80_WTH LN SED

WTH_80_LNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_LNSED_H1<-WTH_80_LNSED %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNSED_H2<- WTH_80_LNSED %>% 
  filter(YEAR == "2148" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNSED_H3<-WTH_80_LNSED %>%
  filter(YEAR == "2231" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_LNSED_H4<-WTH_80_LNSED %>% 
  filter(YEAR == "2314" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNSED_H5<- WTH_80_LNSED %>% 
  filter(YEAR == "2392" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNSED_H6<-WTH_80_LNSED %>%
  filter(YEAR == "2480" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))





WTH_80_LNSED_H1_MELT<-melt(WTH_80_LNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNSED_H2_MELT<-melt(WTH_80_LNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNSED_H3_MELT<-melt(WTH_80_LNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNSED_H4_MELT<-melt(WTH_80_LNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNSED_H5_MELT<-melt(WTH_80_LNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNSED_H6_MELT<-melt(WTH_80_LNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))



# 80_WTH LN BAS

WTH_80_LNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_LNBAS_H1<-WTH_80_LNBAS %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNBAS_H2<- WTH_80_LNBAS %>% 
  filter(YEAR == "2148" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNBAS_H3<-WTH_80_LNBAS %>%
  filter(YEAR == "2231" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_LNBAS_H4<-WTH_80_LNBAS %>% 
  filter(YEAR == "2314" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_LNBAS_H5<- WTH_80_LNBAS %>% 
  filter(YEAR == "2392" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_LNBAS_H6<-WTH_80_LNBAS %>%
  filter(YEAR == "2480" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))





WTH_80_LNBAS_H1_MELT<-melt(WTH_80_LNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNBAS_H2_MELT<-melt(WTH_80_LNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNBAS_H3_MELT<-melt(WTH_80_LNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNBAS_H4_MELT<-melt(WTH_80_LNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_LNBAS_H5_MELT<-melt(WTH_80_LNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_LNBAS_H6_MELT<-melt(WTH_80_LNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))




# 80_WTH HN BAS

WTH_80_HNBAS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_HNBAS_H1<-WTH_80_HNBAS %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNBAS_H2<- WTH_80_HNBAS %>% 
  filter(YEAR == "2148" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNBAS_H3<-WTH_80_HNBAS %>%
  filter(YEAR == "2231" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_HNBAS_H4<-WTH_80_HNBAS %>% 
  filter(YEAR == "2314" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNBAS_H5<- WTH_80_HNBAS %>% 
  filter(YEAR == "2392" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Basalt", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNBAS_H6<-WTH_80_HNBAS %>%
  filter(YEAR == "2480" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))



WTH_80_HNBAS_H1_MELT<-melt(WTH_80_HNBAS_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNBAS_H2_MELT<-melt(WTH_80_HNBAS_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNBAS_H3_MELT<-melt(WTH_80_HNBAS_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNBAS_H4_MELT<-melt(WTH_80_HNBAS_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNBAS_H5_MELT<-melt(WTH_80_HNBAS_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNBAS_H6_MELT<-melt(WTH_80_HNBAS_H6, id.vars = c("Harvest", "Rock_Type", "N"))

# 80 WTH HN SED

WTH_80_HNSED<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Tree_Nut_All.csv")

WTH_80_HNSED_H1<-WTH_80_HNSED %>% 
  filter(YEAR == "2065" & Month == "8") %>% 
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNSED_H2<- WTH_80_HNSED %>% 
  filter(YEAR == "2148" & Month == "8") %>% 
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNSED_H3<-WTH_80_HNSED %>%
  filter(YEAR == "2231" & Month == "8") %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))

WTH_80_HNSED_H4<-WTH_80_HNSED %>% 
  filter(YEAR == "2314" & Month == "8") %>% 
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N,matches("DW"))

WTH_80_HNSED_H5<- WTH_80_HNSED %>% 
  filter(YEAR == "2392" & Month == "8") %>% 
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="High") %>% 
  select(Harvest,Rock_Type ,N, matches("DW"))

WTH_80_HNSED_H6<-WTH_80_HNSED %>%
  filter(YEAR == "2480" & Month == "8") %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="High") %>%
  select(Harvest, Rock_Type, N, matches ("DW"))




WTH_80_HNSED_H1_MELT<-melt(WTH_80_HNSED_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNSED_H2_MELT<-melt(WTH_80_HNSED_H2, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNSED_H3_MELT<-melt(WTH_80_HNSED_H3, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNSED_H4_MELT<-melt(WTH_80_HNSED_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
WTH_80_HNSED_H5_MELT<-melt(WTH_80_HNSED_H5, id.vars = c("Harvest", "Rock_Type", "N"))
WTH_80_HNSED_H6_MELT<-melt(WTH_80_HNSED_H6, id.vars = c("Harvest", "Rock_Type", "N"))



# BIND, SET, RUCK!!!!

Biomass_Master<-rbind(WTH_80_LNSED_H1_MELT, WTH_80_LNSED_H2_MELT, WTH_80_LNSED_H3_MELT, WTH_80_LNSED_H4_MELT,
                      WTH_80_LNSED_H5_MELT, WTH_80_LNSED_H6_MELT, WTH_80_HNSED_H1_MELT, WTH_80_HNSED_H2_MELT, WTH_80_HNSED_H3_MELT, WTH_80_HNSED_H4_MELT,
                      WTH_80_HNSED_H5_MELT, WTH_80_HNSED_H6_MELT,WTH_80_HNBAS_H1_MELT, WTH_80_HNBAS_H2_MELT, WTH_80_HNBAS_H3_MELT, WTH_80_HNBAS_H4_MELT,
                      WTH_80_HNBAS_H5_MELT, WTH_80_HNBAS_H6_MELT, WTH_80_LNBAS_H1_MELT, WTH_80_LNBAS_H2_MELT, WTH_80_LNBAS_H3_MELT, WTH_80_LNBAS_H4_MELT,
                      WTH_80_LNBAS_H5_MELT, WTH_80_LNBAS_H6_MELT)

Biomass_Master$Harvest<-factor(Biomass_Master$Harvest, levels=c("H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11"))
Biomass_Master$variable<-factor(Biomass_Master$variable, levels=c("DW_F", "DW_Brk", "DW_Brh", "DW_Bol"))


# Graphs
#Load Times New Roman
windowsFonts(A = windowsFont("Times New Roman"))

WTH_Aggregated_Biomass<-ggplot(Biomass_Master[order(Biomass_Master$variable,decreasing=T),], aes(fill=variable, y=value/1000, x=Harvest, group=N)) + 
  geom_bar(position="stack", stat="identity")+ 
  facet_wrap(~Rock_Type+N)+
  scale_x_discrete(guide = guide_axis(n.dodge = 2))+ 
  labs(y="Dry Weight (Mg/ha)", fill="Biomass Compartment")+
  guides(fill = guide_legend(reverse=FALSE))+ 
  scale_fill_brewer(palette = "Pastel1", labels=c("Foliage", "Bark", "Branch", "Bole"))+
  theme_bw()+
  theme(legend.background = element_rect(fill = "lightgray"), text=element_text(family="A", size=12))


#Check
WTH_Aggregated_Biomass

#Save to Image Directory

png("WTH_Biomass.png", height=650, width=1000, res=100)
print(WTH_Aggregated_Biomass)
dev.off()


