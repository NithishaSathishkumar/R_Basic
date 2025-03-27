#===============================================================================
# Homework 4 -------------------------------------------------------------------
#===============================================================================

# Nithisha Sathishkumar
# March 3 2025
# Material Covered: Joining Data & Special Data

#===============================================================================
# JOINING DATA  ----------------------------------------------------------------
#===============================================================================
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework4")

#-------------------------------------------------------------------------------
# Question 1. Load the tidyverse package and the lubridate package in your library
#-------------------------------------------------------------------------------
library(tidyverse)
library(lubridate)

#-------------------------------------------------------------------------------
# Question 2. import the book_info.csv and create a data frame called book. 
# Import the amazon_info.csv and create a data frame called amazon
#-------------------------------------------------------------------------------
book <- read.csv("book_info.csv")
amazon <- read.csv("amazon_info.csv")

#-------------------------------------------------------------------------------
# Question 3. Use the pipe operator to inner_join & save in data frame
#-------------------------------------------------------------------------------
kindle_df <- book %>% inner_join(amazon, by = c("product_id" = "asin"))

#===============================================================================
# SPECIAL DATA -----------------------------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 4.  Replace the following pattern “Science Fiction” in the category_name variable
#-------------------------------------------------------------------------------
table(kindle_df$category_name)
kindle_df <- kindle_df %>% mutate(category_name = str_replace(category_name, pattern = "Science Fiction", replacement = "Sci-Fi"))
table(kindle_df$category_name)

#-------------------------------------------------------------------------------
# Question 5. how many books have "Mystery" and properties?
#-------------------------------------------------------------------------------
mystery_summary <- kindle_df %>% summarise(mystery_count = sum(str_detect(category_name, "Mystery")),
                                           total_books = n(),
                                           mystery_proportion = mystery_count / total_books
                                           )
mystery_summary

#ANSWER: 
# mystery_count  total_books  mystery_proportion
#         1425       77800           0.0183162

#-------------------------------------------------------------------------------
# Question 6. Find top 4 title and the number of stars
#-------------------------------------------------------------------------------
Money <- kindle_df %>% 
  filter(str_detect(category_name, "Money"), is_editors_pick == TRUE) %>%
  arrange(desc(stars)) %>%
  select(title, stars) %>%
  head(4)

Money
# ANSWER: 
# title
# The Infinite Game
# Principles: Life and Work
# The Power Law: Venture Capital and the Making of the New Future
# Leadership Is Language: The Hidden Power of What You Say--and What You Don't

#   stars
#    4.7
#    4.6
#    4.6
#    4.6

#-------------------------------------------------------------------------------
# Question 7. What is the title of the book that mentions the word “food”
#-------------------------------------------------------------------------------
most_food_mentions <- kindle_df %>%
  mutate(
    title_lower = str_to_lower(title),                 
    food_count = str_count(title_lower, "food")  
  ) %>%
  slice_max(food_count, n = 1) %>%                     
  select(title, food_count)

most_food_mentions

#ANSWER: 
# title
# The Ultimate Food List for Kidney Friendly Diabetes Diet Food Lists for Low GI, Phosphorus, Potassium, Salt/Sodium Foods To Eat & Avoid, Kidney Disease & Diabetes Food Lists POCKET SIZE 2 BOOKS IN 1
# 57 Scientifically-Proven Survival Foods to Stockpile: How to Maximize Your Health With Everyday Shelf-Stable Grocery Store Foods, Bulk Foods, And Superfoods
# The Food of a Younger Land: A portrait of American food- before the national highway system, before chainrestaurants, and before frozen food, when the ... of American food from the lost WPA files

# food_count
# 1          4
# 2          4
# 3          4

#-------------------------------------------------------------------------------
# Question 8. Parse Published_date and Extract month
#-------------------------------------------------------------------------------
kindle_df <- kindle_df %>%
  mutate(
    published_date = mdy(published_date),  
    month = month(published_date)          
  )

#-------------------------------------------------------------------------------
# Question 9. Convert month to a factor and create season variable 
#-------------------------------------------------------------------------------
kindle_df <- kindle_df %>%
  mutate(
    month = as.factor(month),  # Convert numeric month to factor
    season = fct_collapse(
      month,
      spring = c("3", "4", "5"),
      summer = c("6", "7", "8"),
      fall = c("9", "10", "11"),
      winter = c("12", "1", "2")
    )
  )

#-------------------------------------------------------------------------------
# Question 10. Draw a Bar Plot for Seasons
#-------------------------------------------------------------------------------
barplot(table(kindle_df$season), 
        main = "Distribution of Books by Season of Publication",
        xlab = "Season",
        ylab = "Number of Books",
        col = c("springgreen", "skyblue", "orange", "lightgray"),
        )

# ANSWER: From the bar graph we would see that there is more book published in fall compare to other season
# There are total of 4 seasons, winter spring, summer and fall
# The least amount of book published was in winter season and the 2nd lowest was summer season
# the second best season where the book was published was spring

#-------------------------------------------------------------------------------
# Question 11. Find the Newest Book and Its Age
#-------------------------------------------------------------------------------
newest_book <- kindle_df %>%
  filter(published_date == max(published_date, na.rm = TRUE)) %>%  
  mutate(
    age = today() - published_date) %>%
  select(title, published_date, age)

newest_book

# ANSWER: 
#     title         published_date      age
# Company of Foos     2023-10-17     502 days (~1.37 years)
