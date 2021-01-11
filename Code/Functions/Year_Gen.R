
##Date Script
setwd("~/")

n <-1

Years<-rep(2005:2722, each=n)

Years<-as.character(Years)

write.csv2(Years, "Years.csv", row.names = TRUE)
