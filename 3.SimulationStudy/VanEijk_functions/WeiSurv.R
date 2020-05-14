function (lambda, t, p){
  #Reference: van Eijk RPA, Nikolakopoulos S, Roes KCB, et al. Critical design considerations for time-to-event endpoints in amyotrophic lateral sclerosis clinical trials (2019).
  #http://reactive.tricals.org/
  
  # Computes the probability of survival [Weibull distribution]
  #
  # Args:
  #   lambda = hazard rate or instantaneous death risk
  #   t = time
  #   p = shape parameter
  # Function:
  exp (-lambda*t^p)
}