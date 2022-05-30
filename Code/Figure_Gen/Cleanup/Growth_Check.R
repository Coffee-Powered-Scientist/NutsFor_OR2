
rm(list = ls())

library(ggplot2)
library(tidyverse)
library(lubridate)

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

CompLig<-ggplot(CompDf,mapping=aes(x=date, y=LN_LigBio, color = "LN"))+geom_line()+geom_line(CompDf, mapping=aes(y=HN_LigBio, color = "HN"))+
  labs(x="Year", y="Ligneous Biomass (kg/ha)", title = "HN-LN Sedimentary 1st Rotation Growth Rate Comparison")
  

CompFol<-ggplot(CompDf,mapping=aes(x=date, y=LN_FolBio, color = "LN"))+geom_line()+geom_line(CompDf, mapping=aes(y=HN_FolBio, color = "HN"))