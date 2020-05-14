function (dataset) #input: Hcontrol[[1]]
  
{
  
  datasetpooled <- list() #make a list called datasetpooled
  
  
  
  for (i in 1:1000){ #the minus 1 because the last 1 is the decision indicator
    
    datasetpooled[[i]] <- if (dataset$decision[i] == "pool") 
      
    {data.frame(
      
      survivaltimes = c(dataset[[i]]$survivalcensored, Dcontrol$STIME18), 
      
      status = c(dataset[[i]]$StatusIndicator, Dcontrol$STATUS18),
      
      pooled = "yes")}
    
    else {data.frame(
      
      survivaltimes = dataset[[i]]$survivalcensored, 
      
      status = dataset[[i]]$StatusIndicator,
      
      pooled = "no")}
    
  }
  
  return(datasetpooled)  
  
}