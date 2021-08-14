

rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)
library(grid)
library(gridExtra)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/Base")

# 20 cm

LNS_20<-read.csv2("~/NutsForSEDLN/Base/Output data/Soil solution/Leaching Layer 2.csv")

LNS_20<-as.data.frame(sapply(LNS_20, as.numeric))

LNS_20<-na.omit(LNS_20)

LNS_20_R<- LNS_20 %>% subset(YEAR %in% c('2005', '2006')) %>%
  mutate(Site="LNS", Depth="20 cm") %>% select(-YEAR, -Month) 

LNS_20_R<-LNS_20_R %>% melt()

HNS_20<-read.csv2("~/NutsForSEDHN/Base/Output data/Soil solution/Leaching Layer 2.csv")

HNS_20<-as.data.frame(sapply(HNS_20, as.numeric))

HNS_20<-na.omit(HNS_20)

HNS_20_R<- HNS_20 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="HNS", Depth="20 cm") %>% select(-YEAR, -Month) 

HNS_20_R<-HNS_20_R %>% melt()

LNB_20<-read.csv2("~/NutsForBASLN/Base/Output data/Soil solution/Leaching Layer 2.csv")

LNB_20<-as.data.frame(sapply(LNB_20, as.numeric))

LNB_20<-na.omit(LNB_20)

LNB_20_R<- LNB_20 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="LNB", Depth="20 cm") %>% select(-YEAR, -Month) 

LNB_20_R<-LNB_20_R %>% melt()

HNB_20<-read.csv2("~/NutsForBASHN/Base/Output data/Soil solution/Leaching Layer 2.csv")

HNB_20<-as.data.frame(sapply(HNB_20, as.numeric))

HNB_20<-na.omit(HNB_20)

HNB_20_R<- HNB_20 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="HNB", Depth="20 cm") %>% select(-YEAR, -Month) 

HNB_20_R<-HNB_20_R %>% melt()

# 100 cm

LNS_100<-read.csv2("~/NutsForSEDLN/Base/Output data/Soil solution/Leaching Layer 8.csv")

LNS_100<-as.data.frame(sapply(LNS_100, as.numeric))

LNS_100<-na.omit(LNS_100)

LNS_100_R<- LNS_100 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="LNS", Depth="100 cm") %>% select(-YEAR, -Month) 

LNS_100_R<-LNS_100_R %>% melt()

HNS_100<-read.csv2("~/NutsForSEDHN/Base/Output data/Soil solution/Leaching Layer 8.csv")

HNS_100<-as.data.frame(sapply(HNS_100, as.numeric))

HNS_100<-na.omit(HNS_100)

HNS_100_R<- HNS_100 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="HNS", Depth="100 cm") %>% select(-YEAR, -Month) 

HNS_100_R<-HNS_100_R %>% melt()

LNB_100<-read.csv2("~/NutsForBASLN/Base/Output data/Soil solution/Leaching Layer 8.csv")

LNB_100<-as.data.frame(sapply(LNB_100, as.numeric))

LNB_100<-na.omit(LNB_100)

LNB_100_R<- LNB_100 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="LNB", Depth="100 cm") %>% select(-YEAR, -Month) 

LNB_100_R<-LNB_100_R %>% melt()

HNB_100<-read.csv2("~/NutsForBASHN/Base/Output data/Soil solution/Leaching Layer 8.csv")

HNB_100<-as.data.frame(sapply(HNB_100, as.numeric))

HNB_100<-na.omit(HNB_100)

HNB_100_R<- HNB_100 %>% subset(YEAR %in% c('2005') ) %>%
  mutate(Site="HNB", Depth="100 cm") %>% select(-YEAR, -Month) 

HNB_100_R<-HNB_100_R %>% melt()

Test<-rbind(LNS_20_R, LNS_100_R, HNS_20_R, HNS_100_R, LNB_20_R, LNB_100_R, HNB_20_R, HNB_100_R)

Test$Site<-factor(Test$Site, levels = c("LNS", "LNB", "HNS", "HNB"))





