
rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)
library(grid)
library(gridExtra)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Base")

# 20 cm

LNS_20<-read.csv2("~/NutsForSEDLN/Base/Output data/Soil solution/Soil solution chemistry Layer 2.csv")

LNS_20<-as.data.frame(sapply(LNS_20, as.numeric))

LNS_20<-na.omit(LNS_20)

LNS_20_R<- LNS_20 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="LNS", Depth="20 cm") %>% select(-YEAR, -Month) 
  
LNS_20_R<-LNS_20_R %>% melt()

HNS_20<-read.csv2("~/NutsForSEDHN/Base/Output data/Soil solution/Soil solution chemistry Layer 2.csv")

HNS_20<-as.data.frame(sapply(HNS_20, as.numeric))

HNS_20<-na.omit(HNS_20)

HNS_20_R<- HNS_20 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="HNS", Depth="20 cm") %>% select(-YEAR, -Month) 

HNS_20_R<-HNS_20_R %>% melt()

LNB_20<-read.csv2("~/NutsForBASLN/Base/Output data/Soil solution/Soil solution chemistry Layer 2.csv")

LNB_20<-as.data.frame(sapply(LNB_20, as.numeric))

LNB_20<-na.omit(LNB_20)

LNB_20_R<- LNB_20 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="LNB", Depth="20 cm") %>% select(-YEAR, -Month) 

LNB_20_R<-LNB_20_R %>% melt()

HNB_20<-read.csv2("~/NutsForBASHN/Base/Output data/Soil solution/Soil solution chemistry Layer 2.csv")

HNB_20<-as.data.frame(sapply(HNB_20, as.numeric))

HNB_20<-na.omit(HNB_20)

HNB_20_R<- HNB_20 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="HNB", Depth="20 cm") %>% select(-YEAR, -Month) 

HNB_20_R<-HNB_20_R %>% melt()

# 100 cm

LNS_100<-read.csv2("~/NutsForSEDLN/Base/Output data/Soil solution/Soil solution chemistry Layer 8.csv")

LNS_100<-as.data.frame(sapply(LNS_100, as.numeric))

LNS_100<-na.omit(LNS_100)

LNS_100_R<- LNS_100 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="LNS", Depth="100 cm") %>% select(-YEAR, -Month) 

LNS_100_R<-LNS_100_R %>% melt()

HNS_100<-read.csv2("~/NutsForSEDHN/Base/Output data/Soil solution/Soil solution chemistry Layer 8.csv")

HNS_100<-as.data.frame(sapply(HNS_100, as.numeric))

HNS_100<-na.omit(HNS_100)

HNS_100_R<- HNS_100 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="HNS", Depth="100 cm") %>% select(-YEAR, -Month) 

HNS_100_R<-HNS_100_R %>% melt()

LNB_100<-read.csv2("~/NutsForBASLN/Base/Output data/Soil solution/Soil solution chemistry Layer 8.csv")

LNB_100<-as.data.frame(sapply(LNB_100, as.numeric))

LNB_100<-na.omit(LNB_100)

LNB_100_R<- LNB_100 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="LNB", Depth="100 cm") %>% select(-YEAR, -Month) 

LNB_100_R<-LNB_100_R %>% melt()

HNB_100<-read.csv2("~/NutsForBASHN/Base/Output data/Soil solution/Soil solution chemistry Layer 8.csv")

HNB_100<-as.data.frame(sapply(HNB_100, as.numeric))

HNB_100<-na.omit(HNB_100)

HNB_100_R<- HNB_100 %>% subset(YEAR %in% c('2005', '2006') & Month %in% c(1,2,3,4,5,11,12)) %>%
  mutate(Site="HNB", Depth="100 cm") %>% select(-YEAR, -Month) 

HNB_100_R<-HNB_100_R %>% melt()

Test<-rbind(LNS_20_R, LNS_100_R, HNS_20_R, HNS_100_R, LNB_20_R, LNB_100_R, HNB_20_R, HNB_100_R)

Test$Site<-factor(Test$Site, levels = c("LNS", "LNB", "HNS", "HNB"))

# Calcium 


