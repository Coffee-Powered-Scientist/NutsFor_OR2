rm(list = ls())
library(ggplot2)
library(reshape2)
library(stringr)
library(ggthemes)

setwd("~/Project_Master/Test_Rep/Output_LN_SED/Soil_Solution")

Soil_Solution_All<-read.csv2("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)


# create graphing function
Graph_Function <- function(Soil_Solution_All, na.rm = TRUE, ...){
  
  # create list of indexes in data to loop over 
  List_group <- unique(Soil_Solution_All$group_id)
  
  # create for loop to produce ggplot2 graphs 
  for (i in seq_along(List_group)) { 
    
    # create plot for each index number in df for Ca
    Ca_plot <- 
      ggplot(subset(Soil_Solution_All, Soil_Solution_All$group_id==List_group[i]),
             aes(x=Date, y=Ca, group = 1)) + 
              
      geom_line(size=1) +
      facet_wrap( ~  group_id, ncol=3) +
      scale_x_discrete(guide = guide_axis(check.overlap = TRUE))
  print(Ca_plot)
  }
}

# run graphing function on long df
Graph_Function(Soil_Solution_All)