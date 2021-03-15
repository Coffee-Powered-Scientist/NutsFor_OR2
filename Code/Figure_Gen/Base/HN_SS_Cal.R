#----------------------------------------------------#
### Calibration Figures HN SED Only###
#____________________________________________________#

rm(list = ls())

library(ggplot2)
library(dplyr)
library(reshape2)
library(lubridate)
library(multipanelfigure)

source("~/Project_Master/Test_Rep/Code/HN_SED/Base/Soil_Soln_Mutator.R")
# Set WD #

setwd("~/Project_Master/Test_Rep/Manuscript/Images/HN_SED/Base")

### Measured ###
Df_Lys_HNSED_Conc<-read.csv2("~/Project_Master/Test_Rep/Data/Base Sites/NutsForSEDHN/HN_SED_Lys.csv")

Df_Lys_HNSED_Conc[c(4:11)]<-lapply(Df_Lys_HNSED_Conc[c(4:11)], as.numeric)

Df_Lys_HNSED_Conc<-Df_Lys_HNSED_Conc %>% mutate(Date=make_date(Year, Month))
### Simulated ###
Cal_Pretable_Parent<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_HN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_SS<-Cal_Pretable_Parent %>% filter(group_id %in% c("10", "11", "12", "13", "14", "15", "16", "17"))
Cal_Pretable_SS$group_id<-as.character(Cal_Pretable_SS$group_id)
Cal_Pretable_SS$Date<-as.Date(Cal_Pretable_SS$Date)

Cal_Pretable_SS

Cal_Pre<-Cal_Pretable_SS %>% 
  filter(group_id %in% c("10", "17")) %>%
  filter(YEAR %in% c("2005", "2006")) 

Cal_Pre<-Cal_Pre[!(Cal_Pre$Month == c("7", "8", "9", "10", "11", "12") & Cal_Pre$YEAR == "2006"),]


Cal_Melt<-melt(Cal_Pre, id.vars = c("Date", "group_id"))

Cal_Melt[c(4)]<-lapply(Cal_Melt[c(4)], as.numeric)


Cal_Melt<-na.omit(Cal_Melt)


TestCa_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*24.95134488, ymax=Concentration_Shallow+SD_S*24.95134488))+ 
  geom_pointrange(aes(y=Conc_S_3*24.95134488, ymin=pmax(Conc_S_3-SD_S_3*24.95134488, 0), ymax=Conc_S_3+SD_S_3*24.95134488, color="Pseudo"))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)), color="Legend")+
  ggtitle("Ca") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values=c("#E69F00", "#56B4E9", "chartreuse4"))

Db_TestCa1<-ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*24.95134488, ymax=Concentration_Shallow+SD_S*24.95134488))+
  geom_point(aes(y=Conc_S_3*24.95134488))+
  geom_pointrange(aes(ymin=Conc_S_3*24.95134488-SD_S_3*24.95134488, ymax=Conc_S_3*24.95134488+SD_S_3*24.95134488, color="Psuedo"))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)))


TestCa_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep-SD_D*24.95134488, ymax=Concentration_Deep+SD_D*24.95134488))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)))

Db_TestCa2<-ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep-SD_D*24.95134488, ymax=Concentration_Deep+SD_D*24.95134488))+
  geom_point(aes(y=Conc_D_3*24.95134488))+
  geom_pointrange(aes(ymin=Conc_D_3*24.95134488-SD_D_3*24.95134488, ymax=Conc_D_3*24.95134488+SD_D_3*24.95134488, color="Psuedo"))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)))

TestMg_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*41.14379757, ymax=Concentration_Shallow+SD_S*41.14379757))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)))

TestMg_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep-SD_D*41.14379757, ymax=Concentration_Deep+SD_D*41.14379757))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)))


TestK_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*33.22446783, ymax=Concentration_Shallow+SD_S*33.22446783))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)))

TestK_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*33.22446783, 0), ymax=Concentration_Deep+SD_D*33.22446783))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)))


TestNa_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*43.51610096, ymax=Concentration_Shallow+SD_S*43.51610096))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)))

TestNa_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*43.51610096, 0), ymax=Concentration_Deep+SD_D*43.51610096))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)))



TestDOC_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*83.33333333, ymax=Concentration_Shallow+SD_S*83.33333333))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)))

TestDOC_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*83.33333333, 0), ymax=Concentration_Deep+SD_D*83.33333333))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)))


TestAl_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.037062378, ymax=Concentration_Shallow+SD_S*0.037062378))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)))

TestAl_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.037062378, 0), ymax=Concentration_Deep+SD_D*0.037062378))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)))


TestNO3_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.071397468, ymax=Concentration_Shallow+SD_S*0.071397468))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)))

TestNO3_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.071397468, 0), ymax=Concentration_Deep+SD_D*0.071397468))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)))


TestCl_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*28.20635771, ymax=Concentration_Shallow+SD_S*28.20635771))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)))

TestCl_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*28.20635771, 0), ymax=Concentration_Deep+SD_D*28.20635771))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)))

TestNH4_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.071389135, ymax=Concentration_Shallow+SD_S*0.071389135))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)))

TestNH4_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.071389135, 0), ymax=Concentration_Deep+SD_D*0.071389135))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)))

TestSO4_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*43.49906477, ymax=Concentration_Shallow+SD_S*43.49906477))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)))

TestSO4_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*43.49906477, 0), ymax=Concentration_Deep+SD_D*43.49906477))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)))


## Do 3 by 1 Graphs ##

figure1 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig1<-figure1 %>% fill_panel(TestCa_L1,column =1,row = 1) %>%
  fill_panel(TestMg_L1, column=2, row=1) %>%
  fill_panel(TestK_L1, column=3, row=1) 

figure2 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig2<-figure2 %>% fill_panel(TestNa_L1,column =1,row = 1) %>%
  fill_panel(TestAl_L1, column=2, row=1) %>%
  fill_panel(TestSO4_L1, column=3, row=1)

figure3 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig3<-figure3 %>% fill_panel(TestDOC_L1,column =1,row = 1) %>%
  fill_panel(TestCl_L1, column=2, row=1) %>%
  fill_panel(TestNH4_L1, column=3, row=1) 

figure4 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig4<-figure4 %>% fill_panel(TestCa_L2,column =1,row = 1) %>%
  fill_panel(TestMg_L2, column=2, row=1) %>%
  fill_panel(TestK_L2, column=3, row=1) 

figure5 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig5<-figure5 %>% fill_panel(TestNa_L2,column =1,row = 1) %>%
  fill_panel(TestAl_L2, column=2, row=1) %>%
  fill_panel(TestSO4_L2, column=3, row=1)

figure6 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig6<-figure6 %>% fill_panel(TestDOC_L2,column =1,row = 1) %>%
  fill_panel(TestCl_L2, column=2, row=1) %>%
  fill_panel(TestNH4_L2, column=3, row=1)


save_multi_panel_figure(Fig1, "L1_1.png", limitsize=FALSE)
save_multi_panel_figure(Fig2, "L1_2.png", limitsize=FALSE)
save_multi_panel_figure(Fig3, "L1_3.png", limitsize=FALSE)
save_multi_panel_figure(Fig4, "L2_1.png", limitsize=FALSE)
save_multi_panel_figure(Fig5, "L2_2.png", limitsize=FALSE)
save_multi_panel_figure(Fig6, "L2_3.png", limitsize=FALSE)







