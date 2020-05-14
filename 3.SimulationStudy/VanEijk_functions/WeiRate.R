function (S, t, p){
  #Reference: van Eijk RPA, Nikolakopoulos S, Roes KCB, et al. Critical design considerations for time-to-event endpoints in amyotrophic lateral sclerosis clinical trials (2019).
  #http://reactive.tricals.org/
  
  # Computes lambda or death rate [Weibull distribution]
  #
  # Args:
  #   S = probability of survival at time t
  #   t = time
  #   p = shape parameter
  # Function:
  ( (- log (S)) / (t^p) )
}