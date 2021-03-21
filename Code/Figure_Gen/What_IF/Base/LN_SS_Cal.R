
#----------------------------------------------------#
### Calibration Figures LN SED Only###
#____________________________________________________#

rm(list = ls())

library(ggplot2)
library(dplyr)
library(reshape2)
library(lubridate)
library(multipanelfigure)

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

Cal_Pre<-Cal_Pre[!(Cal_Pre$Month == c("7", "8", "9", "10", "11", "12") & Cal_Pre$YEAR == "2006"),]


Cal_Melt<-melt(Cal_Pre, id.vars = c("Date", "group_id"))

Cal_Melt[c(4)]<-lapply(Cal_Melt[c(4)], as.numeric)


Cal_Melt<-na.omit(Cal_Melt)



Db_TestCa1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Conc_S_3*24.95134488, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*24.95134488-(SD_S_3*24.95134488),0), ymax=Conc_S_3*24.95134488+(SD_S_3*24.95134488)))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)), color="Legend")+
  ggtitle("Ca")+ theme(plot.title = element_text(hjust = 0.5))

png("CaL1.png", height=250, width=500, res=100)
plot(Db_TestCa1)
dev.off()


Db_TestCa2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Conc_D_3*24.95134488, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*24.95134488-(SD_D_3*24.95134488),0), ymax=Conc_D_3*24.95134488+(SD_D_3*24.95134488)))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Ca~(mu~mol/l)), color="Legend")+
  ggtitle("Ca")+ theme(plot.title = element_text(hjust = 0.5))


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


Db_TestMg1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Conc_S_3*41.14379757, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*41.14379757-(SD_S_3*41.14379757),0), ymax=Conc_S_3*41.14379757+(SD_S_3*41.14379757)))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)), color="Legend")+
  ggtitle("Mg")+ theme(plot.title = element_text(hjust = 0.5))



Db_TestMg2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Conc_D_3*41.14379757, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*41.14379757-(SD_D_3*41.14379757),0), ymax=Conc_D_3*41.14379757+(SD_D_3*41.14379757)))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)), color="Legend")+
         ggtitle("Mg")+ theme(plot.title = element_text(hjust = 0.5))


TestMg_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*41.14379757, ymax=Concentration_Shallow+SD_S*41.14379757))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)), color="Legend")+
  ggtitle("Mg")+ theme(plot.title = element_text(hjust = 0.5))


TestMg_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep-SD_D*41.14379757, ymax=Concentration_Deep+SD_D*41.14379757))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Mg~(mu~mol/l)))

Db_TestK1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Conc_S_3*33.22446783, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*33.22446783-(SD_S_3*33.22446783),0), ymax=Conc_S_3*33.22446783+(SD_S_3*33.22446783)))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)), color="Legend")+
  ggtitle("K")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestK2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Conc_D_3*33.22446783, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*33.22446783-(SD_D_3*33.22446783),0), ymax=Conc_D_3*33.22446783+(SD_D_3*33.22446783)))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)), color="Legend")+
  ggtitle("K")+ theme(plot.title = element_text(hjust = 0.5))

TestK_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*33.22446783, ymax=Concentration_Shallow+SD_S*33.22446783))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)))

TestK_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*33.22446783, 0), ymax=Concentration_Deep+SD_D*33.22446783))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(K~(mu~mol/l)))

Db_TestNa1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Conc_S_3*43.51610096, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*43.51610096-(SD_S_3*43.51610096), 0), ymax=Conc_S_3*43.51610096+(SD_S_3*43.51610096)))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)), color="Legend")+
  ggtitle("Na")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestNa2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Conc_D_3*43.51610096, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*43.51610096-(SD_D_3*43.51610096), 0), ymax=Conc_D_3*43.51610096+(SD_D_3*43.51610096)))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)), color="Legend")+
  ggtitle("Na")+ theme(plot.title = element_text(hjust = 0.5))

TestNa_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*43.51610096, ymax=Concentration_Shallow+SD_S*43.51610096))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)))

TestNa_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*43.51610096, 0), ymax=Concentration_Deep+SD_D*43.51610096))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Na~(mu~mol/l)))

Db_TestDOC1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Conc_S_3*83.33333333, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*83.33333333-(SD_S_3*83.33333333),0), ymax=Conc_S_3*83.33333333+(SD_S_3*83.33333333)))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)), color="Legend")+
  ggtitle("DOC")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestDOC2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Conc_D_3*83.33333333, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*83.33333333-(SD_D_3*83.33333333),0), ymax=Conc_D_3*83.33333333+(SD_D_3*83.33333333)))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)), color="Legend")+
  ggtitle("DOC")+ theme(plot.title = element_text(hjust = 0.5))

TestDOC_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*83.33333333, ymax=Concentration_Shallow+SD_S*83.33333333))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)))

TestDOC_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*83.33333333, 0), ymax=Concentration_Deep+SD_D*83.33333333))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(DOC~(mu~mol/l)))

Db_TestAl1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Conc_S_3*0.037062378, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*0.037062378-(SD_S_3*0.037062378),0), ymax=Conc_S_3*0.037062378+(SD_S_3*0.037062378)))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)), color="Legend")+
  ggtitle("Al")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestAl2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Conc_D_3*0.037062378, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*0.037062378-(SD_D_3*0.037062378),0), ymax=Conc_D_3*0.037062378+(SD_D_3*0.037062378)))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)), color="Legend")+
  ggtitle("Al")+ theme(plot.title = element_text(hjust = 0.5))

