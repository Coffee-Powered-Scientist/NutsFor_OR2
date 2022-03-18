


library(dplyr)
library(ggplot2)
library(reshape2)
library(ggthemes)
library(gridExtra)
library(extrafont)
library(forcats)
library(RColorBrewer)

Biomass_Harvest_Parent<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Biomass_Harvest.csv")

LNS_40BO_CEC<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/CEC_All.csv")


Ex_Size_LNS_40_BO_H1<- LNS_40BO_CEC %>% 
  filter(Date == "2025-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H2<- LNS_40BO_CEC %>% 
  filter(Date == "2068-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H3<- LNS_40BO_CEC %>% 
  filter(Date == "2154-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H4<- LNS_40BO_CEC %>% 
  filter(Date == "2197-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H5<- LNS_40BO_CEC %>% 
  filter(Date == "2240-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H6<- LNS_40BO_CEC %>% 
  filter(Date == "2283-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H7<- LNS_40BO_CEC %>% 
  filter(Date == "2326-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H8<- LNS_40BO_CEC %>% 
  filter(Date == "2369-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H9<- LNS_40BO_CEC %>% 
  filter(Date == "2412-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H10<- LNS_40BO_CEC %>% 
  filter(Date == "2455-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="Low")

Ex_Size_LNS_40_BO_H11<- LNS_40BO_CEC %>% 
  filter(Date == "2498-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="Low")


Ex_Size_LNS_40_BO_H1_MELT<-melt(Ex_Size_LNS_40_BO_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNS_40_BO_H2_MELT<-melt(Ex_Size_LNS_40_BO_H2, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNS_40_BO_H3_MELT<-melt(Ex_Size_LNS_40_BO_H3, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNS_40_BO_H4_MELT<-melt(Ex_Size_LNS_40_BO_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNS_40_BO_H5_MELT<-melt(Ex_Size_LNS_40_BO_H5, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNS_40_BO_H6_MELT<-melt(Ex_Size_LNS_40_BO_H6, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNS_40_BO_H7_MELT<-melt(Ex_Size_LNS_40_BO_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNS_40_BO_H8_MELT<-melt(Ex_Size_LNS_40_BO_H8, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNS_40_BO_H9_MELT<-melt(Ex_Size_LNS_40_BO_H9, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNS_40_BO_H10_MELT<-melt(Ex_Size_LNS_40_BO_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNS_40_BO_H11_MELT<-melt(Ex_Size_LNS_40_BO_H11, id.vars = c("Harvest", "Rock_Type", "N"))

Ex_Size_LNS_40_BO_Tot<-rbind(Ex_Size_LNS_40_BO_H1_MELT, Ex_Size_LNS_40_BO_H2_MELT, Ex_Size_LNS_40_BO_H3_MELT, Ex_Size_LNS_40_BO_H4_MELT, Ex_Size_LNS_40_BO_H5_MELT, Ex_Size_LNS_40_BO_H6_MELT, 
                       Ex_Size_LNS_40_BO_H7_MELT, Ex_Size_LNS_40_BO_H8_MELT, Ex_Size_LNS_40_BO_H9_MELT, Ex_Size_LNS_40_BO_H10_MELT, Ex_Size_LNS_40_BO_H11_MELT)


LNS_40_BO<-Biomass_Harvest_Parent %>% filter(Harvest_Type=="40_BO" & N=="Low", Rock_Type=="Sedimentary") 

LNS_40_BO$valBIO<-LNS_40_BO$value

LNS_40_BO<-LNS_40_BO %>% select(-value)


HNS_40BO_CEC<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/CEC_All.csv")


Ex_Size_HNS_40_BO_H1<- HNS_40BO_CEC %>% 
  filter(Date == "2025-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H1", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H2<- HNS_40BO_CEC %>% 
  filter(Date == "2068-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H2", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H3<- HNS_40BO_CEC %>% 
  filter(Date == "2154-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H3", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H4<- HNS_40BO_CEC %>% 
  filter(Date == "2197-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H4", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H5<- HNS_40BO_CEC %>% 
  filter(Date == "2240-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H5", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H6<- HNS_40BO_CEC %>% 
  filter(Date == "2283-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H6", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H7<- HNS_40BO_CEC %>% 
  filter(Date == "2326-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H7", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H8<- HNS_40BO_CEC %>% 
  filter(Date == "2369-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H8", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H9<- HNS_40BO_CEC %>% 
  filter(Date == "2412-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H9", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H10<- HNS_40BO_CEC %>% 
  filter(Date == "2455-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H10", Rock_Type="Sedimentary", N="High")

Ex_Size_HNS_40_BO_H11<- HNS_40BO_CEC %>% 
  filter(Date == "2498-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H11", Rock_Type="Sedimentary", N="High")



Ex_Size_HNS_40_BO_H1_MELT<-melt(Ex_Size_HNS_40_BO_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNS_40_BO_H2_MELT<-melt(Ex_Size_HNS_40_BO_H2, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNS_40_BO_H3_MELT<-melt(Ex_Size_HNS_40_BO_H3, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNS_40_BO_H4_MELT<-melt(Ex_Size_HNS_40_BO_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNS_40_BO_H5_MELT<-melt(Ex_Size_HNS_40_BO_H5, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNS_40_BO_H6_MELT<-melt(Ex_Size_HNS_40_BO_H6, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNS_40_BO_H7_MELT<-melt(Ex_Size_HNS_40_BO_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNS_40_BO_H8_MELT<-melt(Ex_Size_HNS_40_BO_H8, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNS_40_BO_H9_MELT<-melt(Ex_Size_HNS_40_BO_H9, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNS_40_BO_H10_MELT<-melt(Ex_Size_HNS_40_BO_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNS_40_BO_H11_MELT<-melt(Ex_Size_HNS_40_BO_H11, id.vars = c("Harvest", "Rock_Type", "N"))

Ex_Size_HNS_40_BO_Tot<-rbind(Ex_Size_HNS_40_BO_H1_MELT, Ex_Size_HNS_40_BO_H2_MELT, Ex_Size_HNS_40_BO_H3_MELT, Ex_Size_HNS_40_BO_H4_MELT, Ex_Size_HNS_40_BO_H5_MELT, Ex_Size_HNS_40_BO_H6_MELT, 
                             Ex_Size_HNS_40_BO_H7_MELT, Ex_Size_HNS_40_BO_H8_MELT, Ex_Size_HNS_40_BO_H9_MELT, Ex_Size_HNS_40_BO_H10_MELT, Ex_Size_HNS_40_BO_H11_MELT)


HNS_40_BO<-Biomass_Harvest_Parent %>% filter(Harvest_Type=="40_BO" & N=="High", Rock_Type=="Sedimentary") 

HNS_40_BO$valBIO<-HNS_40_BO$value

HNS_40_BO<-HNS_40_BO %>% select(-value)


LNB_40BO_CEC<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/CEC_All.csv")


Ex_Size_LNB_40_BO_H1<- LNB_40BO_CEC %>% 
  filter(Date == "2025-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H1", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H2<- LNB_40BO_CEC %>% 
  filter(Date == "2068-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H2", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H3<- LNB_40BO_CEC %>% 
  filter(Date == "2154-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H4<- LNB_40BO_CEC %>% 
  filter(Date == "2197-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H4", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H5<- LNB_40BO_CEC %>% 
  filter(Date == "2240-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H5", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H6<- LNB_40BO_CEC %>% 
  filter(Date == "2283-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H7<- LNB_40BO_CEC %>% 
  filter(Date == "2326-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H7", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H8<- LNB_40BO_CEC %>% 
  filter(Date == "2369-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H8", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H9<- LNB_40BO_CEC %>% 
  filter(Date == "2412-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H10<- LNB_40BO_CEC %>% 
  filter(Date == "2455-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H10", Rock_Type="Basalt", N="Low")

Ex_Size_LNB_40_BO_H11<- LNB_40BO_CEC %>% 
  filter(Date == "2498-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H11", Rock_Type="Basalt", N="Low")


Ex_Size_LNB_40_BO_H1_MELT<-melt(Ex_Size_LNB_40_BO_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNB_40_BO_H2_MELT<-melt(Ex_Size_LNB_40_BO_H2, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNB_40_BO_H3_MELT<-melt(Ex_Size_LNB_40_BO_H3, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNB_40_BO_H4_MELT<-melt(Ex_Size_LNB_40_BO_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNB_40_BO_H5_MELT<-melt(Ex_Size_LNB_40_BO_H5, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNB_40_BO_H6_MELT<-melt(Ex_Size_LNB_40_BO_H6, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNB_40_BO_H7_MELT<-melt(Ex_Size_LNB_40_BO_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNB_40_BO_H8_MELT<-melt(Ex_Size_LNB_40_BO_H8, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNB_40_BO_H9_MELT<-melt(Ex_Size_LNB_40_BO_H9, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_LNB_40_BO_H10_MELT<-melt(Ex_Size_LNB_40_BO_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_LNB_40_BO_H11_MELT<-melt(Ex_Size_LNB_40_BO_H11, id.vars = c("Harvest", "Rock_Type", "N"))

Ex_Size_LNB_40_BO_Tot<-rbind(Ex_Size_LNB_40_BO_H1_MELT, Ex_Size_LNB_40_BO_H2_MELT, Ex_Size_LNB_40_BO_H3_MELT, Ex_Size_LNB_40_BO_H4_MELT, Ex_Size_LNB_40_BO_H5_MELT, Ex_Size_LNB_40_BO_H6_MELT, 
                             Ex_Size_LNB_40_BO_H7_MELT, Ex_Size_LNB_40_BO_H8_MELT, Ex_Size_LNB_40_BO_H9_MELT, Ex_Size_LNB_40_BO_H10_MELT, Ex_Size_LNB_40_BO_H11_MELT)




# create a vector with letters in the desired order
x <- c("H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11")

LNS_40_BO<-LNS_40_BO%>%
  slice(match(x, Harvest))%>%
  select(-Harvest, -Rock_Type, -N)

LNS_40_BO_Combined<-cbind(LNS_40_BO, Ex_Size_LNS_40_BO_Tot)


HNS_40_BO<-HNS_40_BO%>%
  slice(match(x, Harvest))%>%
  select(-Harvest, -Rock_Type, -N)

HNS_40_BO_Combined<-cbind(HNS_40_BO, Ex_Size_HNS_40_BO_Tot)

LNB_40_BO<-Biomass_Harvest_Parent %>% filter(Harvest_Type=="40_BO" & N=="Low", Rock_Type=="Basalt") 

LNB_40_BO$valBIO<-LNB_40_BO$value

LNB_40_BO<-LNB_40_BO %>% select(-value)



LNB_40_BO<-LNB_40_BO%>%
  slice(match(x, Harvest))%>%
  select(-Harvest, -Rock_Type, -N)

LNB_40_BO_Combined<-cbind(LNB_40_BO, Ex_Size_LNB_40_BO_Tot)



HNB_40BO_CEC<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/CEC_All.csv")


Ex_Size_HNB_40_BO_H1<- HNB_40BO_CEC %>% 
  filter(Date == "2025-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H1", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H2<- HNB_40BO_CEC %>% 
  filter(Date == "2068-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H2", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H3<- HNB_40BO_CEC %>% 
  filter(Date == "2154-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H3", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H4<- HNB_40BO_CEC %>% 
  filter(Date == "2197-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H4", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H5<- HNB_40BO_CEC %>% 
  filter(Date == "2240-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H5", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H6<- HNB_40BO_CEC %>% 
  filter(Date == "2283-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H6", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H7<- HNB_40BO_CEC %>% 
  filter(Date == "2326-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H7", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H8<- HNB_40BO_CEC %>% 
  filter(Date == "2369-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H8", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H9<- HNB_40BO_CEC %>% 
  filter(Date == "2412-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H9", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H10<- HNB_40BO_CEC %>% 
  filter(Date == "2455-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H10", Rock_Type="Basalt", N="High")

Ex_Size_HNB_40_BO_H11<- HNB_40BO_CEC %>% 
  filter(Date == "2498-08-01") %>%
  select(Ca, Mg, K) %>% 
  summarise(across(Ca:K, ~sum(.x, na.rm=TRUE))) %>%
  mutate(Harvest="H11", Rock_Type="Basalt", N="High")


Ex_Size_HNB_40_BO_H1_MELT<-melt(Ex_Size_HNB_40_BO_H1, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNB_40_BO_H2_MELT<-melt(Ex_Size_HNB_40_BO_H2, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNB_40_BO_H3_MELT<-melt(Ex_Size_HNB_40_BO_H3, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNB_40_BO_H4_MELT<-melt(Ex_Size_HNB_40_BO_H4, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNB_40_BO_H5_MELT<-melt(Ex_Size_HNB_40_BO_H5, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNB_40_BO_H6_MELT<-melt(Ex_Size_HNB_40_BO_H6, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNB_40_BO_H7_MELT<-melt(Ex_Size_HNB_40_BO_H7, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNB_40_BO_H8_MELT<-melt(Ex_Size_HNB_40_BO_H8, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNB_40_BO_H9_MELT<-melt(Ex_Size_HNB_40_BO_H9, id.vars = c("Harvest", "Rock_Type", "N"))
Ex_Size_HNB_40_BO_H10_MELT<-melt(Ex_Size_HNB_40_BO_H10, id.vars = c("Harvest", "Rock_Type", "N")) 
Ex_Size_HNB_40_BO_H11_MELT<-melt(Ex_Size_HNB_40_BO_H11, id.vars = c("Harvest", "Rock_Type", "N"))

Ex_Size_HNB_40_BO_Tot<-rbind(Ex_Size_HNB_40_BO_H1_MELT, Ex_Size_HNB_40_BO_H2_MELT, Ex_Size_HNB_40_BO_H3_MELT, Ex_Size_HNB_40_BO_H4_MELT, Ex_Size_HNB_40_BO_H5_MELT, Ex_Size_HNB_40_BO_H6_MELT, 
                             Ex_Size_HNB_40_BO_H7_MELT, Ex_Size_HNB_40_BO_H8_MELT, Ex_Size_HNB_40_BO_H9_MELT, Ex_Size_HNB_40_BO_H10_MELT, Ex_Size_HNB_40_BO_H11_MELT)


HNB_40_BO<-Biomass_Harvest_Parent %>% filter(Harvest_Type=="40_BO" & N=="High", Rock_Type=="Basalt") 

HNB_40_BO$valBIO<-HNB_40_BO$value

HNB_40_BO<-HNB_40_BO %>% select(-value)



HNB_40_BO<-HNB_40_BO%>%
  slice(match(x, Harvest))%>%
  select(-Harvest, -Rock_Type, -N)

HNB_40_BO_Combined<-cbind(HNB_40_BO, Ex_Size_HNB_40_BO_Tot)

Mixed<-rbind(LNS_40_BO_Combined, HNS_40_BO_Combined,HNB_40_BO_Combined ,LNB_40_BO_Combined)

HNB<-ggplot(HNB_40_BO_Combined, aes(x=valBIO/1000, y=value))+
  geom_point(aes(shape=variable, colour=variable))+labs(y="Cation Pool (kg/ha)", x="Biomass (Mg/ha)", shape="Species", colour="Species")+
  scale_color_brewer(palette="Dark2")+theme_classic2()+
  ggtitle("High N Basalt")+
  theme(plot.title = element_text(hjust = 0.5), axis.title.y = element_blank())

LNB<-ggplot(LNB_40_BO_Combined, aes(x=valBIO/1000, y=value))+
  geom_point(aes(shape=variable, colour=variable))+labs(y="Cation Pool (kg/ha)", x="Biomass (Mg/ha)" , shape="Species", colour="Species", title="Low N Basalt")+
  scale_color_brewer(palette="Dark2")+theme_classic2()+
  ggtitle("Low N Basalt")+
  theme(plot.title = element_text(hjust = 0.5))

LNS<-ggplot(LNS_40_BO_Combined, aes(x=valBIO/1000, y=value))+
  geom_point(aes(shape=variable, colour=variable))+labs(y="Cation Pool (kg/ha)",  x="Biomass (Mg/ha)",shape="Species", colour="Species",  title="Low N Sedimentary")+
  scale_color_brewer(palette="Dark2")+theme_classic2()+
  ggtitle("Low N Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5))

HNS<-ggplot(HNS_40_BO_Combined, aes(x=valBIO/1000, y=value))+
  geom_point(aes(shape=variable, colour=variable))+labs(y="Cation Pool (kg/ha)", x="Biomass (Mg/ha)", shape="Species", colour="Species", title="High N Sedimentary")+
  scale_color_brewer(palette="Dark2")+theme_classic2()+
  ggtitle("High N Sedimentary")+
  theme(plot.title = element_text(hjust = 0.5))

Wrapped<-ggplot(Mixed, aes(x=valBIO/1000, y=value))+geom_point(aes(shape=variable, colour=variable))+facet_wrap(~Rock_Type+N)+
  scale_color_brewer(palette="Dark2")+theme_bw()

png("Test.png", height=1000, width=2000, res=95)
plot(Wrapped)
dev.off()

ggarrange(HNB,LNS , HNS, LNS, labels=c("A", "B", "C", "D"),ncol = 2, nrow = 2) %>%
  ggexport(filename="Test2.png", height=1000, width=1850, res=95)
