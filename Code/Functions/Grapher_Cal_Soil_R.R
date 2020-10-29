#Writes a graphing function for every species per Layer-group, can be used for leaching, soil solution, and weathering
library(ggplot2)


                                          ####Soil Solution Graphs####

#Deposit into Directories


#Calcium

Ca_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Ca~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Ca_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Ca~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#Magnesium


#Potassium


#Sodium


#Chloride

#Aluminum

#Si

#R-

#

#Make sure end of Site_Grapher clears global enviroment. 

