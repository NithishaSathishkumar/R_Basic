library(tidyverse)
air_df <- airquality %>% mutate(season = NA)


# for loop
for(i in 1:nrow(air_df)){
  if(air_df[i, 5] %in% c(3, 4, 5)){
    result <- "Spring"
  } else if(air_df[i, 5] %in% c(6,7, 8)){
    result <- "Summer"
  }else if(air_df[i, 5] %in% c(9,10, 11)){
    result <- "Fall"
  }else{
    result <- "Winter"
  }
  air_df[i, 7] <- result
}

# case_when
#rm = (list = ls())
#air_df <- airquality
air_df <- air_df %>%
  mutate(
    season_duplicate = case_when(
    Month %in% c(3, 4, 5) ~ "Spring",
    Month %in% c(6,7, 8)  ~ "Summer",
    Month %in% c(9,10, 11)  ~ "Fall",
    .default = "Winter"
  ))
