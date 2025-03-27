library(tidyverse)

my_name <- function(first_name){
  paste(first_name, "Sathishkumar")
}

my_name("Nithisha") # Nithisha Sathishkumar

# Specifying multiple inputs
lunch_spending <- function(drinks, sandwiches, fries){
  Total_cost_of_Drink = drinks * 1
  Total_cost_of_Sandwich = sandwiches * 10
  Total_cost_of_Fries = fries * 3
  
  Total_amount_spend = Total_cost_of_Drink + Total_cost_of_Sandwich + Total_cost_of_Fries
  
  return(Total_amount_spend)
}

paste("The Total value spend $", lunch_spending(2, 1, 1))

#Personalizing a warning message
lunch_spending <- function(drinks, sandwiches, fries){
  Total_cost_of_Drink = drinks * 1
  Total_cost_of_Sandwich = sandwiches * 10
  Total_cost_of_Fries = fries * 3
  
  Total_amount_spend = Total_cost_of_Drink + Total_cost_of_Sandwich + Total_cost_of_Fries
  
  if(Total_amount_spend > 15){
    print("You have exceeded your buget")
  }
  
  return(Total_amount_spend)
}

lunch_spending(1, 2, 1)

#default values for arguments (set the default)
lunch_spending <- function(drinks = 0, sandwiches = 0, fries = 0){
  Total_cost_of_Drink = drinks * 1
  Total_cost_of_Sandwich = sandwiches * 10
  Total_cost_of_Fries = fries * 3
  
  Total_amount_spend = Total_cost_of_Drink + Total_cost_of_Sandwich + Total_cost_of_Fries
  
  if(Total_amount_spend > 15){
    print("You have exceeded your buget")
  }
  
  return(Total_amount_spend)
}
lunch_spending(1, 1, 2)
lunch_spending(1) # just drink

