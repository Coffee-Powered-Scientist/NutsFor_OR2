rm(list = ls())
library(ggplot2)
library(multipanelfigure)
setwd("~/Project_Master/Test_Rep/Output_HN_BAS/Soil_Solution")

Soil_Solution_All<-read.csv2("~/Project_Master/Test_Rep/Output_HN_BAS/Edited Data/Soil_Solution_All.csv", header=TRUE)

#Pass Date through as.Date; some error in code which causes Date to output as character
Soil_Solution_All$Month<-as.Date(Soil_Solution_All$Date)

#Generate ggplots for every species in every layer, then use magrittr to stitch them together into one big graph

#Layer 1
SSL1Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L1, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL1Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L1, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL1K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L1))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL1Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L1))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL1NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L1))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL1NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L1))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL1SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L1))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL1Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L1))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL1P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L1))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL1DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L1))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL1pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L1))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL1Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L1))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL1Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L1))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 2

SSL2Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L2, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL2Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L2, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL2K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L2))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL2Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L2))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL2NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L2))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL2NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L2))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL2SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L2))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL2Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L2))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL2P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L2))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL2DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L2))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL2pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L2))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL2Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L2))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL2Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L2))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 3
SSL3Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L3, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL3Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L3, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL3K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L3))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL3Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L3))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL3NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L3))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL3NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L3))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL3SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L3))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL3Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L3))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL3P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L3))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL3DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L3))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL3pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L3))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL3Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L3))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL3Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L3))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 4
SSL4Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L4, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL4Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L4, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL4K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L4))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL4Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L4))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL4NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L4))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL4NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L4))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL4SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L4))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL4Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L4))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL4P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L4))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL4DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L4))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL4pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L4))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL4Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L4))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL4Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L4))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 5
SSL5Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L5, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL5Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L5, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL5K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L5))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL5Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L5))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL5NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L5))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL5NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L5))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL5SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L5))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL5Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L5))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL5P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L5))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL5DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L5))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL5pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L5))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL5Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L5))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL5Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L5))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))


#Layer 6
SSL6Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L6, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL6Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L6, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL6K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L6))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL6Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L6))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL6NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L6))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL6NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L6))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL6SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L6))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL6Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L6))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL6P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L6))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL6DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L6))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL6pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L6))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL6Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L6))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL6Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L6))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 7
SSL7Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L7, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL7Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L7, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL7K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L7))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL7Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L7))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL7NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L7))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL7NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L7))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL7SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L7))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL7Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L7))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL7P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L7))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL7DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L7))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL7pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L7))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL7Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L7))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL7Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L7))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

#Layer 8
SSL8Ca.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Ca_L8, group=1))+ geom_line()+labs(y="Soil Solution  Ca (umol/L)")+theme(text = element_text(size = 5))  

SSL8Mg.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Mg_L8, group=1))+ geom_line()+labs(y="Soil Solution  Mg (umol/L)")+theme(text = element_text(size = 5))

SSL8K.G<-ggplot(Soil_Solution_All, aes(x=Month, y=K_L8))+ geom_line()+labs(y="Soil Solution  K (umol/L)")+theme(text = element_text(size = 5))

SSL8Na.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Na_L8))+ geom_line()+labs(y="Soil Solution  Na (umol/L)")+theme(text = element_text(size = 5))

SSL8NO3.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NO3_L8))+ geom_line()+labs(y="Soil Solution  NO3 (umol/L)")+theme(text = element_text(size = 5))

SSL8NH4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=NH4_L8))+ geom_line()+labs(y="Soil Solution  NH4 (umol/L)")+theme(text = element_text(size = 5))

SSL8SO4.G<-ggplot(Soil_Solution_All, aes(x=Month, y=SO4_L8))+ geom_line()+labs(y="Soil Solution  SO4 (umol/L)")+theme(text = element_text(size = 5))

SSL8Cl.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Cl_L8))+ geom_line()+labs(y="Soil Solution  Cl (umol/L)")+theme(text = element_text(size = 5))

SSL8P.G<-ggplot(Soil_Solution_All, aes(x=Month, y=P_L8))+ geom_line()+labs(y="Soil Solution  PO4 (umol/L)")+theme(text = element_text(size = 5))

