#----------------------------------------------------#
### Calibration Figures HN SED Only###
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
  filter(group_id %in% c("11", "17")) %>%
  filter(YEAR %in% c("2005", "2006")) 

Cal_Pre1<-Cal_Pre[!(Cal_Pre$Month == c("7", "8", "9", "10", "11", "12") & Cal_Pre$YEAR == "2006"),]



Cal_Melt<-melt(Cal_Pre1, id.vars = c("Date", "group_id"))

Cal_Melt[c(4)]<-lapply(Cal_Melt[c(4)], as.numeric)


Cal_Melt<-na.omit(Cal_Melt)

TestCa_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Shallow*40.078/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*40.078/1000-SD_S, ymax=Concentration_Shallow*40.078/1000+SD_S))+ 
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("11")), mapping= aes(x=Date, y=value*40.078/1000, color="Simulated"))+
  labs(y=expression(Ca~(mg/L), color="Legend"))+
  ggtitle("Ca") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestCa_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep*40.078/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep*40.078/1000-SD_D, ymax=Concentration_Deep*40.078/1000+SD_D))+
  geom_line(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("17")), mapping= aes(x=Date, y=value*40.078/1000, color="Simulated"))+
  labs(y=expression(Ca~(mg/L), color="Legend"))+
  ggtitle("Ca") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()





TestMg_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Concentration_Shallow*24.305/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*24.305/1000-SD_S, ymax=Concentration_Shallow*24.305/1000+SD_S))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("11")), mapping= aes(x=Date, y=value*24.305/1000, color="Simulated"))+
  labs(y=expression(Mg~(mg/L), color="Legend"))+
  ggtitle("Mg") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



TestMg_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Deep*24.305/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Deep*24.305/1000-SD_D, ymax=Concentration_Deep*24.305/1000+SD_D))+
  geom_line(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("17")), mapping= aes(x=Date, y=value*24.305/1000, color="Simulated"))+
  labs(y=expression(Mg~(mg/L), color="Legend"))+
  ggtitle("Mg") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



TestK_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Shallow*39.098/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*39.098/1000-SD_S, ymax=Concentration_Shallow*39.098/1000+SD_S))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("11")), mapping= aes(x=Date, y=value*39.098/1000, color="Simulated"))+
  labs(y=expression(K~(mg/L), color="Legend"))+
  ggtitle("K") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestK_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Deep*39.098/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep*39.098/1000-SD_D, 0), ymax=Concentration_Deep*39.098/1000+SD_D))+
  geom_line(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("17")), mapping= aes(x=Date, y=value*39.098/1000, color="Simulated"))+
  labs(y=expression(K~(mg/L), color="Legend"))+
  ggtitle("K") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



TestNa_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Shallow*22.99/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*22.99/1000-SD_S, ymax=Concentration_Shallow*22.99/1000+SD_S))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("11")), mapping= aes(x=Date, y=value*22.99/1000, color="Simulated"))+
  labs(y=expression(Na~(mg/L), color="Legend"))+
  ggtitle("Na") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestNa_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Deep*22.99/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep*22.99/1000-SD_D, 0), ymax=Concentration_Deep*22.99/1000+SD_D))+
  geom_line(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("17")), mapping= aes(x=Date, y=value*22.99/1000, color="Simulated"))+
  labs(y=expression(Na~(mg/L), color="Legend"))+
  ggtitle("Na") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()


TestDOC_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Shallow*12/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*12/1000-SD_S, ymax=Concentration_Shallow*12/1000+SD_S))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("11")), mapping= aes(x=Date, y=value*12/1000, color="Simulated"))+
  labs(y=expression(DOC~(mg/L), color="Legend"))+
  ggtitle("DOC") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestDOC_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Deep*12/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep*12/1000-SD_D, 0), ymax=Concentration_Deep*12/1000+SD_D))+
  geom_line(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("17")), mapping= aes(x=Date, y=value*12/1000, color="Simulated"))+
  labs(y=expression(DOC~(mg/L), color="Legend"))+
  ggtitle("DOC") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



TestAl_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Shallow*26.98/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*26.98/1000-SD_S/1000, ymax=Concentration_Shallow*26.98/1000+SD_S/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("11")), mapping= aes(x=Date, y=value*26.98/1000, color="Simulated"))+
  labs(y=expression(Al~(mg/L), color="Legend"))+
  ggtitle("Al") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestAl_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Deep*26.98/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep/1000-SD_D*26.98/1000, 0), ymax=Concentration_Deep*26.98/1000+SD_D/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("17")), mapping= aes(x=Date, y=value*26.98/1000, color="Simulated"))+
  labs(y=expression(Al~(mg/L), color="Legend"))+
  ggtitle("Al") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



