library(tidyverse)
library(lubridate)
library(glue)
library(stringr)

setwd("/Users/nithishasathishkumar/Desktop/R/pre_class")
crimes_df <- read.csv("cincinnati_crimes.csv")

# str_detect()
crimes_df %>% filter(str_detect(OFFENSE, "RAPE")) %>% summarise(rape_count = n())

# str_sub()
crimes_df <- crimes_df %>% mutate(LOCATION_NUM = str_sub(LOCATION, start = 1, end = 2))

#str_length()
crimes_df %>% mutate(GENDER_NUM = str_length(VICTIM_GENDER))
crimes_df %>% 
  select(INCIDENT_NO, SUSPECT_AGE) %>% 
  mutate(gen_x = SUSPECT_AGE %in% 
           c("UNDER 18", "18-25"))

# Count TRUEs by summing a logical vector
# Find proportion of TRUEs by taking the mean of a logical vector
crimes_df %>% 
  select(INCIDENT_NO, SUSPECT_AGE) %>% 
  mutate(gen_x = SUSPECT_AGE %in% 
           c("UNDER 18", "18-25")) %>%
  summarise(total_gen_x = sum(gen_x, na.rm = TRUE),
            pct_gen_x = mean(gen_x, na.rm = TRUE))

#String

# Matching Patterns with str_detect()
# str_detect() checks if elements of a character vector match a pattern, returning a logical vector
x <- c("apple", "pineapple", "crabapple", NA, "peach")
str_detect(x , "app") # TRUE TRUE TRUE NA FALSE

crimes_df %>%
  select(HATE_BIAS) %>%
  mutate(hate_toward_group = str_detect(HATE_BIAS, "ANTI-"))

# Regular Expression

# Extracting Characters with str_sub()
# Extract location code with defined start/end positions
text <- "Hello, R World"
result <- str_sub(text, 1, 3)
result

str_sub(text, 8, 8) <- "Beautiful" # Replace R to Beautiful
text # Output: "Hello, Beautiful World!"

crimes_df %>% transmute(LOCATION, location_code = str_sub(string = LOCATION, start = 1, end = 2))

# Extract last three digits by counting backward from the last character
crimes_df %>% transmute(ZIP, last_three = str_sub(ZIP, -3))
# ZIP last_three
# 45237 237
# 45206 206

# Data Cleaning with str_length() and str_pad()
# str_length() outputs the number of characters a string contains
text <- "Hello, R World!"
length_of_text <- str_length(text)
length_of_text  # Output: 15

crimes_df %>%
  transmute(ZIP = as.character(ZIP),
            num_digits_zip = str_length(ZIP))
# ZIP num_digits_zip
# <chr> <int>
# 45237 5
# 45206 5

x <- c("VEG SOUP", " MIXED VEG/VEG MEDLEY", "bAd NaMe 4 VeG ")

# str_to_lower() -- there is also str_to_upper() and str_to_title()
str_to_lower(x)
# "veg soup", " mixed veg/veg medley", "bad name 4 veg "  

# str_trim removes whitespace from the side(s) you specify
str_trim(x, side = "both") 
# "VEG SOUP" "MIXED VEG/VEG MEDLEY" "bAd NaMe 4 VeG"

# str_replace replaces the first matched pattern
str_replace(x, pattern = "VEG", replacement = "VEGETABLE")
# "VEGETABLE SOUP" " MIXED VEGETABLE/VEG MEDLEY" "bAd NaMe 4 VeG "

# str_replace_all replaces all matched patterns
str_replace_all(x, pattern = "VEG", replacement = "VEGETABLE")


# Factors
# Factors are used to represent categorical data

# Unique categories stored internally
eyes <- base::factor(x = c("blue", "green", "green"),
                     levels = c("blue", "brown", "green"))
eyes

# Create a factor for colors
colors <- factor(c("red", "blue", "green", "red", "blue"))
colors # Levels: blue green red


# Reorder Levels: Fct_relevel()
fruit <- factor(c("apple", "banana", "cherry", "apple"))

# This function reorders factor levels manually by specifying the desired order.
fruit <- fct_relevel(fruit, "cherry", "banana", "apple")
levels(fruit) # "cherry" "banana" "apple" 

# Rename levels: This function renames the existing factor levels
fruit <- fct_recode(fruit, 
                    "Golden Apple" = "apple",
                    "Sweet Banana" = "banana")
levels(fruit)

# Collapse levels into groups: This function combines multiple levels into a single level
fruit <- fct_collapse(fruit,
                      Citrus = c("cherry", "banana"),
                      AppleType = c("Golden Apple"))
levels(fruit)

