# Nithisha Sathishkumar Class Exercise 7

# Find the carrier with the smallest average monthly departure delays. 
# What is the carrier and in which month they had
# the smallest average monthly departure delays?

library(tidyverse)
library(nycflights13)

flight_df <- flights
view(flight_df)

flights_df %>% 
  group_by(carrier, month) %>% 
  summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  arrange(avg_dep_delay) 

# What is the carrier and in which month they had the smallest average monthly departure delays?
# ANSWER: The carrier HA in month 9 which is September had the smallest avg monthly departure delays of -5.44