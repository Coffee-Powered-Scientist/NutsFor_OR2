
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
  group_by(group_id, Month) %>%
  summarise_all(list(mean))
