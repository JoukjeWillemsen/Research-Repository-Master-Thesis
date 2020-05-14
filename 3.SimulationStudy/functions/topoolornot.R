function (eqbounds, eqregion = c(0.7, 1/(0.7))){ #change eqregion
  if ((eqbounds[1] > eqregion[2]) | (eqbounds[2] < eqregion[1])){decision <- "not pool"}
  else if ((eqbounds[1] > eqregion[1]) & (eqbounds[2] < eqregion[2])){decision <- "pool"}
  else {decision<- "no decision"}
  return(decision)
}