function (rateW, f, a, HR, p){
  #Reference: van Eijk RPA, Nikolakopoulos S, Roes KCB, et al. Critical design considerations for time-to-event endpoints in amyotrophic lateral sclerosis clinical trials (2019).
  #http://reactive.tricals.org/
  
  # Computes the average probability control + treatment [Weibull dist]
  #
  # Limitations:
  #   uniform accrual
  #   1:1 randomization [equal treatment arms]
  #   No drop-out distribution
  #
  # Args:
  #   rateW = hazard rate for Weibull distribution
  #           --> this can be caculated with the function WeiRate ()
  #   p = shape parameter Weibull [default for ALS is set to 2]
  #   HR = hazard ratio (placebo vs. treatment)
  #   f = minimal follow-up duration
  #   a = accrual period [can be set to 0]
  #   
  # Probability of event = 1-S(t)
  
  if (a == 0){
    # if a is 0, than the formula simplifies to the survival probability at time f:
    
    Sc <- WeiSurv (lambda = rateW, p = p, t = f)
    St <- WeiSurv (lambda = rateW*HR, p = p, t = f)
    1 - ((Sc + St)/2)
    
  } else {
    
    # i.e. "mean" survival probability over this time period [calculated area under curve]
    Sc <- integrate (WeiSurv, lower = f, upper = f+a, lambda = rateW, p = p)$value/a
    St <- integrate (WeiSurv, lower = f, upper = f+a, lambda = rateW*HR, p = p)$value/a
    1 - ((Sc + St)/2)
  }
  
}