SSL8DOC.G<-ggplot(Soil_Solution_All, aes(x=Month, y=DOC_L8))+ geom_line()+labs(y="Soil Solution  DOC (umol/L)")+theme(text = element_text(size = 5))

SSL8pH.G<-ggplot(Soil_Solution_All, aes(x=Month, y=pH_L8))+ geom_line()+labs(y="Soil Solution  pH (umol/L)")+theme(text = element_text(size = 5))

SSL8Al.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Al_L8))+ geom_line()+labs(y="Soil Solution  Al (umol/L)")+theme(text = element_text(size = 5))

SSL8Si.G<-ggplot(Soil_Solution_All, aes(x=Month, y=Si_L8))+ geom_line()+labs(y="Soil Solution  Si (umol/L)")+theme(text = element_text(size = 5))

SSL1R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L1, group=1)))+geom_line()
SSL2R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L2, group=1)))+geom_line()
SSL3R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L3, group=1)))+geom_line()
SSL4R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L4, group=1)))+geom_line()
SSL5R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L5, group=1)))+geom_line()
SSL6R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L6, group=1)))+geom_line()
SSL7R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L7, group=1)))+geom_line()
SSL8R.G<-ggplot(Soil_Solution_All, (aes(x=Month, y=R_L8, group=1)))+geom_line()

Ca_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Ca_L1, color="Layer 1"))+
  geom_line(aes(y=Ca_L2, color="Layer 2"))+
  geom_line(aes(y=Ca_L3, color="Layer 3"))

Ca_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Ca_L4, color="Layer 4"))+
  geom_line(aes(y=Ca_L5, color="Layer 5"))+
  geom_line(aes(y=Ca_L6, color="Layer 6"))+
  geom_line(aes(y=Ca_L7, color="Layer 7"))+
  geom_line(aes(y=Ca_L8, color="Layer 8"))

Mg_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Mg_L1, color="Layer 1"))+
  geom_line(aes(y=Mg_L2, color="Layer 2"))+
  geom_line(aes(y=Mg_L3, color="Layer 3"))

Mg_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Mg_L4, color="Layer 4"))+
  geom_line(aes(y=Mg_L5, color="Layer 5"))+
  geom_line(aes(y=Mg_L6, color="Layer 6"))+
  geom_line(aes(y=Mg_L7, color="Layer 7"))+
  geom_line(aes(y=Mg_L8, color="Layer 8"))

K_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=K_L1, color="Layer 1"))+
  geom_line(aes(y=K_L2, color="Layer 2"))+
  geom_line(aes(y=K_L3, color="Layer 3"))

K_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=K_L4, color="Layer 4"))+
  geom_line(aes(y=K_L5, color="Layer 5"))+
  geom_line(aes(y=K_L6, color="Layer 6"))+
  geom_line(aes(y=K_L7, color="Layer 7"))+
  geom_line(aes(y=K_L8, color="Layer 8"))

Na_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Na_L1, color="Layer 1"))+
  geom_line(aes(y=Na_L2, color="Layer 2"))+
  geom_line(aes(y=Na_L3, color="Layer 3"))

Na_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Na_L4, color="Layer 4"))+
  geom_line(aes(y=Na_L5, color="Layer 5"))+
  geom_line(aes(y=Na_L6, color="Layer 6"))+
  geom_line(aes(y=Na_L7, color="Layer 7"))+
  geom_line(aes(y=Na_L8, color="Layer 8"))

NO3_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=NO3_L1, color="Layer 1"))+
  geom_line(aes(y=NO3_L2, color="Layer 2"))+
  geom_line(aes(y=NO3_L3, color="Layer 3"))

NO3_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=NO3_L4, color="Layer 4"))+
  geom_line(aes(y=NO3_L5, color="Layer 5"))+
  geom_line(aes(y=NO3_L6, color="Layer 6"))+
  geom_line(aes(y=NO3_L7, color="Layer 7"))+
  geom_line(aes(y=NO3_L8, color="Layer 8"))

NH4_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=NH4_L1, color="Layer 1"))+
  geom_line(aes(y=NH4_L2, color="Layer 2"))+
  geom_line(aes(y=NH4_L3, color="Layer 3"))

