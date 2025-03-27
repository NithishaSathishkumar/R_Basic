library(tidyverse)

# 1
my_function <- function(x, y){
  return(x - y)
}

#2
my_function2 <- function(x, y = 3){
  return(x - y)
}

my_function2(5) #ANSWER = 2

#3
my_function2 <- function(x, y = 3){
  if(!is.numeric(x) | !is.numeric(y)){
    stop("The Values you enters are not numeric")
  }
  return(x - y)
}

my_function2(1, 3)
