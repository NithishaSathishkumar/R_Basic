library(tidyverse)
library(nycflights13)
flights_df <- flights
airlines_df <- airlines
airports_df <- airports

flights_df %>% 
  left_join(airlines_df, by="carrier") %>% 
  filter(name == "Virgin America") %>%
  group_by(time_hour) %>%
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(mean_dep_delay)) %>%
  head(10) # slice_max(avg_delay, n=10)

flights_df %>% 
  left_join(airports_df, by = c("origin" = "faa")) %>% 
  left_join(airports_df, by = c("dest" = "faa")) %>% 
  select(origin, origin_lat = lat.x, origin_lon = lon.x, dest, lat.y, lon.y)

flights_df %>% 
  semi_join(planes, by="tailnum") %>%
  summarise(matching_planesTailnum = n())

airports_df %>% 
  anti_join(flights, by=c("faa" = "dest")) %>%
  summarise(number_obs = n())
