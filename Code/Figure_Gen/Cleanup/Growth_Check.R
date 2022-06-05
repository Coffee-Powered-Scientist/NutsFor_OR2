
rm(list = ls())

library(ggplot2)
library(tidyverse)
library(lubridate)


setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_BO")

LowN_tree<-read.csv2('~/NutsForSEDLN/40_BO/Output data/Biomass/Tree data.csv')
HighN_tree<-read.csv2('~/NutsForSEDHN/40_BO/Output data/Biomass/Tree data.csv')

LN<-LowN_tree[c(1:3, 55)]

LN$Year<-LN$X

HN<-HighN_tree[c(3, 55)]

HN$HN_FolBio<-HN$Foliage
HN$HN_LigBio<-HN$Total.ligneous

LN$LN_FolBio<-LN$Foliage
LN$LN_LigBio<-LN$Total.ligneous

Test<-cbind(LN, HN)

Test<-Test[-c(1),]
Test<-sapply(Test, as.numeric)

x<-2005:2067

Years = rep(x, each = 12)


CompDf<- subset(as.data.frame(Test), Year == Years)

CompDf<-CompDf %>%
  mutate(date = make_date(Year,X.1))

CompLig<-ggplot(CompDf,mapping=aes(x=date, y=LN_LigBio/1000, color = "LNS"))+geom_line()+geom_line(CompDf, mapping=aes(y=HN_LigBio/1000, color = "HNS"))+
  labs(x="Year", y="Ligneous Biomass (Mg/ha)")+theme_bw() + 
  theme(plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank() )+
  theme(panel.border= element_blank())+
  theme(axis.line.x = element_line(color="black", size = 1),
        axis.line.y = element_line(color="black", size = 1))+ 
  guides(color=guide_legend(title="Site"))
  

CompFol<-ggplot(CompDf,mapping=aes(x=date, y=LN_FolBio, color = "LNS"))+geom_line()+geom_line(CompDf, mapping=aes(y=HN_FolBio, color = "HNS"))+
  labs(x="Year", y="Foliar Biomass (kg/ha)")+theme_bw() + 
  theme(plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank() )+
  theme(panel.border= element_blank())+
  theme(axis.line.x = element_line(color="black", size = 1),
        axis.line.y = element_line(color="black", size = 1))+ 
  guides(color=guide_legend(title="Site"))


png('CompLig.png', height=480, width=650, res=125)
plot(CompLig)
dev.off()

png('CompFol.png', height=480, width=650, res=125)
plot(CompFol)
dev.off()