NH4_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=NH4_L4, color="Layer 4"))+
  geom_line(aes(y=NH4_L5, color="Layer 5"))+
  geom_line(aes(y=NH4_L6, color="Layer 6"))+
  geom_line(aes(y=NH4_L7, color="Layer 7"))+
  geom_line(aes(y=NH4_L8, color="Layer 8"))

SO4_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=SO4_L1, color="Layer 1"))+
  geom_line(aes(y=SO4_L2, color="Layer 2"))+
  geom_line(aes(y=SO4_L3, color="Layer 3"))

SO4_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=SO4_L4, color="Layer 4"))+
  geom_line(aes(y=SO4_L5, color="Layer 5"))+
  geom_line(aes(y=SO4_L6, color="Layer 6"))+
  geom_line(aes(y=SO4_L7, color="Layer 7"))+
  geom_line(aes(y=SO4_L8, color="Layer 8"))

Cl_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Cl_L1, color="Layer 1"))+
  geom_line(aes(y=Cl_L2, color="Layer 2"))+
  geom_line(aes(y=Cl_L3, color="Layer 3"))

Cl_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Cl_L4, color="Layer 4"))+
  geom_line(aes(y=Cl_L5, color="Layer 5"))+
  geom_line(aes(y=Cl_L6, color="Layer 6"))+
  geom_line(aes(y=Cl_L7, color="Layer 7"))+
  geom_line(aes(y=Cl_L8, color="Layer 8"))

P_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=P_L1, color="Layer 1"))+
  geom_line(aes(y=P_L2, color="Layer 2"))+
  geom_line(aes(y=P_L3, color="Layer 3"))

P_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=P_L4, color="Layer 4"))+
  geom_line(aes(y=P_L5, color="Layer 5"))+
  geom_line(aes(y=P_L6, color="Layer 6"))+
  geom_line(aes(y=P_L7, color="Layer 7"))+
  geom_line(aes(y=P_L8, color="Layer 8"))

DOC_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=DOC_L1, color="Layer 1"))+
  geom_line(aes(y=DOC_L2, color="Layer 2"))+
  geom_line(aes(y=DOC_L3, color="Layer 3"))

DOC_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=DOC_L4, color="Layer 4"))+
  geom_line(aes(y=DOC_L5, color="Layer 5"))+
  geom_line(aes(y=DOC_L6, color="Layer 6"))+
  geom_line(aes(y=DOC_L7, color="Layer 7"))+
  geom_line(aes(y=DOC_L8, color="Layer 8"))

pH_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=pH_L1, color="Layer 1"))+
  geom_line(aes(y=pH_L2, color="Layer 2"))+
  geom_line(aes(y=pH_L3, color="Layer 3"))

pH_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=pH_L4, color="Layer 4"))+
  geom_line(aes(y=pH_L5, color="Layer 5"))+
  geom_line(aes(y=pH_L6, color="Layer 6"))+
  geom_line(aes(y=pH_L7, color="Layer 7"))+
  geom_line(aes(y=pH_L8, color="Layer 8"))

Al_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Al_L1, color="Layer 1"))+
  geom_line(aes(y=Al_L2, color="Layer 2"))+
  geom_line(aes(y=Al_L3, color="Layer 3"))

Al_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Al_L4, color="Layer 4"))+
  geom_line(aes(y=Al_L5, color="Layer 5"))+
  geom_line(aes(y=Al_L6, color="Layer 6"))+
  geom_line(aes(y=Al_L7, color="Layer 7"))+
  geom_line(aes(y=Al_L8, color="Layer 8"))

Si_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Si_L1, color="Layer 1"))+
  geom_line(aes(y=Si_L2, color="Layer 2"))+
  geom_line(aes(y=Si_L3, color="Layer 3"))

Si_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=Si_L4, color="Layer 4"))+
  geom_line(aes(y=Si_L5, color="Layer 5"))+
  geom_line(aes(y=Si_L6, color="Layer 6"))+
  geom_line(aes(y=Si_L7, color="Layer 7"))+
  geom_line(aes(y=Si_L8, color="Layer 8"))

