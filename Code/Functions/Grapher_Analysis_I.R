  
  library(dplyr)
  library(ggplot2)
  
#Simple function that passes column-objects through eq. to plot points. 
  Analysis_I_Grapher<-function (x) {
    ggplot(Analysis_1, aes(x=Year, y=x, group=1))+geom_line()
  }
  

  