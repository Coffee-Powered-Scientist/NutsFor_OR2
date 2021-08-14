
rm(list = ls())

library(dplyr)
library(reshape2)
library(ggplot2)
library(ggpattern)
library(ggpubr)
library(gridExtra)
library(grid)
library(cowplot)
library(extrafont)
loadfonts(device = "win")

setwd("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis")

Atm_1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Atm_Bio.csv")
Ex_1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Exch_Bio.csv")
Nit_1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Nit_Bio.csv")
SOMP_1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/SOMP_Bio.csv")
Min_1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Min_Bio.csv")
Growth_1<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Growth_Bio.csv")

Atm_2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Atm_Weath.csv")
Ex_2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Ex_Weath.csv")
Nit_2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Nit_Weath.csv")
SOMP_2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/SOMP_Weath.csv")
Min_2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Min_Weath.csv")
Growth_2<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Growth_Weath.csv")

Atm_3<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Atm_Leach.csv")
Ex_3<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Ex_Leach.csv")
Nit_3<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Nit_Leach.csv")
SOMP_3<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/SOMP_Leach.csv")
Min_3<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Min_Leach.csv")
Growth_3<-read.csv2("~/Project_Master/Test_Rep/Manuscript/Images/Sens_Analysis/Growth_Leach.csv")

Test<-rbind(Atm_1, Ex_1, Nit_1, SOMP_1, Min_1, Growth_1)

Test2<-rbind(Atm_2, Ex_2, Nit_2, SOMP_2, Min_2, Growth_2)

Test3<-rbind(Atm_3, Ex_3, Nit_3, SOMP_3, Min_3, Growth_3)

Test$Site<-factor(Test$Site, levels=c("LN SED", "HN SED", "LN BAS", "HN BAS"))
Test2$Site<-factor(Test$Site, levels=c("LN SED", "HN SED", "LN BAS", "HN BAS"))
Test3$Site<-factor(Test$Site, levels=c("LN SED", "HN SED", "LN BAS", "HN BAS"))

R1<-ggplot(Test, aes(x=Sens, y=value, fill=Inc))+geom_col(position = "dodge", width=.75)+
  theme_bw()+
  labs(x="Sensitivity Variable", y="Cumulative Biomass % Difference", fill="Threshold")+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"))+
  theme(legend.position = "right", plot.title = element_text(hjust = 0.5, size=14), text = element_text(family='Helvetica'))+
  geom_text(aes(label =value2, y=5), position = position_dodge(0.9), size=2.5, show.legend = FALSE)+
  facet_wrap(~Site)+
  ggtitle("Total Biomass Yield")

R2_K<-ggplot(subset(Test2, ID %in% "K"), aes(x = Sens, y = value, fill=Inc, width=.75)) +
  geom_col(position="dodge")+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"), labels=c("Lower"="Lower", "Upper"="Upper")) +
  scale_pattern_manual(values = c(Ca = "stripe", K = "none")) +
  labs(x = "Sensitivity Variable", y = "Total Weathering Supply (K) % Difference", pattern = "ID", fill="Threshold") + 
  guides(pattern = guide_legend(override.aes = list(fill = "white")),
         fill = guide_legend(override.aes = list(pattern = "none")))+ theme_bw()+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+ggtitle("K Weathering")+
  theme(plot.title = element_text(hjust = 0.5, size=14), text = element_text(family='Helvetica'))+
  geom_text(aes(label =value2, y=5), position = position_dodge(0.9), size=2.5, show.legend = FALSE)+
  facet_wrap(~Site)+
  scale_y_continuous(breaks=c(-45, -20, 0, 20, 45))+
  coord_cartesian(ylim = c(-45, 45))


R2_Ca<-ggplot(subset(Test2, ID %in% "Ca"), aes(x = Sens, y = value, fill=Inc, pattern = ID, width=.75)) +
  geom_col(position="dodge")+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"), labels=c("Lower"="Lower", "Upper"="Upper"))+ 
  labs(x = "Sensitivity Variable", y = "Total Weathering Supply (Ca) % Change", pattern = "ID", fill="Threshold") + 
  theme_bw()+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+ggtitle("Ca Weathering")+
  theme(plot.title = element_text(hjust = 0.5, size=14), text = element_text(family='Helvetica'))+
  geom_text(aes(label =value2, y=5), position = position_dodge(0.9), size=2.5, show.legend = FALSE)+
  facet_wrap(~Site)+
  scale_y_continuous(breaks=c(-45, -20, 0, 20, 45))+
  coord_cartesian(ylim = c(-45, 45))


R3_K<-ggplot(subset(Test3, Species %in% "K"), aes(x = Sens, y = value, fill=ID, pattern = Species, width=.75)) +
  geom_col(position="dodge")+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"), labels=c("Lower"="Lower", "Upper"="Upper"))+
  labs(x = "Sensitivity Variable", y = "Total Leached K % Change", pattern = "Species", fill="Threshold") + 
  theme_bw()+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+ggtitle("K Leaching")+
  theme(plot.title = element_text(hjust = 0.5, size=14), text = element_text(family='Helvetica'))+
  geom_text(aes(label =value2, y=5), position = position_dodge(0.9), size=2.5, show.legend = FALSE)+
  facet_wrap(~Site)+
  scale_y_continuous(breaks=c(-65, -35, 0, 35, 65))+
  coord_cartesian(ylim = c(-65, 65))


Test3$NR<-c("")

R3_Ca<-ggplot(subset(Test3, Species %in% "Ca"), aes(x = Sens, y = value, fill=ID, pattern = Species, width=.75)) +
  geom_col(position="dodge")+
  scale_fill_manual(values = c("Lower"= "gray30","Upper"= "orange3"), labels=c("Lower"="Lower", "Upper"="Upper"))+
  labs(x = "Sensitivity Variable", y = "Total Leached Ca % Change", pattern = "Species", fill="Threshold") + 
  theme_bw()+
  geom_hline(yintercept=0, linetype=1, color="black", size=.5)+ggtitle("Ca Leaching")+
  theme(plot.title = element_text(hjust = 0.5, size=14), text = element_text(family='Helvetica'))+
  geom_text(aes(label=value2, y=5), position = position_dodge(0.9), size=2.5, show.legend = FALSE)+
  facet_wrap(~Site)+
  scale_y_continuous(breaks=c(-65, -35, 0, 35, 65))+
  coord_cartesian(ylim = c(-65, 65))



png("R1.png", height=500, width=750, res=100)
plot(R1)
dev.off()

png("R2_K.png", height=500, width=750, res=100)
plot(R2_K)
dev.off()

png("R2_Ca.png", height=500, width=750, res=100)
plot(R2_Ca)
dev.off()

png("R3_K.png", height=500, width=750, res=100)
plot(R3_K)
dev.off()

png("R3_Ca.png", height=500, width=750, res=100)
plot(R3_Ca)
dev.off()