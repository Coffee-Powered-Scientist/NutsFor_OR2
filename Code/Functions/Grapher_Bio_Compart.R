
                                     ###Biomass Grapher###
#These functions can be applied to all biomass compartments, just make sure to do so wisely as to not graph the wrong thing
library(ggplot2)
library(scales)


Tree_kg_ha_<-function(x){
  ggplot(x, aes(x=Date))+geom_line(aes(y=Mg, color="Mg"))+ geom_line(aes(y=Ca, color="Ca"))+
    geom_line(aes(y=K, color="K"))+ geom_line(aes(y=P, color="P"))+
    scale_x_date(labels = date_format("%Y-%m-%d"))
  
}  


Tree_kg_ha_N<-function(x){
  ggplot(x, aes(x=Date, y=N, group=1))+geom_line()+ scale_x_date(labels = date_format("%Y-%m-%d"))
  
  
}

