


library(dplyr)
library(ggplot2)
library(reshape2)
library(ggthemes)
library(gridExtra)
library(extrafont)
library(forcats)

Chormb<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Biomass_Harvest.csv")

Poop<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/CEC_All.csv")


Ex_Size_H1<- Poop %>% 
  filter(Date == "2025-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low")

Ex_Size_H2<- Poop %>% 
  filter(Date == "2068-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low")

Ex_Size_H3<- Poop %>% 
  filter(Date == "2154-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low")

Ex_Size_H4<- Poop %>% 
  filter(Date == "2197-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low")

Ex_Size_H5<- Poop %>% 
  filter(Date == "2240-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low")

Ex_Size_H6<- Poop %>% 
  filter(Date == "2283-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low")

Ex_Size_H7<- Poop %>% 
  filter(Date == "2326-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="Low")

Ex_Size_H8<- Poop %>% 
  filter(Date == "2369-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="Low")

Ex_Size_H9<- Poop %>% 
  filter(Date == "2412-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="Low")

Ex_Size_H10<- Poop %>% 
  filter(Date == "2455-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="Low")

Ex_Size_H11<- Poop %>% 
  filter(Date == "2498-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="Low")


Ex_Size_H1_MELT<-melt(Ex_Size_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_H2_MELT<-melt(Ex_Size_H2, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_H3_MELT<-melt(Ex_Size_H3, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_H4_MELT<-melt(Ex_Size_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_H5_MELT<-melt(Ex_Size_H5, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_H6_MELT<-melt(Ex_Size_H6, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_H7_MELT<-melt(Ex_Size_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_H8_MELT<-melt(Ex_Size_H8, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_H9_MELT<-melt(Ex_Size_H9, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_H10_MELT<-melt(Ex_Size_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_H11_MELT<-melt(Ex_Size_H11, id.vars = c("Harvest", "Rock_Type", "N"))

Ex_Size_Tot<-rbind(Ex_Size_H1_MELT, Ex_Size_H2_MELT, Ex_Size_H3_MELT, Ex_Size_H4_MELT, Ex_Size_H5_MELT, Ex_Size_H6_MELT, 
                       Ex_Size_H7_MELT, Ex_Size_H8_MELT, Ex_Size_H9_MELT, Ex_Size_H10_MELT, Ex_Size_H11_MELT)


LNS_40_BO<-Chormb %>% filter(Harvest_Type=="40_BO" & N=="Low", Rock_Type=="Sedimentary") 

LNS_40_BO$valBIO<-LNS_40_BO$value

LNS_40_BO<-LNS_40_BO %>% select(-value)


ord <- c("H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11")
LNS_40_BO$Harvest <- factor(LNS_40_BO$Harvest,levels=ord)
sort(LNS_40_BO$Harvest)



# create a vector with letters in the desired order
x <- c("H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11")

LNS_40_BO<-LNS_40_BO%>%
  slice(match(x, Harvest))%>%
  select(-Harvest, -Rock_Type, -N)

Gotobed<-cbind(LNS_40_BO, Ex_Size_Tot)



ggplot(Gotobed, aes(x=valBIO, y=value, fill=variable, color=variable))+geom_point()


