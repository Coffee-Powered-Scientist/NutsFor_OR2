#Holds simple conversion functions in  one place, that can easily be checked for errors.

                       ###Leaf litter Concentration (umol/g) to total litter content (kg/ha) ###

LF_Lit_N<-function(x1, x2){
  
  x1*x2*14.0067*10*(1e-6)
  
}

LF_Lit_Ca<-function(x1, x2){
  
  x1*x2*40.078*10*(1e-6)
  
}

LF_Lit_Mg<-function(x1, x2){
  
  x1*x2*24.305*10*(1e-6)
  
}

LF_Lit_K<-function(x1, x2){
  
  x1*x2*39.0983*10*(1e-6)
  
}

LF_Lit_S<-function(x1, x2){
  
  x1*x2*32.065*10*(1e-6)
  
}

LF_Lit_P<-function(x1, x2){
  
  x1*x2*30.973762*10*(1e-6)
  
}

# Lysimeter Conversions 

