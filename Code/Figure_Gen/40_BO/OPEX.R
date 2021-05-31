
# Organic, Plant, CEC comparisons

rm(list = ls())

library(ggplot2)
library(dplyr)

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Aggregated/40_BO")

# Low N Break

Bio_Cycle_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Bio_Cycle.csv")

SOM_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/SOM.csv")

AEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/AEC_All.csv")

AEC_All_LNS$Year<-SOM_LNS$Year

AEC_All_LNS$Month<-SOM_LNS$Month

AEC_All_LNS<-AEC_All_LNS %>% group_by(Year, Month)%>% select(-Date) %>% summarize(across(SO4:Cl, ~sum(.x, na.rm = TRUE)))%>%
  filter(Month %in% 12)

SOM_LNS<-SOM_LNS %>%group_by(Year, Month)%>% select(-Date) %>% summarize(across(C:P, ~sum(.x, na.rm = TRUE))) %>%
  mutate(Date = make_date(Year, Month)) %>% filter(Month %in% 12)

Tree_Nut_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

Tree_Nut_LNS<-Tree_Nut_LNS %>% filter(Month %in% 12)

Tree_Nut_LNS$P_Brh<- as.numeric(Tree_Nut_LNS$P_Brh)







PP_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Plant_Pool.csv")


CEC_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/CEC_All.csv", header=TRUE)
Litter_All_LNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Litter_Pool.csv", header=TRUE)

Litter_All_LNS<-Litter_All_LNS %>% group_by(YEAR) %>% filter(Month %in% 12)

CEC_All_LNS$Date<-as.Date(CEC_All_LNS$Date)

CEC_All_LNS[, "year"] <- format(CEC_All_LNS[,"Date"], "%Y")
CEC_All_LNS[, "month"] <- format(CEC_All_LNS[,"Date"], "%m")

CEC_LNS<-CEC_All_LNS %>% group_by(year, month) %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Date=make_date(year, month))%>% 
  filter(month %in% "12")

CEC_LNS$YEAR<-sapply(CEC_LNS$year, as.numeric)

label_color_Ca<-c( expression(Ca[Ex]),expression(Ca[O]) , expression(Ca[P]))
label_color_Mg<-c( expression(Mg[Ex]),expression(Mg[O]) , expression(Mg[P]))
label_color_K<-c( expression(K[Ex]),expression(K[O]) , expression(K[P]))
label_color_N<-c( expression(N[O]), expression(N[P]))
label_color_S<-c( expression(S[A]),expression(S[O]) , expression(S[P]))
label_color_P<-c( expression(P[A]),expression(P[O]) , expression(P[P]))

