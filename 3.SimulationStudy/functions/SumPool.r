function(list){
  
  
  
  sum <- vector(length = 8)
  
  
  
  for(i in 1:8){
    
    subset <- list[[i]]
    
    sum[i] <- sum(list[[i]]$decision == "pool")
    
  }
  
  #mean_sum <- mean(sum)  
  
  return(sum)
  
}