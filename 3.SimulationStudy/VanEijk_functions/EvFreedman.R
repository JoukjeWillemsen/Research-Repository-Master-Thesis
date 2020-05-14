function (HR, alpha, power){
  #Reference: van Eijk RPA, Nikolakopoulos S, Roes KCB, et al. Critical design considerations for time-to-event endpoints in amyotrophic lateral sclerosis clinical trials (2019).
  #http://reactive.tricals.org/
  
  # Computes the number of events according to Freedman 1982
  #
  # Args:
  #   HR = hazard ratio
  #   alpha = type 1 error
  #   power = 1 - type 2 error
  # Function:
  ( ((1 + HR)^2) / ((1 - HR)^2) ) * (qnorm (1 - (alpha/2)) + qnorm (power))^2
}