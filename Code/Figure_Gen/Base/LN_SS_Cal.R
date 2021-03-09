
#----------------------------------------------------#
### Calibration Figures LN SED Only###
#____________________________________________________#

rm(list = ls())

library(ggplot2)
library(dplyr)
library(reshape2)
library(lubridate)
library(multipanelfigure)

# Set WD #

setwd("~/Project_Master/Test_Rep/Manuscript/Images/LN_SED/Base")

### Measured ###
Df_Lys_LNSED_Conc<-read.csv2("~/Project_Master/Test_Rep/Data/Base Sites/NutsForSEDLN/LN_SED_MonthlyConc.csv")

Df_Lys_LNSED_Conc[c(4:5)]<-lapply(Df_Lys_LNSED_Conc[c(4:5)], as.numeric)

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

G_Ca<-ggplot(subset(Cal_Melt, variable %in% c("Ca") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
    geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("Ca")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
      labs(y=expression(Ca~Concentration~mu*mol/L), title="Ca")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_Mg<- ggplot(subset(Cal_Melt, variable %in% c("Mg") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("Mg")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(Mg~Concentration~mu*mol/L), title="Mg")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_K<-ggplot(subset(Cal_Melt, variable %in% c("K") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("K")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(K~Concentration~mu*mol/L), title="K")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_Na<- ggplot(subset(Cal_Melt, variable %in% c("Na") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("Na")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(Na~Concentration~mu*mol/L), title="Na")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_Al<-ggplot(subset(Cal_Melt, variable %in% c("Al") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("Al")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(Al~Concentration~mu*mol/L), title="Al")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_DOC<- ggplot(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("DOC")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(DOC~Concentration~mu*mol/L), title="DOC")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_P<- ggplot(subset(Cal_Melt, variable %in% c("P") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(aes(x=Date, y=1.7, color="Observed"))+  labs(y=expression(P~Concentration~mu*mol/L), title="P")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_Cl<- ggplot(subset(Cal_Melt, variable %in% c("DOC") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("Cl")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(C1~Concentration~mu*mol/L), title="Cl")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_SO4<- ggplot(subset(Cal_Melt, variable %in% c("SO4") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("SO4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(SO4~Concentration~mu*mol/L), title="SO4")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_NO3<- ggplot(subset(Cal_Melt, variable %in% c("NO3") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("NO3")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(NO3~Concentration~mu*mol/L), title="NO3")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_NH4<- ggplot(subset(Cal_Melt, variable %in% c("NH4") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("NH4")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(NH4~Concentration~mu*mol/L), title="NH4")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

G_R<- ggplot(subset(Cal_Melt, variable %in% c("R") & group_id %in% c("10")), aes(x=Date, y=value, color="Simulated"))+geom_line()+
  geom_line(subset(Df_Lys_LNSED_Conc, Species %in% c("ChargeB")), mapping=aes(x=Date, y=Concentration_Shallow, color="Observed"))+
  labs(y=expression(R-~Concentration~mu*mol/L), title="R")+
  theme(legend.background = element_rect(fill = "lightgray"), text= element_text(size=20))

## Do 3 by 1 Graphs ##

figure1 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig1<-figure1 %>% fill_panel(G_Ca,column =1,row = 1) %>%
  fill_panel(G_Mg, column=2, row=1) %>%
  fill_panel(G_K, column=3, row=1) 

figure2 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig2<-figure2 %>% fill_panel(G_Na,column =1,row = 1) %>%
  fill_panel(G_Al, column=2, row=1) %>%
  fill_panel(G_DOC, column=3, row=1)

figure3 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig3<-figure3 %>% fill_panel(G_P,column =1,row = 1) %>%
  fill_panel(G_Cl, column=2, row=1) %>%
  fill_panel(G_SO4, column=3, row=1) 

figure4 <- multi_panel_figure(
  width = 1000, height = 275,
  columns = 3, rows = 1)

Fig4<-figure4 %>% fill_panel(G_NH4,column =1,row = 1) %>%
  fill_panel(G_NO3, column=2, row=1) %>%
  fill_panel(G_R, column=3, row=1) 

save_multi_panel_figure(Fig1, "L1_1.png", limitsize=FALSE)
save_multi_panel_figure(Fig2, "L1_2.png", limitsize=FALSE)
save_multi_panel_figure(Fig3, "L1_3.png", limitsize=FALSE)
save_multi_panel_figure(Fig4, "L1_4.png", limitsize=FALSE)






