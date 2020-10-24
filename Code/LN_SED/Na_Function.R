
#Turn Na's into 0's
na.zero <- function (x) {
  x[is.na(x)] <- 0
  return(x)
}



library(dplyr)

Soil_Soln$Date<-as.Date(Soil_Soln$Date)

na.zero(Soil_Soln)


#Take Average by year and by group_id (total yearly average)
Yearly_Average<-Soil_Soln %>%
  group_by(group_id) %>%
  summarise_at(vars(-Date), funs(mean(., na.rm=TRUE)))

#Take Average of only 2005-2006 (measured years)
#Subset by year

Soil_Soln_05_06<-subset(Soil_Soln, 