TestAl_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.037062378, ymax=Concentration_Shallow+SD_S*0.037062378))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)))

TestAl_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.037062378, 0), ymax=Concentration_Deep+SD_D*0.037062378))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Al~(mu~mol/l)))

Db_TestNO31<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Conc_S_3*0.071397468, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*0.071397468-(SD_S_3*0.071397468),0), ymax=Conc_S_3*0.071397468+(SD_S_3*0.071397468)))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)), color="Legend")+
  ggtitle("NO3")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestNO32<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Conc_D_3*0.071397468, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*0.071397468-(SD_D_3*0.071397468),0), ymax=Conc_D_3*0.071397468+(SD_D_3*0.071397468)))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)), color="Legend")+
  ggtitle("NO3")+ theme(plot.title = element_text(hjust = 0.5))

TestNO3_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.071397468, ymax=Concentration_Shallow+SD_S*0.071397468))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)))

TestNO3_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.071397468, 0), ymax=Concentration_Deep+SD_D*0.071397468))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NO3~(mu~mol/l)))


Db_TestCl1<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Conc_S_3*28.20635771, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*28.20635771-(SD_S_3*28.20635771),0), ymax=Conc_S_3*28.20635771+(SD_S_3*28.20635771)))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)), color="Legend")+
  ggtitle("Cl")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestCl2<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Conc_D_3*28.20635771, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*28.20635771-(SD_D_3*28.20635771),0), ymax=Conc_D_3*28.20635771+(SD_D_3*28.20635771)))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)), color="Legend")+
  ggtitle("Cl")+ theme(plot.title = element_text(hjust = 0.5))


TestCl_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*28.20635771, ymax=Concentration_Shallow+SD_S*28.20635771))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)))

TestCl_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*28.20635771, 0), ymax=Concentration_Deep+SD_D*28.20635771))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(Cl~(mu~mol/l)))

Db_TestNH41<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Conc_S_3*0.071389135, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*0.071389135-(SD_S_3*0.071389135),0), ymax=Conc_S_3*0.071389135+(SD_S_3*0.071389135)))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)), color="Legend")+
  ggtitle("NH4")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestNH42<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Conc_D_3*0.071389135, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*0.071389135-(SD_D_3*0.071389135),0), ymax=Conc_D_3*0.071389135+(SD_D_3*0.071389135)))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)), color="Legend")+
  ggtitle("NH4")+ theme(plot.title = element_text(hjust = 0.5))

TestNH4_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*0.071389135, ymax=Concentration_Shallow+SD_S*0.071389135))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)))

TestNH4_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*0.071389135, 0), ymax=Concentration_Deep+SD_D*0.071389135))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(NH4~(mu~mol/l)))


Db_TestSO41<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Conc_S_3*43.49906477, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_S_3*43.49906477-(SD_S_3*43.49906477), 0), ymax=Conc_S_3*43.49906477+(SD_S_3*43.49906477)))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)), color="Legend")+
  ggtitle("SO4")+ theme(plot.title = element_text(hjust = 0.5))

Db_TestSO42<-ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Conc_D_3*43.49906477, color="Pseudo"))+
  geom_pointrange(aes(ymin=pmax(Conc_D_3*43.49906477-(SD_D_3*43.49906477),0), ymax=Conc_D_3*43.49906477+(SD_D_3*43.49906477)))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)), color="Legend")+
  ggtitle("SO4")+ theme(plot.title = element_text(hjust = 0.5))

TestSO4_L1<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow-SD_S*43.49906477, ymax=Concentration_Shallow+SD_S*43.49906477))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("10")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)))

TestSO4_L2<- ggplot(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Deep, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep-SD_D*43.49906477, 0), ymax=Concentration_Deep+SD_D*43.49906477))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("17")), mapping= aes(x=Date, y=value, color="Simulated"))+
  labs(y=expression(SO4~(mu~mol/l)))


## Do 3 by 1 Graphs ##


Figure_Db<-multi_panel_figure(
  width = 1000, height = 750,
  columns = 1, rows = 3
  )

FigYOINK<-Figure_Db %>% fill_panel(Db_TestCa1, column =1,row = 1) %>%
  fill_panel(Db_TestMg1, column=1, row=2) %>%
  fill_panel(Db_TestK1, column=1, row=3)


FigYOINK2<-Figure_Db %>% fill_panel(Db_TestCa2, column =1,row = 1) %>%
  fill_panel(Db_TestMg2, column=2, row=1) %>%
  fill_panel(Db_TestK2, column=3, row=1) %>%
  fill_panel(Db_TestNa2, column=4, row=1) %>%
  fill_panel(Db_TestAl2, column=5, row=1) %>%
  fill_panel(Db_TestCl2, column=1, row=2) %>%
  fill_panel(Db_TestDOC2, column=2, row=2) %>%
  fill_panel(Db_TestSO42, column=3, row=2) %>%
  fill_panel(Db_TestNH42, column=4, row=2) %>%
  fill_panel(Db_TestNO32, column=5, row=2)




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
save_multi_panel_figure(FigYOINK, "L1_Avg3_All.png", limitsize=FALSE)
save_multi_panel_figure(FigYOINK2, "L2_Avg3_All.png", limitsize=FALSE)






