#Writes a graphing function for every species per Layer-group, can be used for leaching, soil solution, and weathering
library(ggplot2)
library(scales)


                                              ####SOM Graphs####

#Deposit into Directories using site-specific core function


#Carbon

C_SOM_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=C, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(SOM~C~(mol/m^2)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Soil Layers"))
}

C_SOM_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=C, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(SOM~C~(mol/m^2)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Soil Layers"))
}


#Nitrogen
N_SOM_L1<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 1", "Layer 2", "Layer 3")), (aes(x=Date, y=N, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(SOM~C~(mol/m^2)))+
    scale_color_manual(labels = c("Layer 1", "Layer 2", "Layer 3"), values = c("red", "green", "blue"))+
    guides(color=guide_legend("Soil Layers"))
}

N_SOM_L2<-function(x){
  ggplot(subset(x, group_id %in% c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8")), (aes(x=Date, y=N, group=group_id, color=group_id)))+
    geom_line()+scale_x_date(labels = date_format("%m-%Y"))+labs(y=expression(SOM~C~(mol/m^2)))+
    scale_color_manual(labels = c("Layer 4", "Layer 5", "Layer 6", "Layer 7", "Layer 8"), values = c("orange", "green", "blue", "purple", "red"))+
    guides(color=guide_legend("Soil Layers"))
}


