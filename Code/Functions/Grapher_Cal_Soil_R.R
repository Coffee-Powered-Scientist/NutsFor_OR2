#Writes a graphing function for every species per Layer-group, can be used for leaching, soil solution, and weathering
library(ggplot2)
library(scales)


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

Mg_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Mg~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Mg_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Mg~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}


#Potassium

K_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=K, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~K~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

K_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=K, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~K~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#Sodium

Na_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Na, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Na~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Na_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Na, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Na~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}


#Chloride

Cl_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Cl, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Cl~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Cl_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Cl, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Cl~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}


#Aluminum

Al_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Al, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Al~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Al_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Al, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Al~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#Si

Si_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=Si, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Si~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Si_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=Si, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~Si~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#R-

R_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=R, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~R~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

R_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=R, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~R~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#pH

pH_SS_L1<-function(x){
  ggplot(subset(x, group_id %in% c("10", "11", "12")), (aes(x=Date, y=pH, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~pH~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

pH_SS_L2<-function(x){
  ggplot(subset(x, group_id %in% c("13", "14", "15", "16", "17")), (aes(x=Date, y=pH, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Soil~Solution~pH~(mu*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}



#Make sure to clear global enviroment before running report codes