R_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=R_L1, color="Layer 1"))+
  geom_line(aes(y=R_L2, color="Layer 2"))+
  geom_line(aes(y=R_L3, color="Layer 3"))

R_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=R_L4, color="Layer 4"))+
  geom_line(aes(y=R_L5, color="Layer 5"))+
  geom_line(aes(y=R_L6, color="Layer 6"))+
  geom_line(aes(y=R_L7, color="Layer 7"))+
  geom_line(aes(y=R_L8, color="Layer 8"))

HR_SS_L1_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=HR_L1, color="Layer 1"))+
  geom_line(aes(y=HR_L2, color="Layer 2"))+
  geom_line(aes(y=HR_L3, color="Layer 3"))

HR_SS_L2_TOT<-ggplot(Soil_Solution_All, aes(x=Month))+geom_line(aes(y=HR_L4, color="Layer 4"))+
  geom_line(aes(y=HR_L5, color="Layer 5"))+
  geom_line(aes(y=HR_L6, color="Layer 6"))+
  geom_line(aes(y=HR_L7, color="Layer 7"))+
  geom_line(aes(y=HR_L8, color="Layer 8"))

#This part of the code is very slow; lots of objects being moved around. 

All_Cations_All_Layers_L1<- multi_panel_figure(columns = 3, rows = 2, panel_label_type = "none")
All_Cations_All_Layers_L1<-All_Cations_All_Layers_L1 %<>%
  fill_panel(Ca_SS_L1_TOT, column = 1, row = 1) %<>%
  fill_panel(Mg_SS_L1_TOT, column = 2, row = 1)%<>%
  fill_panel(K_SS_L1_TOT, column = 3, row = 1)%<>%
  fill_panel(Na_SS_L1_TOT, column = 1, row = 2)%<>%
  fill_panel(Al_SS_L1_TOT, column = 2, row = 2)%<>%
  fill_panel(NH4_SS_L1_TOT, column = 3, row = 2)
pdf("All_Cations_All_Layers_L1.pdf", height=10, width=20)
plot(All_Cations_All_Layers_L1)
dev.off()


All_Cations_All_Layers_L2<- multi_panel_figure(columns = 3, rows = 2, panel_label_type = "none")
All_Cations_All_Layers_L2<-All_Cations_All_Layers_L2 %<>%
  fill_panel(Ca_SS_L2_TOT, column = 1, row = 1) %<>%
  fill_panel(Mg_SS_L2_TOT, column = 2, row = 1)%<>%
  fill_panel(K_SS_L2_TOT, column = 3, row = 1)%<>%
  fill_panel(Na_SS_L2_TOT, column = 1, row = 2)%<>%
  fill_panel(Al_SS_L2_TOT, column = 2, row = 2)%<>%
  fill_panel(NH4_SS_L2_TOT, column = 3, row = 2)
pdf("All_Cations_All_Layers_L2.pdf", height=10, width=20)
plot(All_Cations_All_Layers_L2)
dev.off()


All_Cations_1<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none", row_spacing = 5)

All_Cations_1<-All_Cations_1 %<>%
  fill_panel(SSL1Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL1Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL1K.G, column = 3, row = 1)%<>%
  fill_panel(SSL1Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL1Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL1pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL1NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL1Cl.G, column=1, row=3)%<>%
  fill_panel(SSL1R.G, column=3, row=3)%<>%
  fill_panel(SSL1NO3.G, column=1, row=4)%<>%
  fill_panel(SSL1SO4.G, column=3, row=4)
pdf("All_Cations_1.pdf", height=10, width=20)
plot(All_Cations_1)
dev.off()

All_Cations_2<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_2<-All_Cations_2 %<>%
  fill_panel(SSL2Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL2Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL2K.G, column = 3, row = 1)%<>%
  fill_panel(SSL2Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL2Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL2pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL2NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL2Cl.G, column=1, row=3)%<>%
  fill_panel(SSL2R.G, column=3, row=3)%<>%
  fill_panel(SSL2NO3.G, column=1, row=4)%<>%
  fill_panel(SSL2SO4.G, column=3, row=4)
