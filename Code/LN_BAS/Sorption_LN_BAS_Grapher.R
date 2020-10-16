rm(list = ls())

library(ggplot2)

setwd("~/Project_Master/Test_Rep/Output_LN_BAS/Adsorption")

Adsorption_Data<-read.csv2("~/Project_Master/Test_Rep/Output_LN_BAS/Edited Data/Adsorption_Data.csv", header=TRUE)

#Find a way to add this data function as a seperate function code that is called by different codes, I will have to edit this at some point
Adsorption_Data$Date<-seq(as.Date("2005/1/1"), by = "month", length.out = 132)

CEC_Ca_L1.G<-ggplot(Adsorption_Data, aes(x=Date, y=CEC_Ca_L1, color="Ca L1"))+labs(y="Sorbed Ca (umol/kg)")+
  geom_point()
pdf("CEC_Ca_L1.G.pdf")
plot(CEC_Ca_L1.G)
dev.off()