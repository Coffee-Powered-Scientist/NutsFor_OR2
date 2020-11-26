


CEC_Grapher<-function(x){
  ggplot(CEC_All, aes(x=Date, y=x, group=group_id, color=group_id))+geom_line()
  
}


AEC_Grapher<-function(x){
  ggplot(AEC_All, aes(x=Date, y=x, group=group_id, color=group_id))+geom_line()
  
}

