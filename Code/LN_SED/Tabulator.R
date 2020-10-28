#This Script Prepares Edited Data for direct report/manuscript calibration
rm(list = ls())

library(dpylr)

Cal_Pretable<-read.csv2("~/Project_Master/Test_Rep/Output_LN_SED/Edited Data/Soil_Solution_All2.csv", header=TRUE)

Cal_Pretable 

write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")