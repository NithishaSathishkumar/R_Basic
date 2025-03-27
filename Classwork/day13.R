library(tidyverse)

# Create object pieces
pieces <- 7

# if/else statement
if(pieces < 5){
  print("Below Average")
} else if(pieces == 5){
  print("Average")
}else{
  print("Above Average")
}

# For Loop
pieces <- c(7, 5, 4, 6, 3, 5)

# Create a dumb vector with same length as pieces
blood_sugar <- vector(mode = "character", length = length(pieces))

#for loop (1: length(pieces))
# for(i in seq_along(pieces)){
#   if(pieces[i] < 5){
#     blood_sugar[i] = "Below Average"
#   } else if(pieces[i] == 5){
#     blood_sugar[i] = "Average"
#   }else{
#     blood_sugar[i] = "Above Average"
#   }
# }

for(i in 1:length(pieces)){
  if(pieces[i] < 5){
   result <- "Below Average"
  } else if(pieces[i] == 5){
    result <- "Average"
  }else{
    result <- "Above Average"
  }
  blood_sugar[i] <- result
}

blood_sugar

# Data frame
names <- c("Chris", "Marvel", "Casey", "Hok", "Senay", "Ronan")
candy <- data.frame(names, pieces)

rm <- (list = ls())
candy <- candy %>% mutate(blood_sugar = NA)
candy

for(i in 1:nrow(candy)){ # goes to every row 
  if(candy[i, 2] < 5){ # [row, column]
    result <- "Below Average"
  } else if(candy[i, 2] == 5){
    ca <- "Average"
  }else{
    result <- "Above Average"
  }
  candy[i, 3] <- result
}

candy

# Use case_when
rm <- (list = ls())
candy <- data.frame(names, pieces)

candy <- candy %>% 
  mutate(bloody_sugar = case_when(
  pieces < 5  ~ "Below Average",
  pieces == 5 ~ "Average",
  # pieces > 5 ~ "Above Average"
  .default = "Above Average"
  ))
candy
