# LNS Break
rm(list = ls())

library(ggplot2)
library(dplyr)
library(lubridate)
library(ggpubr)

Years<-seq(2005, 2105, 1)

SOM_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/SOM.csv")

PP_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Plant_Pool.csv")

Bio_Cycle_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Bio_Cycle.csv")

PP_LNS$Ca_PU<-PP_LNS$Ca_PU*40.078*10000/1e6/1000


SOM_LNS<-SOM_LNS %>%group_by(Year, Month)%>% select(-Date) %>% summarize(across(C:P, ~sum(.x, na.rm = TRUE))) %>%
  mutate(Date = make_date(Year, Month)) %>% filter(Month %in% 1)




CEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/CEC_All.csv", header=TRUE)
Litter_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Litter_Pool.csv", header=TRUE)

Litter_All_LNS<-Litter_All_LNS %>% filter(Month %in% 1)


CEC_All_LNS$Date<-as.Date(CEC_All_LNS$Date)

CEC_All_LNS[, "year"] <- format(CEC_All_LNS[,"Date"], "%Y")
CEC_All_LNS[, "month"] <- format(CEC_All_LNS[,"Date"], "%m")

CEC_LNS<-CEC_All_LNS %>% group_by(year, month) %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Date=make_date(year, month))%>% 
  filter(month %in% "01")

CEC_LNS$Date<-as.Date(CEC_LNS$Date)

label_color<-c("Ca", "Mg", "K", expression(N[O]), expression(P[O]), expression(S[O]))

LNS<-ggplot(CEC_LNS, aes(x=Date, y=PP_LNS$Ca_PU/(CEC_LNS$Ca+Litter_All_LNS$Ca), color="Ca", linetype="Ca")) + geom_line()+
  #geom_line(SOM_LNS, mapping=aes(y=PP_LNS$P_PU*30.97*10000/1e6/1000/(P*30.974*10)+PP_LNS$P_PU*30.97*10000/1e6/1000/Litter_All_LNS$P, color="P", linetype="P"))+
  #geom_line(aes(y=PP_LNS$K_PU*39.0983*10000/1e6/1000/(CEC_LNS$K+Litter_All_LNS$K), color="K", linetype="K"))+
  geom_line(aes(y=PP_LNS$Mg_PU*24.453*10000/1e6/1000/(CEC_LNS$Mg+Litter_All_LNS$Mg), color="Mg", linetype="Mg"))+
  #geom_line(SOM_LNS, mapping=aes(y=abs((PP_LNS$N_PU*14.0067*10000/1e6/1000)/(Bio_Cycle_LNS$N_MinSUM)), color="N", linetype="N"))+
  labs(x="Year", y="Depletion Index")+
  geom_hline(yintercept = 0)+
  geom_vline(xintercept = 2420-01-01)+
  ggtitle("Low N Sedimentary", subtitle="40 BO")+
  theme_classic2()

  #geom_line(aes(y=CEC_LNS$Mg/2448.663+Litter_All_LNS$Mg/2448.663, color="Mg", linetype="Mg"))+
  geom_line(aes(y=CEC_LNS$K/1325.840+Litter_All_LNS$K/1325.840, color="K", linetype="K"))+
  geom_line(SOM_LNS, mapping=aes(y=N*14*10/9340.759+Litter_All_LNS$N/9340.759, color="N", linetype="N"))+
  geom_line(SOM_LNS, mapping=aes(y=P*30.974*10/PP_LNS$P_PU*30.97*10000/1e6/1000+Litter_All_LNS$P/PP_LNS$P_PU*30.97*10000/1e6/1000, color="P", linetype="P"))+
  geom_line(SOM_LNS, mapping=aes(y=S*32.065*10/754+Litter_All_LNS$S/754, color="S", linetype="S"))+
  scale_linetype_manual(values=c("solid", "solid", "solid", "dashed", "dashed", "dashed"), label=label_color)+
  scale_color_manual(values=c("red3", "orange", "magenta2", "blue", "green2", "grey"), label=label_color)+
  theme_classic2()+
  labs(color  = "Species", linetype="Species")+
  geom_hline(yintercept= 1)+
  ggtitle("LN Sedimentary")+
  labs(x="Year", y="Change in Nutrient Pool Size")+
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1.5, 'cm'),  text=element_text(family="A", size=15))
