#This second code will "Weather_Depo_Comp" from the Edited Data section, then quickly graph it

#Clear global enviroment of objects so you can re-use names
rm(list = ls())

#Add package for cool graphs
library(ggplot2)

setwd("~/Project_Master/Test_Rep/Output_LN_SED/Comparison Graphs")

Weather_Depo_Comp<-read.csv2("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data/Weather_Depo_Comp.csv", header=TRUE)

Ca_Weather_Depo<-ggplot()+geom_line(Weather_Depo_Comp, mapping= aes(x=Date, y=Ca_Dep, fill=group))+
  geom_line(Weather_Depo_Comp, mapping= aes(x=Date, y=Ca_Weather, fill=group))+
  labs(x="Date", y="Ca (kg/ha/yr)")

pdf("Ca_Weather_Depo.pdf", height=5, width=10)
plot(Ca_Weather_Depo)
dev.off()

