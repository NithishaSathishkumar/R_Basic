getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework1")

a <- 10
b <- 3.5
c <- 100

v1 <- a*(sqrt(c))
v2 <- v1 + ((b)^2)
v3 <- v2 / (c-b)
v3

library(tidyverse)
library(nycflights13)

flights_df <- flights
view(flights_df)

flights_df %>% filter(arr_delay > 120) %>% summarise(Number_of_flight = n())

flights_df %>% filter(origin == "JFK" | origin == "HOU") %>% summarise(Number_of_flight = n())
flights_df %>%
  filter(arr_delay > 120 & dep_delay <= 0) %>% summarise(number_of_observation = n())

flights_df %>% 
  filter(arr_delay > 120 & dep_delay <= 0) %>%
  summarise(number_obs = n())

flights_df %>% arrange(desc(dep_delay))
flights_df %>% arrange(dep_time)
flights_df %>% arrange(desc(distance))

flights_df %>% select(carrier, flight)
flights_df %>% select(carrier, flight, everything())
flights_df %>% rename(NEW = year)

flights_df %>% mutate(distance_km = distance * 1.60934)

flights_df %>% group_by(carrier) %>% summarise(avg = mean(dep_delay, na.rm = TRUE)) %>% arrange(desc(avg))

flights_df %>% 
  filter(!is.na(tailnum)) %>% 
  group_by(tailnum) %>% 
  summarise(avg = mean(arr_delay, na.rm = TRUE), number_of_observation = n()) %>%
  arrange(desc(avg))
