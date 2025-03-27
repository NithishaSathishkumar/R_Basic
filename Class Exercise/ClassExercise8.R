# Nithisha, Reeve, Erika, Nishita, Ethan, Ridwan
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Class Exercise")

library(tidyverse)

set <- read.csv("lego-sets.csv")
inventories <- read.csv("lego-inventories.csv")
inventory_parts <- read.csv("lego-inventory-parts.csv")
colors <- read.csv("lego-colors.csv")

set %>% 
  inner_join(inventories, by="set_num") %>%
  inner_join(inventory_parts, by= c("id" = "inventory_id")) %>%
  inner_join(colors, by=c("color_id"="id")) %>%
  rename(name_color = name.y) %>%
  filter(set_num == "7965-1") %>%
  group_by(name_color) %>%
  summarise(sum_inventory = sum(quantity)) %>%
  arrange(desc(sum_inventory)) %>%
  head(3)

#ANSWER: 
#     name_color          sum_inventory
#  Light Bluish Gray           587
#  Dark Bluish Gray            282
#  Black                       201