TestNO3_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Shallow/0.071397468/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow/0.071397468/1000-SD_S/1000, ymax=Concentration_Shallow/0.071397468/1000+SD_S/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("11")), mapping= aes(x=Date, y=value*14/1000, color="Simulated"))+
  labs(y=expression(NO3-N~(mg/L), color="Legend"))+
  ggtitle("NO3-N") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestNO3_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Deep/0.071397468/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep/0.071397468/1000-SD_D/1000, 0), ymax=Concentration_Deep/0.071397468/1000+SD_D/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("17")), mapping= aes(x=Date, y=value/0.071397468/1000, color="Simulated"))+
  labs(y=expression(NO3-N~(mg/L), color="Legend"))+
  ggtitle("NO3-N") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()




TestCl_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Shallow*35.45/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow*35.45/1000-SD_S, ymax=Concentration_Shallow*35.45/1000+SD_S))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("11")), mapping= aes(x=Date, y=value*35.45/1000, color="Simulated"))+
  labs(y=expression(Cl~(mg/L), color="Legend"))+
  ggtitle("Cl") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestCl_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Deep*35.45/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep*35.45/1000-SD_D, 0), ymax=Concentration_Deep*35.45/1000+SD_D))+
  geom_line(subset(Cal_Melt, variable %in% c("Cl") & group_id %in% c("17")), mapping= aes(x=Date, y=value*35.45/1000, color="Simulated"))+
  labs(y=expression(Cl~(mg/L), color="Legend"))+
  ggtitle("Cl") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



TestNH4_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Shallow/0.071389135/1000, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow/0.071389135/1000-SD_S/1000, ymax=Concentration_Shallow/0.071389135/1000+SD_S/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("11")), mapping= aes(x=Date, y=value/0.071389135/1000, color="Simulated"))+
  labs(y=expression(NH4~(mg/L), color="Legend"))+
  ggtitle("NH4") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()

TestNH4_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Deep/0.071389135/1000, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep/0.071389135/1000-SD_D/1000, 0), ymax=Concentration_Deep/0.071389135/1000+SD_D/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("17")), mapping= aes(x=Date, y=value/0.071389135/1000, color="Simulated"))+
  labs(y=expression(NH4~(mg/L), color="Legend"))+
  ggtitle("NH4") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()




TestSO4_L1<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Shallow/43.49906477, color="Observed"))+
  geom_pointrange(aes(ymin=Concentration_Shallow/43.49906477-SD_S/1000, ymax=Concentration_Shallow/43.49906477+SD_S/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("11")), mapping= aes(x=Date, y=value/43.49906477, color="Simulated"))+
  ggtitle("SO4-S") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()+
  labs(y=expression(SO4-S~(mg/L),color="Legend"))

TestSO4_L2<- ggplot(subset(Df_Lys_HNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Deep/43.49906477, color="Observed"))+
  geom_pointrange(aes(ymin=pmax(Concentration_Deep/43.49906477-SD_D/1000, 0), ymax=Concentration_Deep/43.49906477+SD_D/1000))+
  geom_line(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("17")), mapping= aes(x=Date, y=value/43.49906477, color="Simulated"))+
  labs(y=expression(SO4-S~(mg/L), color="Legend"))+
  ggtitle("SO4-S") +theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(name="Legend",values=c("#E69F00", "#56B4E9"))+theme_classic2()



ggarrange(TestCa_L1, TestCa_L2, TestMg_L1, TestMg_L2,TestK_L1,TestK_L2,TestNa_L1, TestNa_L2 , TestNH4_L1, TestNH4_L2,labels=c(" ", "", " ", "", " ", "", " ", "", " ", ""),ncol = 2, nrow = 5, common.legend = TRUE, legend = "right") %>%
  ggexport(filename="BaseCations.png", height=1000, width=750, res=95)

ggarrange(TestCl_L1, TestCl_L2, TestDOC_L1, TestDOC_L2, TestNO3_L1, TestNO3_L2 ,TestSO4_L1, TestSO4_L2 , TestAl_L1, TestAl_L2,labels=c(" ", "", " ", "", " ", "", " ", "", "", ""),ncol = 2, nrow = 5, common.legend = TRUE, legend = "right") %>%
  ggexport(filename="Anions.png", height=1000, width=750, res=95)











