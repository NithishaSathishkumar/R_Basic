library(tidyverse)
install.packages("nycflights13")
library(nycflights13)
flights_df <- flights

#Filtering 
#Find number of flights 
filter(flights_df, arr_delay >= 120)
filter(flights_df, dest == "IAH" | dest == "HOU")
filter(flights_df, dest %in% c("IAH", "HOU"))
flights_df %>% 
  filter(arr_delay > 120 & dep_delay <= 0) %>%
  summarise(number_obs = n())

#Ordering your data (arrange the data largest or smallers)
#sort Flights to find those with largest departure delay
arrange(flights_df, desc(dep_delay))

#find flights that left earliest based on departure time
arrange(flights_df, dep_time)

#flight traveled the longest distance?
arrange(flights_df, desc(distance))

#Selecting Variables
#Select two variable carrier & flights
select(flights_df, carrier, flight)

#change order of the variable, first carrier, second flight, the everything else
select(flights_df, carrier, flight, everything())

#rename variable year as new 
rename(flights_df, NEW = year)

#Create new Variables
#create new variable distance_km that converts distance in miles to kilometers
flights_df <- mutate(flights_df,
       distance_km = distance * 1.609,
)

#create a time_per_km variable based on air_time and distance_km
mutate(flights_df,
       time_per_km = air_time / distance_km,
)

#keep only two newly created variable
transmute(flights_df,
          distance_km = distance * 1.60934,
          time_per_km = air_time / distance_km,
)

#Summarize your data
# find mean departure delay
summarise(flights_df, avg_delay = mean(dep_delay, na.rm = TRUE))

#which carrier had largest mean departure delay
flights_df %>%
  group_by(carrier) %>%
  summarise(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(avg_delay))

#Pipe operator
#filter out missing values that exist in the tail number variable
flights_df %>% filter(!is.na(tailnum)) %>% 
# group the data by tail number
  group_by(tailnum) %>%
#calculate the average arrival delay and number of observation by tail number
  summarise(avg_arrival_delay = mean(arr_delay, na.rm = TRUE), number_obs = n()) %>%
#arrange avg delay in desc
  arrange(desc(avg_arrival_delay))
