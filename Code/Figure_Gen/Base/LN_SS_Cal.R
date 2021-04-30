
#----------------------------------------------------#
### Calibration Figures LN SED Only###
#____________________________________________________#

rm(list = ls())

library(ggplot2)
library(dplyr)
library(reshape2)
library(lubridate)
library(ggpubr)
library(gridExtra)
library(grid)
library(cowplot)

# Update File

source("~/Project_Master/Test_Rep/Code/LN_SED/Base/Soil_Soln_LN_SED_Mutator.R")

# Set WD #

setwd("~/Project_Master/Test_Rep/Manuscript/Images/LN_SED/Base")

### Measured ###
Df_Lys_LNSED_Conc<-read.csv2("~/Project_Master/Test_Rep/Data/Base Sites/NutsForSEDLN/LN_SED_MonthlyConc.csv")

Df_Lys_LNSED_Conc[c(4:11)]<-lapply(Df_Lys_LNSED_Conc[c(4:11)], as.numeric)

Df_Lys_LNSED_Conc<-Df_Lys_LNSED_Conc %>% mutate(Date=make_date(Year, Month))
### Simulated ###
Cal_Pretable_Parent<-read.csv2("~/Project_Master/Test_Rep/Output/Calibration/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)
Cal_Pretable_SS<-Cal_Pretable_Parent %>% filter(group_id %in% c("10", "11", "12", "13", "14", "15", "16", "17"))
Cal_Pretable_SS$group_id<-as.character(Cal_Pretable_SS$group_id)
Cal_Pretable_SS$Date<-as.Date(Cal_Pretable_SS$Date)

Cal_Pretable_SS

Cal_Pre<-Cal_Pretable_SS %>% 
  filter(group_id %in% c("10", "17")) %>%
  filter(YEAR %in% c("2005", "2006")) 

Cal_Pre1<-Cal_Pre[!(Cal_Pre$Month == c("7", "8", "9", "10", "11", "12") & Cal_Pre$YEAR == "2006"),]



Cal_Melt<-melt(Cal_Pre, id.vars = c("Date", "group_id"))

Cal_Melt[c(4)]<-lapply(Cal_Melt[c(4)], as.numeric)


Cal_Melt<-na.omit(Cal_Melt)



Db_TestCa1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Conc_S_3*24.95134488, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*24.95134488-(SD_S_3*24.95134488),0), ymax=Conc_S_3*24.95134488+(SD_S_3*24.95134488)))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Ca", color="Legend")+ theme_classic2()+
  ggtitle("20 cm", subtitle = expression(mu*mol~L^-1))+ theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.position = "none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))



Db_TestCa2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Conc_D_3*24.95134488, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*24.95134488-(SD_D_3*24.95134488),0), ymax=Conc_D_3*24.95134488+(SD_D_3*24.95134488)))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Ca", color="Legend")+theme_classic2()+
  ggtitle("100 cm", subtitle = expression(mu*mol~L^-1))+ theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5) ,legend.position=c(.85, .85))+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))


TestCa_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*24.95134488, ymax=Concentration_Shallow+SD_S*24.95134488))+ 
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)), color="Legend")+
  ggtitle("Ca") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestCa_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep-SD_D*24.95134488, ymax=Concentration_Deep+SD_D*24.95134488))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)))


Db_TestMg1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Conc_S_3*41.14379757, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*41.14379757-(SD_S_3*41.14379757),0), ymax=Conc_S_3*41.14379757+(SD_S_3*41.14379757)))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Mg", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))



Db_TestMg2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Conc_D_3*41.14379757, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*41.14379757-(SD_D_3*41.14379757),0), ymax=Conc_D_3*41.14379757+(SD_D_3*41.14379757)))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Mg", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))


TestMg_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*41.14379757, ymax=Concentration_Shallow+SD_S*41.14379757))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)), color="Legend")+
  ggtitle("Mg")+ theme(plot.title = element_text(hjust = 0.5))


TestMg_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep-SD_D*41.14379757, ymax=Concentration_Deep+SD_D*41.14379757))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)))

Db_TestK1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Conc_S_3*33.22446783, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*33.22446783-(SD_S_3*33.22446783),0), ymax=Conc_S_3*33.22446783+(SD_S_3*33.22446783)))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="K", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestK2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Conc_D_3*33.22446783, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*33.22446783-(SD_D_3*33.22446783),0), ymax=Conc_D_3*33.22446783+(SD_D_3*33.22446783)))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="K", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestK_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*33.22446783, ymax=Concentration_Shallow+SD_S*33.22446783))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)))

TestK_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*33.22446783, 0), ymax=Concentration_Deep+SD_D*33.22446783))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)))

Db_TestNa1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Conc_S_3*43.51610096, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*43.51610096-(SD_S_3*43.51610096), 0), ymax=Conc_S_3*43.51610096+(SD_S_3*43.51610096)))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Na", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestNa2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Conc_D_3*43.51610096, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*43.51610096-(SD_D_3*43.51610096), 0), ymax=Conc_D_3*43.51610096+(SD_D_3*43.51610096)))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Na", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestNa_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*43.51610096, ymax=Concentration_Shallow+SD_S*43.51610096))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)))

TestNa_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*43.51610096, 0), ymax=Concentration_Deep+SD_D*43.51610096))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)))

