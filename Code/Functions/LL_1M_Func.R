


LL_1m<-function(x){
  ggplot(Leaching_Table_1m,  (aes(x=YEAR, y=x, group=1)))+
    geom_line()
}