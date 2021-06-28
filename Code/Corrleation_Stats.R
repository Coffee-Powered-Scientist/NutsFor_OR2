
## Correlation Plots ###

rm(list = ls())

library(ggplot2)
library(dplyr)
library(Hmisc)
library(reshape2)
library(ggpubr)
library(rstatix)
library(broom)


# LNS

Leaching_Pre_LNS4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS4B<-Leaching_Pre_LNS4B %>% filter(group_id %in% 8)

L8_LNS_4B<-Leaching_8_LNS4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNS8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS8B<-Leaching_Pre_LNS8B %>% filter(group_id %in% 8)

L8_LNS_8B<-Leaching_8_LNS8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNS4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS4W<-Leaching_Pre_LNS4W %>% filter(group_id %in% 8)

L8_LNS_4W<-Leaching_8_LNS4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNS8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNS8W<-Leaching_Pre_LNS8W %>% filter(group_id %in% 8)

L8_LNS_8W<-Leaching_8_LNS8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


L8_LNS_4B$Harvest<-"40 BO"
L8_LNS_8B$Harvest<-"80 BO"
L8_LNS_4W$Harvest<-"40 WTH"
L8_LNS_8W$Harvest<-"80 WTH"

LNS_Bound<-rbind(L8_LNS_4B, L8_LNS_4W, L8_LNS_8B, L8_LNS_8W)

Ca_LNS_4W_lm <- lm(Ca ~ NO3, data = L8_LNS_4W)
Ca_LNS_8W_lm <- lm(Ca ~ NO3, data = L8_LNS_8W)
Ca_LNS_4B_lm <- lm(Ca ~ NO3, data = L8_LNS_4B)
Ca_LNS_8B_lm <- lm(Ca ~ NO3, data = L8_LNS_8B)


ggplot(LNS_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_LNS_4B_lm)[[2]], intercept = coef(Ca_LNS_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_LNS_8B_lm)[[2]], intercept = coef(Ca_LNS_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_LNS_4W_lm)[[2]], intercept = coef(Ca_LNS_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_LNS_8W_lm)[[2]], intercept = coef(Ca_LNS_8W_lm)[[1]], color="purple",  size=1.2)







Homo_gen_LNS<-LNS_Bound%>% anova_test(Ca ~ Harvest*NO3)

# HNS


Leaching_Pre_HNS4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS4B<-Leaching_Pre_HNS4B %>% filter(group_id %in% 8)

L8_HNS_4B<-Leaching_8_HNS4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS8B<-Leaching_Pre_HNS8B %>% filter(group_id %in% 8)

L8_HNS_8B<-Leaching_8_HNS8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS4W<-Leaching_Pre_HNS4W %>% filter(group_id %in% 8)

L8_HNS_4W<-Leaching_8_HNS4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNS8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNS8W<-Leaching_Pre_HNS8W %>% filter(group_id %in% 8)

L8_HNS_8W<-Leaching_8_HNS8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


L8_HNS_4B$Harvest<-"40 BO"
L8_HNS_8B$Harvest<-"80 BO"
L8_HNS_4W$Harvest<-"40 WTH"
L8_HNS_8W$Harvest<-"80 WTH"

HNS_Bound<-rbind(L8_HNS_4B, L8_HNS_4W, L8_HNS_8B, L8_HNS_8W)

Ca_HNS_4W_lm <- lm(Ca ~ NO3, data = L8_HNS_4W)
Ca_HNS_8W_lm <- lm(Ca ~ NO3, data = L8_HNS_8W)
Ca_HNS_4B_lm <- lm(Ca ~ NO3, data = L8_HNS_4B)
Ca_HNS_8B_lm <- lm(Ca ~ NO3, data = L8_HNS_8B)


ggplot(HNS_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_HNS_4B_lm)[[2]], intercept = coef(Ca_HNS_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_HNS_8B_lm)[[2]], intercept = coef(Ca_HNS_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_HNS_4W_lm)[[2]], intercept = coef(Ca_HNS_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_HNS_8W_lm)[[2]], intercept = coef(Ca_HNS_8W_lm)[[1]], color="purple",  size=1.2)



Homo_gen_HNS<-HNS_Bound%>% anova_test(Ca ~ Harvest*NO3)


#Basalt

Leaching_Pre_LNB4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB4B<-Leaching_Pre_LNB4B %>% filter(group_id %in% 8)

L8_LNB_4B<-Leaching_8_LNB4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB8B<-Leaching_Pre_LNB8B %>% filter(group_id %in% 8)

L8_LNB_8B<-Leaching_8_LNB8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB4W<-Leaching_Pre_LNB4W %>% filter(group_id %in% 8)

