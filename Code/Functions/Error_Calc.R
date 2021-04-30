
# These functions take the root mean squared error (RMSE) and Nash and Sutcliffe error estimate (NSE)

RMSE<-function(Oi, Pi, N){
  
  sqrt(sum((Oi-Pi)^2)/N)
}


NSE<-function(Oi, Pi, OAvg){
  
  1-(sum((Oi-Pi)^2)/sum((Oi-OAvg)^2))
}

SD_Con<-sd(Obs_Ca_Comp$Conc_S_3*24.95134488)

RMSE_Test<-RMSE(Obs_Ca_Comp$Conc_S_3*24.95134488, Cal_Tbl_S$Ca, 9)

NSE_True<-1-((RMSE_Test/SD_Con)^2)

Test_S<-NSE(Obs_Ca_Comp$Conc_S_3*24.95134488, Cal_Tbl_S$Ca, mean(Obs_Ca_Comp$Conc_S_3*24.95134488))