Ca_L1<-ggplot(subset(Test, variable %in% 'Ca' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=14.67), size=3)+
  geom_point(aes(x="LNS", y=8.37), size=3)+
  labs(y=expression("Ca"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))



Ca_L2<-ggplot(subset(Test, variable %in% 'Ca' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=9.67), size=3)+
  geom_point(aes(x="LNS", y=5.39), size=3)+
  labs(y=expression("Ca"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))



Mg_L1<-ggplot(subset(Test, variable %in% 'Mg' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=16.66), size=3)+
  geom_point(aes(x="LNS", y=6.44), size=3)+
  labs(y=expression("Mg"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))



Mg_L2<-ggplot(subset(Test, variable %in% 'Mg' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=11.42), size=3)+
  geom_point(aes(x="LNS", y=5), size=3)+
  labs(y=expression("Mg"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))


K_L1<-ggplot(subset(Test, variable %in% 'K' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=1.09), size=3)+
  geom_point(aes(x="LNS", y=4.09), size=3)+
  labs(y=expression("K"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))



K_L2<-ggplot(subset(Test, variable %in% 'K' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=1.1), size=3)+
  geom_point(aes(x="LNS", y=1.8), size=3)+
  labs(y=expression("K"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15, 20))+
  coord_cartesian(ylim = c(0, 20))


Na_L1<-ggplot(subset(Test, variable %in% 'Na' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=84.64), size=3)+
  geom_point(aes(x="LNS", y=31.83), size=3)+
  labs(y=expression("Na"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(15, 30, 45, 60, 75, 90))+
  coord_cartesian(ylim = c(0, 90))



Na_L2<-ggplot(subset(Test, variable %in% 'Na' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=70.18), size=3)+
  geom_point(aes(x="LNS", y=22.42), size=3)+
  labs(y=expression("Na"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(15, 30, 45, 60, 75, 90))+
  coord_cartesian(ylim = c(0, 90))


NH4_L1<-ggplot(subset(Test, variable %in% 'NH4' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=.24), size=3)+
  geom_point(aes(x="LNS", y=.22), size=3)+
  labs(y=expression(N~H[4]~"-N"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(.5, 1, 1.5, 2))+
  coord_cartesian(ylim = c(0, 2))



NH4_L2<-ggplot(subset(Test, variable %in% 'NH4' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=.2078), size=3)+
  geom_point(aes(x="LNS", y=.16), size=3)+
  labs(y=expression(N~H[4]~"-N"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(.5, 1, 1.5, 2))+
  coord_cartesian(ylim = c(0, 2))



SO4_L1<-ggplot(subset(Test, variable %in% 'SO4' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=7.14), size=3)+
  geom_point(aes(x="LNS", y=2.67), size=3)+
  labs(y=expression(S~O[4]~"-S"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15))+
  coord_cartesian(ylim = c(0, 15))



SO4_L2<-ggplot(subset(Test, variable %in% 'SO4' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=6.94), size=3)+
  geom_point(aes(x="LNS", y=3.99), size=3)+
  labs(y=expression(S~O[4]~"-S"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(5, 10, 15))+
  coord_cartesian(ylim = c(0, 15))



PO4_L1<-ggplot(subset(Test, variable %in% 'P' & Depth %in% '20 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=.02), size=3)+
  geom_point(aes(x="LNS", y=.042), size=3)+
  labs(y=expression(P~O[4]~"-P"~("kg⋅"~ha^{-1})))+
  ggtitle("20 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(.025, .05, .075, .1))+
  coord_cartesian(ylim = c(0, .1))



PO4_L2<-ggplot(subset(Test, variable %in% 'P' & Depth %in% '100 cm'), aes(x=Site, y=value, fill=Site))+
  geom_bar(stat="identity")+
  geom_point(aes(x="HNS", y=.03), size=3)+
  geom_point(aes(x="LNS", y=.018), size=3)+
  labs(y=expression(P~O[4]~"-P"~("kg⋅"~ha^{-1})))+
  ggtitle("100 cm")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_y_continuous(breaks=c(.025, .05, .075, .1))+
  coord_cartesian(ylim = c(0, .1))