getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Class Exercise")

library(tidyverse)

# bomber_df <- readRDS("bomber_mess.rds")
# view(bomber_df)
# 
# bomber_df <- bomber_df %>% unite(MD, prefix, number, sep = "-") #combine prefix and number
# view(bomber_df)
# 
# bomber_df <- bomber_df %>% separate(Metric, c("FY", "x"), sep ="_") #separate metric
# view(bomber_df)
# 
# bomber_df <- bomber_df %>% spread(x, Value)
# view(bomber_df)

readRDS("bomber_mess.rds") %>% unite(MD, prefix, number, sep = "-") %>% separate(Metric, c("FY", "x"), sep ="_") %>% spread(x, Value)