L8_LNB_4W<-Leaching_8_LNB4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_LNB8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_LNB8W<-Leaching_Pre_LNB8W %>% filter(group_id %in% 8)

L8_LNB_8W<-Leaching_8_LNB8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


L8_LNB_4B$Harvest<-"40 BO"
L8_LNB_8B$Harvest<-"80 BO"
L8_LNB_4W$Harvest<-"40 WTH"
L8_LNB_8W$Harvest<-"80 WTH"

LNB_Bound<-rbind(L8_LNB_4B, L8_LNB_4W, L8_LNB_8B, L8_LNB_8W)

Ca_LNB_4W_lm <- lm(Ca ~ NO3, data = L8_LNB_4W)
Ca_LNB_8W_lm <- lm(Ca ~ NO3, data = L8_LNB_8W)
Ca_LNB_4B_lm <- lm(Ca ~ NO3, data = L8_LNB_4B)
Ca_LNB_8B_lm <- lm(Ca ~ NO3, data = L8_LNB_8B)


ggplot(LNB_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_LNB_4B_lm)[[2]], intercept = coef(Ca_LNB_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_LNB_8B_lm)[[2]], intercept = coef(Ca_LNB_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_LNB_4W_lm)[[2]], intercept = coef(Ca_LNB_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_LNB_8W_lm)[[2]], intercept = coef(Ca_LNB_8W_lm)[[1]], color="purple",  size=1.2)



Homo_gen_LNB<-LNB_Bound%>% anova_test(Ca ~ Harvest*NO3)

# HNB


Leaching_Pre_HNB4B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB4B<-Leaching_Pre_HNB4B %>% filter(group_id %in% 8)

L8_HNB_4B<-Leaching_8_HNB4B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB8B<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_BO/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB8B<-Leaching_Pre_HNB8B %>% filter(group_id %in% 8)

L8_HNB_8B<-Leaching_8_HNB8B %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB4W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB4W<-Leaching_Pre_HNB4W %>% filter(group_id %in% 8)

L8_HNB_4W<-Leaching_8_HNB4W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


Leaching_Pre_HNB8W<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/80_WTH/Edited Data/Soil_Solution_All2.csv")

Leaching_8_HNB8W<-Leaching_Pre_HNB8W %>% filter(group_id %in% 8)

L8_HNB_8W<-Leaching_8_HNB8W %>% group_by(YEAR) %>% summarise(across(Ca:Si, ~sum(.x, na.rm=TRUE)))


L8_HNB_4B$Harvest<-"40 BO"
L8_HNB_8B$Harvest<-"80 BO"
L8_HNB_4W$Harvest<-"40 WTH"
L8_HNB_8W$Harvest<-"80 WTH"

HNB_Bound<-rbind(L8_HNB_4B, L8_HNB_4W, L8_HNB_8B, L8_HNB_8W)

Ca_HNB_4W_lm <- lm(Ca ~ NO3, data = L8_HNB_4W)
Ca_HNB_8W_lm <- lm(Ca ~ NO3, data = L8_HNB_8W)
Ca_HNB_4B_lm <- lm(Ca ~ NO3, data = L8_HNB_4B)
Ca_HNB_8B_lm <- lm(Ca ~ NO3, data = L8_HNB_8B)


ggplot(HNB_Bound, aes(x=NO3, y=Ca, color=Harvest))+geom_point()+
  geom_abline(slope = coef(Ca_HNB_4B_lm)[[2]], intercept = coef(Ca_HNB_4B_lm)[[1]], color="red", linetype="dashed", size=1.2)+
  geom_abline(slope = coef(Ca_HNB_8B_lm)[[2]], intercept = coef(Ca_HNB_8B_lm)[[1]], color="blue", size=1.2)+
  geom_abline(slope = coef(Ca_HNB_4W_lm)[[2]], intercept = coef(Ca_HNB_4W_lm)[[1]], color="green",linetype="dashed" ,size=1.2)+
  geom_abline(slope = coef(Ca_HNB_8W_lm)[[2]], intercept = coef(Ca_HNB_8W_lm)[[1]], color="purple",  size=1.2)


ggplot(LNS_Bound, aes(x=Harvest, y=Ca, color=Harvest))+geom_boxplot()
ggplot(HNS_Bound, aes(x=Harvest, y=Ca, color=Harvest))+geom_boxplot()
ggplot(LNB_Bound, aes(x=Harvest, y=Ca, color=Harvest))+geom_boxplot()
ggplot(HNB_Bound, aes(x=Harvest, y=Ca, color=Harvest))+geom_boxplot()


Homo_gen_HNB<-HNB_Bound%>% anova_test(Ca ~ Harvest*NO3)

