
library(ggplot2)


Df<-read.csv2("~/Project_Master/Test_Rep/Output/Manuscript/LN_SED/40_BO/Edited Data/Bio_Cycle.csv")


Test_N<-ggplot(Df, aes(x=YEAR, y=N_MinSUM))+geom_line()+labs(x="Year", y="Mineralized N (kg/ha)", title="N")

Test_S<-ggplot(Df, aes(x=YEAR, y=S_MinSUM))+geom_line()+labs(x="Year", y="Mineralized S (kg/ha)", title="S")

Test_P<-ggplot(Df, aes(x=YEAR, y=P_MinSUM))+geom_line()+labs(x="Year", y="Mineralized P (kg/ha)", title="P")