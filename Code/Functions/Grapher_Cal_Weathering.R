#Writes a graphing function for every species per Layer-group, can be used for leaching, soil solution, and weathering
library(ggplot2)
library(scales)


                                          ####Weathering Graphs####

#Deposit into Directories


#Calcium

Ca_W_L1<-function(x){
  ggplot(x, aes(x=YEAR, y=Ca, group=1))+
    geom_line()+labs(y=expression(Weathered~Ca~(kg/ha)))
}

Ca_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Ca, group=1)))+
    geom_line()+labs(y=expression(Weathered~Ca~(kg/ha)))
    
}

#Magnesium

Mg_W_L1<-function(x){
  ggplot(x, (aes(x=YEAR, y=Mg, group=1)))+
    geom_line()+labs(y=expression(Weathered~Mg~(kg/ha)))
    
}

Mg_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Mg, group=1)))+
    geom_line()+labs(y=expression(Weathered~Mg~(ka/ha)))
    
}


#Potassium

K_W_L1<-function(x){
  ggplot(x,  (aes(x=YEAR, y=K, group=1)))+
    geom_line()+labs(y=expression(Weathered~K~(kg/ha)))
    
}

K_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=K, group=1)))+
    geom_line()+labs(y=expression(Weathered~K~(kg/ha)))
    
}

#Sodium

Na_W_L1<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Na, group=1)))+
    geom_line()+labs(y=expression(Weathered~Na~(kg/ha)))
}

Na_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Na, group=1)))+
    geom_line()+labs(y=expression(Weathered~Na~(kg/ha)))
}


#Aluminum

Al_W_L1<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Al, group=1)))+
    geom_line()+labs(y=expression(Weathered~Al~(kg/ha)))
    
    
}

Al_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Al, group=1)))+
    geom_line()+labs(y=expression(Weathered~Al~(kg/ha)))
    
    
}

#Si

Si_W_L1<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Si, group=1)))+
    geom_line()+labs(y=expression(Weathered~Si~(kg/ha)))
    
    
}

Si_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=Si, group=1)))+
    geom_line()+labs(y=expression(Weathered~Si~(kg/ha)))
    
    
}

#Phosphorous
P_W_L1<-function(x){
  ggplot(x,  (aes(x=YEAR, y=P, group=1)))+
    geom_line()+labs(y=expression(Weathered~P~(kg/ha)))
    
    
}

P_W_L2<-function(x){
  ggplot(x,  (aes(x=YEAR, y=P, group=1)))+
    geom_line()+labs(y=expression(Weathered~P~(kg/ha)))
    
    
}
