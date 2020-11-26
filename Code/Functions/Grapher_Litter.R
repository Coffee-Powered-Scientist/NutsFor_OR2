

##Litter Grapher Function

library(ggplot2)
library(scales)

##Add labels when inserting into reports
Litter_Graph<-function(x){
  ggplot(Litter_Pretable, aes(x=Date, y=x, group=1))+geom_line()
  
}