Ca_L1<-ggplot(subset(Test, variable %in% 'Ca' & Depth %in% '20 cm'), aes(x=Site, y=value*40.078/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=21.83835586*40.078/1000), size=3)+
  geom_point(aes(x="LNS", y=12.8543333*40.078/1000), size=3)+
  labs(y=expression("Ca"~"(mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))
  

Ca_L2<-ggplot(subset(Test, variable %in% 'Ca' & Depth %in% '100 cm'), aes(x=Site, y=value*40.078/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=25.03179565*40.078/1000), size=3)+
  geom_point(aes(x="LNS", y=11.89729896*40.078/1000), size=3)+
  labs(y=expression("Ca"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# magnesium 

Mg_L1<-ggplot(subset(Test, variable %in% 'Mg' & Depth %in% '20 cm'), aes(x=Site, y=value*24.453/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=42.40629231*24.453/1000), size=3)+
  geom_point(aes(x="LNS", y=16.04178176*24.453/1000), size=3)+
  labs(y=expression("Mg"~" (mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


Mg_L2<-ggplot(subset(Test, variable %in% 'Mg' & Depth %in% '100 cm'), aes(x=Site, y=value*24.453/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=52.30661509*24.453/1000, size=2))+
  geom_point(aes(x="LNS", y=18.17134526*24.453/1000), size=3)+
  labs(y=expression("Mg"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# Potassium

K_L1<-ggplot(subset(Test, variable %in% 'K' & Depth %in% '20 cm'), aes(x=Site, y=value*39.0983/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=1.682020037*39.0983/1000), size=3)+
  geom_point(aes(x="LNS", y=6.13954833*39.0983/1000), size=3)+
  labs(y=expression("K"~" (mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


K_L2<-ggplot(subset(Test, variable %in% 'K' & Depth %in% '100 cm'), aes(x=Site, y=value*39.0983/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=2.278070711*39.0983/1000), size=3)+
  geom_point(aes(x="LNS", y=3.100115157*39.0983/1000), size=3)+
  labs(y=expression("K"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# Ammonium 

NH4_L1<-ggplot(subset(Test, variable %in% 'NH4' & Depth %in% '20 cm'), aes(x=Site, y=value*18*.778/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=0.945553739*18*.778/1000), size=3)+
  geom_point(aes(x="LNS", y=1.36167832*18*.778/1000), size=3)+
  labs(y=expression(NH[4]~"-N"~" (mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


NH4_L2<-ggplot(subset(Test, variable %in% 'NH4' & Depth %in% '100 cm'), aes(x=Site, y=value*18*.778/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=0.723724383*18*.778/1000), size=3)+
  geom_point(aes(x="LNS", y=0.24807627*18*.778/1000), size=3)+
  labs(y=expression(NH[4]~"-N"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


# Nitrate 

NO3_L1<-ggplot(subset(Test, variable %in% 'NO3' & Depth %in% '20 cm'), aes(x=Site, y=value*62*.23/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=26.39658753*62*.23/1000), size=3)+
  geom_point(aes(x="LNS", y=2.059239718*62*.23/1000), size=3)+
  labs(y=expression(NO[3]~"-N"~" (mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


NO3_L2<-ggplot(subset(Test, variable %in% 'NO3' & Depth %in% '100 cm'), aes(x=Site, y=value*62*.23/1000, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=15.69*62*.23/1000), size=3)+
  geom_point(aes(x="LNS", y=.248*62*.23/1000), size=3)+
  labs(y=expression(NO[3]~"-N"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# Sulfate

SO4_L1<-ggplot(subset(Test, variable %in% 'SO4' & Depth %in% '20 cm'), aes(x=Site, y=value*96.07/1000/3, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=20.92795523*96.07/1000/3), size=3)+
  geom_point(aes(x="LNS", y=8.816901175*96.07/1000/3), size=3)+
  labs(y=expression(SO[4]~"-S"~" (mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


SO4_L2<-ggplot(subset(Test, variable %in% 'SO4' & Depth %in% '100 cm'), aes(x=Site, y=value*96.07/1000/3, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=22.1612*96.07/1000/3), size=3)+
  geom_point(aes(x="LNS", y=14.98*96.07/1000/3), size=3)+
  labs(y=expression(SO[4]~"-S"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# Phosphate


PO4_L1<-ggplot(subset(Test, variable %in% 'P' & Depth %in% '20 cm'), aes(x=Site, y=value*94.97/1000/3, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=0.001153644), size=3)+
  geom_point(aes(x="LNS", y=0.002384842), size=3)+
  labs(y=expression(PO[4]~"-P"~" (mg·"~L^{-1}~")"))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))


PO4_L2<-ggplot(subset(Test, variable %in% 'P' & Depth %in% '100 cm'), aes(x=Site, y=value*94.97/1000/3, fill=Site))+
  geom_boxplot(outlier.shape = NA, fatten=NULL)+
  stat_summary(fun = mean, geom = "errorbar", aes(ymax = ..y.., ymin = ..y..),
               width = 0.75, size = 1, linetype = "solid")+
  geom_point(aes(x="HNS", y=0.001809631), size=3)+
  geom_point(aes(x="LNS", y=0.001053764), size=3)+
  labs(y=expression(PO[4]~"-P"~" (mg·"~L^{-1}~")"), title='100cm')+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

ggarrange(Ca_L1, Ca_L2, Mg_L1, Mg_L2, K_L1, K_L2, NH4_L1, NH4_L2,
          ncol = 2, nrow = 4, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="All_Cal_BC.png", height=1000, width=1000, res=100)


ggarrange(NO3_L1, NO3_L2, PO4_L1, PO4_L2, SO4_L1, SO4_L2, 
          ncol = 2, nrow = 3, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="All_Cal_AN.png", height=1000, width=1000, res=100)