pdf("All_Cations_2.pdf", height=10, width=20)
plot(All_Cations_2)
dev.off()

All_Cations_3<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_3<-All_Cations_3 %<>%
  fill_panel(SSL3Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL3Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL3K.G, column = 3, row = 1)%<>%
  fill_panel(SSL3Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL3Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL3pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL3NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL3Cl.G, column=1, row=3)%<>%
  fill_panel(SSL3R.G, column=3, row=3)%<>%
  fill_panel(SSL3NO3.G, column=1, row=4)%<>%
  fill_panel(SSL3SO4.G, column=3, row=4)
pdf("All_Cations_3.pdf", height=10, width=20)
plot(All_Cations_3)
dev.off()

All_Cations_4<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_4<-All_Cations_4 %<>%
  fill_panel(SSL4Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL4Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL4K.G, column = 3, row = 1)%<>%
  fill_panel(SSL4Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL4Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL4pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL4NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL4Cl.G, column=1, row=3)%<>%
  fill_panel(SSL4R.G, column=3, row=3)%<>%
  fill_panel(SSL4NO3.G, column=1, row=4)%<>%
  fill_panel(SSL4SO4.G, column=3, row=4)
pdf("All_Cations_4.pdf", height=10, width=20)
plot(All_Cations_4)
dev.off()

All_Cations_5<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_5<-All_Cations_5 %<>%
  fill_panel(SSL5Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL5Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL5K.G, column = 3, row = 1)%<>%
  fill_panel(SSL5Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL5Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL5pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL5NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL5Cl.G, column=1, row=3)%<>%
  fill_panel(SSL5R.G, column=3, row=3)%<>%
  fill_panel(SSL5NO3.G, column=1, row=4)%<>%
  fill_panel(SSL5SO4.G, column=3, row=4)
pdf("All_Cations_5.pdf", height=10, width=20)
plot(All_Cations_5)
dev.off()

All_Cations_6<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_6<-All_Cations_6 %<>%
  fill_panel(SSL6Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL6Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL6K.G, column = 3, row = 1)%<>%
  fill_panel(SSL6Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL6Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL6pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL6NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL6Cl.G, column=1, row=3)%<>%
  fill_panel(SSL6R.G, column=3, row=3)%<>%
  fill_panel(SSL6NO3.G, column=1, row=4)%<>%
  fill_panel(SSL6SO4.G, column=3, row=4)
pdf("All_Cations_6.pdf", height=10, width=20)
plot(All_Cations_6)
dev.off()

All_Cations_7<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_7<-All_Cations_7 %<>%
  fill_panel(SSL7Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL7Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL7K.G, column = 3, row = 1)%<>%
  fill_panel(SSL7Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL7Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL7pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL7NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL7Cl.G, column=1, row=3)%<>%
  fill_panel(SSL7R.G, column=3, row=3)%<>%
  fill_panel(SSL7NO3.G, column=1, row=4)%<>%
  fill_panel(SSL7SO4.G, column=3, row=4)
pdf("All_Cations_7.pdf", height=10, width=20)
plot(All_Cations_7)
dev.off()

All_Cations_8<- multi_panel_figure(columns = 3, rows = 4, panel_label_type = "none")

All_Cations_8<-All_Cations_8 %<>%
  fill_panel(SSL8Ca.G, column = 1, row = 1) %<>%
  fill_panel(SSL8Mg.G, column = 2, row = 1)%<>%
  fill_panel(SSL8K.G, column = 3, row = 1)%<>%
  fill_panel(SSL8Na.G, column = 1, row = 2)%<>%
  fill_panel(SSL8Al.G, column = 2, row = 2)%<>%
  fill_panel(SSL8pH.G, column = 3, row = 2)%<>%
  fill_panel(SSL8NH4.G, column = 2, row = 3)%<>%
  fill_panel(SSL8Cl.G, column=1, row=3)%<>%
  fill_panel(SSL8R.G, column=3, row=3)%<>%
  fill_panel(SSL8NO3.G, column=1, row=4)%<>%
  fill_panel(SSL8SO4.G, column=3, row=4)
pdf("All_Cations_8.pdf", height=10, width=20)
plot(All_Cations_8)
dev.off()
