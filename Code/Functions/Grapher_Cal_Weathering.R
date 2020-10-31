#Writes a graphing function for every species per Layer-group, can be used for leaching, soil solution, and weathering
library(ggplot2)
library(scales)


                                          ####Weathering Graphs####

#Deposit into Directories


#Calcium

Ca_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Ca~(kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Soil Layers"))
}

Ca_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=Ca, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Ca~(kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Soil Layers"))
}

#Magnesium

Mg_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Mg~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Mg_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=Mg, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Mg~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}


#Potassium

K_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=K, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~K~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

K_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=K, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~K~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#Sodium

Na_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=Na, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Na~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Na_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=Na, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Na~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}


#Aluminum

Al_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=Al, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Al~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Al_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=Al, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Al~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#Si

Si_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=Si, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Si~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

Si_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=Si, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~Si~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}

#Phosphorous
P_W_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=P, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~P~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Layers"))
}

P_W_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=P, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(Weathered~P~(Kg*mol/L)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Layers"))
}