Ca_LNS<-ggplot(Litter_All_LNS, aes(x=YEAR, y=Ca, color="Cao"))+geom_line()+
  geom_line(Tree_Nut_LNS, mapping= aes(y=Ca_F+Ca_Brk+Ca_Brh+Ca_Bol, color="CaP"))+
  geom_line(CEC_LNS, mapping =aes(y=CEC_LNS$Ca, color="CaEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Ca)+
  ggtitle("Low N Sedimentary" )+
  labs(y="Ca (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

Mg_LNS<-ggplot(Litter_All_LNS, aes(x=YEAR, y=Mg, color="Mgo"))+geom_line()+
  geom_line(Tree_Nut_LNS, mapping= aes(y=Mg_F+Mg_Brk+Mg_Brh+Mg_Bol, color="MgP"))+
  geom_line(CEC_LNS, mapping =aes(y=CEC_LNS$Mg, color="MgEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Mg)+
  ggtitle("Low N Sedimentary" )+
  labs(y="Mg (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

K_LNS<-ggplot(Litter_All_LNS, aes(x=YEAR, y=K, color="Ko"))+geom_line()+
  geom_line(Tree_Nut_LNS, mapping= aes(y=K_F+K_Brk+K_Brh+K_Bol, color="KP"))+
  geom_line(CEC_LNS, mapping =aes(y=CEC_LNS$K, color="KEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_K)+
  ggtitle("Low N Sedimentary" )+
  labs(y="K (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

N_LNS<-ggplot(Litter_All_LNS, aes(x=YEAR, y=N+SOM_LNS$N*14*10, color="No"))+geom_line()+
  geom_line(Tree_Nut_LNS, mapping= aes(y=N_F+N_Brk+N_Brh+N_Bol, color="NP"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_N)+
  ggtitle("Low N Sedimentary" )+
  labs(y="N (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

S_LNS<-ggplot(Litter_All_LNS, aes(x=YEAR, y=S+SOM_LNS$S*32*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_LNS, mapping= aes(y=S_F+S_Brk+S_Brh+S_Bol, color="SP"))+
  geom_line(AEC_All_LNS, mapping= aes(x=Year, y=SO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_S)+
  ggtitle("Low N Sedimentary" )+
  labs(y="S (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


P_LNS<-ggplot(Litter_All_LNS, aes(x=YEAR, y=P+SOM_LNS$P*30.97*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_LNS, mapping= aes(y=P_F+P_Brk+P_Brh+P_Bol, color="SP"))+
  geom_line(AEC_All_LNS, mapping= aes(x=Year, y=PO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_P)+
  ggtitle("Low N Sedimentary" )+
  labs(y="P (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


# High N Break

Bio_Cycle_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Bio_Cycle.csv")

SOM_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/SOM.csv")


AEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/AEC_All.csv")

AEC_All_HNS$Year<-SOM_HNS$Year

AEC_All_HNS$Month<-SOM_HNS$Month


AEC_All_HNS<-AEC_All_HNS %>% group_by(Year, Month)%>% select(-Date) %>% summarize(across(SO4:Cl, ~sum(.x, na.rm = TRUE)))%>%
  filter(Month %in% 12)


SOM_HNS<-SOM_HNS %>%group_by(Year, Month)%>% select(-Date) %>% summarize(across(C:P, ~sum(.x, na.rm = TRUE))) %>%
  mutate(Date = make_date(Year, Month)) %>% filter(Month %in% 12)

Tree_Nut_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Tree_Nut_All.csv")

Tree_Nut_HNS<-Tree_Nut_HNS %>% filter(Month %in% 12)

Tree_Nut_HNS$P_Brh<- as.numeric(Tree_Nut_HNS$P_Brh)


PP_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Plant_Pool.csv")


CEC_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/CEC_All.csv", header=TRUE)
Litter_All_HNS<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_SED/40_BO/Edited Data/Litter_Pool.csv", header=TRUE)

Litter_All_HNS<-Litter_All_HNS %>% group_by(YEAR) %>% filter(Month %in% 12)

CEC_All_HNS$Date<-as.Date(CEC_All_HNS$Date)

CEC_All_HNS[, "year"] <- format(CEC_All_HNS[,"Date"], "%Y")
CEC_All_HNS[, "month"] <- format(CEC_All_HNS[,"Date"], "%m")

CEC_HNS<-CEC_All_HNS %>% group_by(year, month) %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Date=make_date(year, month))%>% 
  filter(month %in% "12")

CEC_HNS$YEAR<-sapply(CEC_HNS$year, as.numeric)

label_color_Ca<-c( expression(Ca[Ex]),expression(Ca[O]) , expression(Ca[P]))
label_color_Mg<-c( expression(Mg[Ex]),expression(Mg[O]) , expression(Mg[P]))
label_color_K<-c( expression(K[Ex]),expression(K[O]) , expression(K[P]))

Ca_HNS<-ggplot(Litter_All_HNS, aes(x=YEAR, y=Ca, color="Cao"))+geom_line()+
  geom_line(Tree_Nut_HNS, mapping= aes(y=Ca_F+Ca_Brk+Ca_Brh+Ca_Bol, color="CaP"))+
  geom_line(CEC_HNS, mapping =aes(y=CEC_HNS$Ca, color="CaEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Ca)+
  ggtitle("High N Sedimentary" )+
  labs(y="Ca (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

Mg_HNS<-ggplot(Litter_All_HNS, aes(x=YEAR, y=Mg, color="Mgo"))+geom_line()+
  geom_line(Tree_Nut_HNS, mapping= aes(y=Mg_F+Mg_Brk+Mg_Brh+Mg_Bol, color="MgP"))+
  geom_line(CEC_HNS, mapping =aes(y=CEC_HNS$Mg, color="MgEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Mg)+
  ggtitle("High N Sedimentary" )+
  labs(y="Mg (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

K_HNS<-ggplot(Litter_All_HNS, aes(x=YEAR, y=K, color="Ko"))+geom_line()+
  geom_line(Tree_Nut_HNS, mapping= aes(y=K_F+K_Brk+K_Brh+K_Bol, color="KP"))+
  geom_line(CEC_HNS, mapping =aes(y=CEC_HNS$K, color="KEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_K)+
  ggtitle("High N Sedimentary" )+
  labs(y="K (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))



N_HNS<-ggplot(Litter_All_HNS, aes(x=YEAR, y=N+SOM_HNS$N*14*10, color="No"))+geom_line()+
  geom_line(Tree_Nut_HNS, mapping= aes(y=N_F+N_Brk+N_Brh+N_Bol, color="NP"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_N)+
  ggtitle("Low N Sedimentary" )+
  labs(y="N (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

S_HNS<-ggplot(Litter_All_HNS, aes(x=YEAR, y=S+SOM_HNS$S*32*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_HNS, mapping= aes(y=S_F+S_Brk+S_Brh+S_Bol, color="SP"))+
  geom_line(AEC_All_HNS, mapping= aes(x=Year, y=SO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_S)+
  ggtitle("High N Sedimentary" )+
  labs(y="S (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


P_HNS<-ggplot(Litter_All_HNS, aes(x=YEAR, y=P+SOM_HNS$P*30.97*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_HNS, mapping= aes(y=P_F+P_Brk+P_Brh+P_Bol, color="SP"))+
  geom_line(AEC_All_HNS, mapping= aes(x=Year, y=PO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_P)+
  ggtitle("High N Sedimentary" )+
  labs(y="P (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


# Low N bas break
Bio_Cycle_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Bio_Cycle.csv")

SOM_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/SOM.csv")


AEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/AEC_All.csv")

AEC_All_LNB$Year<-SOM_LNB$Year

AEC_All_LNB$Month<-SOM_LNB$Month


AEC_All_LNB<-AEC_All_LNB %>% group_by(Year, Month)%>% select(-Date) %>% summarize(across(SO4:Cl, ~sum(.x, na.rm = TRUE)))%>%
  filter(Month %in% 12)


SOM_LNB<-SOM_LNB %>%group_by(Year, Month)%>% select(-Date) %>% summarize(across(C:P, ~sum(.x, na.rm = TRUE))) %>%
  mutate(Date = make_date(Year, Month)) %>% filter(Month %in% 12)

Tree_Nut_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

Tree_Nut_LNB<-Tree_Nut_LNB %>% filter(Month %in% 12)

Tree_Nut_LNB$P_Brh<- as.numeric(Tree_Nut_LNB$P_Brh)

PP_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Plant_Pool.csv")


CEC_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/CEC_All.csv", header=TRUE)
Litter_All_LNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_BAS/40_BO/Edited Data/Litter_Pool.csv", header=TRUE)

Litter_All_LNB<-Litter_All_LNB %>% group_by(YEAR) %>% filter(Month %in% 12)

CEC_All_LNB$Date<-as.Date(CEC_All_LNB$Date)

CEC_All_LNB[, "year"] <- format(CEC_All_LNB[,"Date"], "%Y")
CEC_All_LNB[, "month"] <- format(CEC_All_LNB[,"Date"], "%m")

CEC_LNB<-CEC_All_LNB %>% group_by(year, month) %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Date=make_date(year, month))%>% 
  filter(month %in% "12")

CEC_LNB$YEAR<-sapply(CEC_LNB$year, as.numeric)

label_color_Ca<-c( expression(Ca[Ex]),expression(Ca[O]) , expression(Ca[P]))
label_color_Mg<-c( expression(Mg[Ex]),expression(Mg[O]) , expression(Mg[P]))
label_color_K<-c( expression(K[Ex]),expression(K[O]) , expression(K[P]))

Ca_LNB<-ggplot(Litter_All_LNB, aes(x=YEAR, y=Ca, color="Cao"))+geom_line()+
  geom_line(Tree_Nut_LNB, mapping= aes(y=Ca_F+Ca_Brk+Ca_Brh+Ca_Bol, color="CaP"))+
  geom_line(CEC_LNB, mapping =aes(y=CEC_LNB$Ca, color="CaEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Ca)+
  ggtitle("Low N Basalt")+
  labs(y="Ca (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

Mg_LNB<-ggplot(Litter_All_LNB, aes(x=YEAR, y=Mg, color="Mgo"))+geom_line()+
  geom_line(Tree_Nut_LNB, mapping= aes(y=Mg_F+Mg_Brk+Mg_Brh+Mg_Bol, color="MgP"))+
  geom_line(CEC_LNB, mapping =aes(y=CEC_LNB$Mg, color="MgEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Mg)+
  ggtitle("Low N Basalt" )+
  labs(y="Mg (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

K_LNB<-ggplot(Litter_All_LNB, aes(x=YEAR, y=K, color="Ko"))+geom_line()+
  geom_line(Tree_Nut_LNB, mapping= aes(y=K_F+K_Brk+K_Brh+K_Bol, color="KP"))+
  geom_line(CEC_LNB, mapping =aes(y=CEC_LNB$K, color="KEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_K)+
  ggtitle("Low N Basalt" )+
  labs(y="K (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


N_LNB<-ggplot(Litter_All_LNB, aes(x=YEAR, y=N+SOM_LNB$N*14*10, color="No"))+geom_line()+
  geom_line(Tree_Nut_LNB, mapping= aes(y=N_F+N_Brk+N_Brh+N_Bol, color="NP"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_N)+
  ggtitle("Low N Basalt" )+
  labs(y="N (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

S_LNB<-ggplot(Litter_All_LNB, aes(x=YEAR, y=S+SOM_LNB$S*32*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_LNB, mapping= aes(y=S_F+S_Brk+S_Brh+S_Bol, color="SP"))+
  geom_line(AEC_All_LNB, mapping= aes(x=Year, y=SO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_S)+
  ggtitle("Low N Basalt" )+
  labs(y="S (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


P_LNB<-ggplot(Litter_All_LNB, aes(x=YEAR, y=P+SOM_LNB$P*30.97*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_LNB, mapping= aes(y=P_F+P_Brk+P_Brh+P_Bol, color="SP"))+
  geom_line(AEC_All_LNB, mapping= aes(x=Year, y=PO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_P)+
  ggtitle("Low N Basalt" )+
  labs(y="P (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

# High N bas break

Bio_Cycle_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Bio_Cycle.csv")

SOM_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/SOM.csv")


AEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/AEC_All.csv")

AEC_All_HNB$Year<-SOM_HNB$Year

AEC_All_HNB$Month<-SOM_HNB$Month


AEC_All_HNB<-AEC_All_HNB %>% group_by(Year, Month)%>% select(-Date) %>% summarize(across(SO4:Cl, ~sum(.x, na.rm = TRUE)))%>%
  filter(Month %in% 12)


SOM_HNB<-SOM_HNB %>%group_by(Year, Month)%>% select(-Date) %>% summarize(across(C:P, ~sum(.x, na.rm = TRUE))) %>%
  mutate(Date = make_date(Year, Month)) %>% filter(Month %in% 12)

Tree_Nut_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Tree_Nut_All.csv")

Tree_Nut_HNB<-Tree_Nut_HNB %>% filter(Month %in% 12)

Tree_Nut_HNB$P_Brh<- as.numeric(Tree_Nut_HNB$P_Brh)


PP_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Plant_Pool.csv")


CEC_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/CEC_All.csv", header=TRUE)
Litter_All_HNB<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/HN_BAS/40_BO/Edited Data/Litter_Pool.csv", header=TRUE)

Litter_All_HNB<-Litter_All_HNB %>% group_by(YEAR) %>% filter(Month %in% 12)

CEC_All_HNB$Date<-as.Date(CEC_All_HNB$Date)

CEC_All_HNB[, "year"] <- format(CEC_All_HNB[,"Date"], "%Y")
CEC_All_HNB[, "month"] <- format(CEC_All_HNB[,"Date"], "%m")

CEC_HNB<-CEC_All_HNB %>% group_by(year, month) %>% summarise(across(Ca:Al, ~sum(.x, na.rm=TRUE))) %>% 
  mutate(Date=make_date(year, month))%>% 
  filter(month %in% "12")

CEC_HNB$YEAR<-sapply(CEC_HNB$year, as.numeric)

label_color_Ca<-c( expression(Ca[Ex]),expression(Ca[O]) , expression(Ca[P]))
label_color_Mg<-c( expression(Mg[Ex]),expression(Mg[O]) , expression(Mg[P]))
label_color_K<-c( expression(K[Ex]),expression(K[O]) , expression(K[P]))

Ca_HNB<-ggplot(Litter_All_HNB, aes(x=YEAR, y=Ca, color="Cao"))+geom_line()+
  geom_line(Tree_Nut_HNB, mapping= aes(y=Ca_F+Ca_Brk+Ca_Brh+Ca_Bol, color="CaP"))+
  geom_line(CEC_HNB, mapping =aes(y=CEC_HNB$Ca, color="CaEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Ca)+
  ggtitle("High N Basalt")+
  labs(y="Ca (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

Mg_HNB<-ggplot(Litter_All_HNB, aes(x=YEAR, y=Mg, color="Mgo"))+geom_line()+
  geom_line(Tree_Nut_HNB, mapping= aes(y=Mg_F+Mg_Brk+Mg_Brh+Mg_Bol, color="MgP"))+
  geom_line(CEC_HNB, mapping =aes(y=CEC_HNB$Mg, color="MgEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_Mg)+
  ggtitle("High N Basalt" )+
  labs(y="Mg (kg/ha)", x="Year")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

K_HNB<-ggplot(Litter_All_HNB, aes(x=YEAR, y=K, color="Ko"))+geom_line()+
  geom_line(Tree_Nut_HNB, mapping= aes(y=K_F+K_Brk+K_Brh+K_Bol, color="KP"))+
  geom_line(CEC_HNB, mapping =aes(y=CEC_HNB$K, color="KEx"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_K)+
  ggtitle("High N Basalt" )+
  labs(y="K (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


N_HNB<-ggplot(Litter_All_HNB, aes(x=YEAR, y=N+SOM_HNB$N*14*10, color="No"))+geom_line()+
  geom_line(Tree_Nut_HNB, mapping= aes(y=N_F+N_Brk+N_Brh+N_Bol, color="NP"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_N)+
  ggtitle("High N Basalt" )+
  labs(y="N (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))

S_HNB<-ggplot(Litter_All_HNB, aes(x=YEAR, y=S+SOM_HNB$S*32*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_HNB, mapping= aes(y=S_F+S_Brk+S_Brh+S_Bol, color="SP"))+
  geom_line(AEC_All_HNB, mapping= aes(x=Year, y=SO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_S)+
  ggtitle("High N Basalt" )+
  labs(y="S (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


P_HNB<-ggplot(Litter_All_HNB, aes(x=YEAR, y=P+SOM_HNB$P*30.97*10, color="So"))+geom_line()+
  geom_line(Tree_Nut_HNB, mapping= aes(y=P_F+P_Brk+P_Brh+P_Bol, color="SP"))+
  geom_line(AEC_All_HNB, mapping= aes(x=Year, y=PO4, color="Sads"))+
  scale_color_manual(values=c("red", "green", "magenta"),label = label_color_P)+
  ggtitle("High N Basalt" )+
  labs(y="P (kg/ha)", x="Year", color="Pool")+
  theme_classic2()+
  theme(plot.title = element_text(hjust = 0.5))


ggarrange(Ca_LNS, Ca_HNS, Ca_LNB, Ca_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="Ca_OPEX.png", height=1000, width=1000, res=100)

ggarrange(Mg_LNS, Mg_HNS, Mg_LNB, Mg_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="Mg_OPEX.png", height=1000, width=1000, res=100)

ggarrange(K_LNS, K_HNS, K_LNB, K_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="K_OPEX.png", height=1000, width=1000, res=100)

ggarrange(N_LNS, N_HNS, N_LNB, N_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="N_OPEX.png", height=1000, width=1000, res=100)

ggarrange(S_LNS, S_HNS, S_LNB, S_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="S_OPEX.png", height=1000, width=1000, res=100)

ggarrange(P_LNS, P_HNS, P_LNB, P_HNB, labels=c("A", "B", "C", "D"),
          ncol = 2, nrow = 2, common.legend = TRUE, legend="right", heights =1, widths = 1)%>%
  ggexport(filename="P_OPEX.png", height=1000, width=1000, res=100)