Db_TestDOC1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Conc_S_3*83.33333333, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*83.33333333-(SD_S_3*83.33333333),0), ymax=Conc_S_3*83.33333333+(SD_S_3*83.33333333)))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)), color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestDOC2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Conc_D_3*83.33333333, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*83.33333333-(SD_D_3*83.33333333),0), ymax=Conc_D_3*83.33333333+(SD_D_3*83.33333333)))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)), color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestDOC_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*83.33333333, ymax=Concentration_Shallow+SD_S*83.33333333))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)))

TestDOC_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*83.33333333, 0), ymax=Concentration_Deep+SD_D*83.33333333))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)))

Db_TestAl1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Conc_S_3*0.037062378, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*0.037062378-(SD_S_3*0.037062378),0), ymax=Conc_S_3*0.037062378+(SD_S_3*0.037062378)))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Al", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestAl2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Conc_D_3*0.037062378, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*0.037062378-(SD_D_3*0.037062378),0), ymax=Conc_D_3*0.037062378+(SD_D_3*0.037062378)))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Al", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestAl_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.037062378, ymax=Concentration_Shallow+SD_S*0.037062378))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)))

TestAl_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.037062378, 0), ymax=Concentration_Deep+SD_D*0.037062378))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)))

Db_TestNO31<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Conc_S_3*0.071397468, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*0.071397468-(SD_S_3*0.071397468),0), ymax=Conc_S_3*0.071397468+(SD_S_3*0.071397468)))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="NO3", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestNO32<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Conc_D_3*0.071397468, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*0.071397468-(SD_D_3*0.071397468),0), ymax=Conc_D_3*0.071397468+(SD_D_3*0.071397468)))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="NO3", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestNO3_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.071397468, ymax=Concentration_Shallow+SD_S*0.071397468))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)))

TestNO3_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.071397468, 0), ymax=Concentration_Deep+SD_D*0.071397468))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)))


Db_TestCl1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Conc_S_3*28.20635771, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*28.20635771-(SD_S_3*28.20635771),0), ymax=Conc_S_3*28.20635771+(SD_S_3*28.20635771)))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Cl", color="Legend")+theme_classic2()+ theme_classic2()+
  ggtitle("20 cm", subtitle = expression(mu*mol~L^-1))+ theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.position = "none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestCl2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Conc_D_3*28.20635771, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*28.20635771-(SD_D_3*28.20635771),0), ymax=Conc_D_3*28.20635771+(SD_D_3*28.20635771)))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="Cl", color="Legend")+theme_classic2()+
  ggtitle("100 cm", subtitle = expression(mu*mol~L^-1))+ theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5) ,legend.position=c(.85, .85))+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))


TestCl_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*28.20635771, ymax=Concentration_Shallow+SD_S*28.20635771))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)))

TestCl_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*28.20635771, 0), ymax=Concentration_Deep+SD_D*28.20635771))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)))

Db_TestNH41<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Conc_S_3*0.071389135, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*0.071389135-(SD_S_3*0.071389135),0), ymax=Conc_S_3*0.071389135+(SD_S_3*0.071389135)))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="NH4", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

Db_TestNH42<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Conc_D_3*0.071389135, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*0.071389135-(SD_D_3*0.071389135),0), ymax=Conc_D_3*0.071389135+(SD_D_3*0.071389135)))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="NH4", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestNH4_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.071389135, ymax=Concentration_Shallow+SD_S*0.071389135))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)))

TestNH4_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.071389135, 0), ymax=Concentration_Deep+SD_D*0.071389135))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)))


Db_TestSO41<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Conc_S_3*43.49906477, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*43.49906477-(SD_S_3*43.49906477), 0), ymax=Conc_S_3*43.49906477+(SD_S_3*43.49906477)))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="SO4", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))


Db_TestSO42<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Conc_D_3*43.49906477, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*43.49906477-(SD_D_3*43.49906477),0), ymax=Conc_D_3*43.49906477+(SD_D_3*43.49906477)))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y="SO4", color="Legend")+theme_classic2()+
  ggtitle("")+ theme(plot.title = element_text(hjust = 0.5), legend.position="none")+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))

TestSO4_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*43.49906477, ymax=Concentration_Shallow+SD_S*43.49906477))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)))

TestSO4_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*43.49906477, 0), ymax=Concentration_Deep+SD_D*43.49906477))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)))



ggarrange(Db_TestCa1, Db_TestCa2,Db_TestMg1, Db_TestMg2,Db_TestK1,Db_TestK2 ,Db_TestNa1, Db_TestNa2 ,Db_TestNH41, Db_TestNH42,labels=c("Ca", "", "Mg", "", "K", "", "Na", "", "NH4", ""),ncol = 2, nrow = 5) %>%
  ggexport(filename="BaseCations.png", height=1000, width=750, res=95)

ggarrange(Db_TestCl1, Db_TestCl2,Db_TestDOC1, Db_TestDOC2,Db_TestNO31,Db_TestNO32 ,Db_TestSO41, Db_TestSO42 ,Db_TestAl1, Db_TestAl2,labels=c("Cl", "", "DOC", "", "NO3", "", "SO4", "", "Al", ""),ncol = 2, nrow = 5) %>%
  ggexport(filename="Anions.png", height=1000, width=750, res=95)

