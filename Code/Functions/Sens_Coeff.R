

# Sens Coefficient

Sens_Coeff<-function(Rp, Rb, Pp, Pb){
  
  abs(((Rp-Rb)/Rb)/((Pp-Pb)/Pb))
  
}