#===============================================================================
# Homework 5 -------------------------------------------------------------------
#===============================================================================

# Nithisha Sathishkumar
# March 12, 2025
# Material Covered: Data Visualization, Conditional Statements and Loops
# and Writing Functions

#===============================================================================
# DATA VISUALIZATION  ----------------------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 1. Load packages
#-------------------------------------------------------------------------------
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework5")

library(tidyverse)
library(patchwork)
library(purrr)
options(scipen=99)

#-------------------------------------------------------------------------------
# Question 2. Import ev-WA.csv 
#-------------------------------------------------------------------------------
ev_df <- read.csv("ev-WA.csv")

#-------------------------------------------------------------------------------
# Question 3. Create three graphs
#-------------------------------------------------------------------------------
graph1 <- ev_df %>% ggplot(aes(x = county)) +
  geom_bar() + 
  labs(
    x = "County",
    y = "Count of Electric Vehicles",
    title = "Number of Electric Vehicles by County"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
    ),
    axis.text.x = element_text(
      angle = 60,
      hjust = 1
    )
  ) +
  scale_y_continuous(labels = scales::comma)

graph2 <- ev_df %>% ggplot(aes(x = as.factor(ev_type), y = electric_range)) +
  geom_boxplot() +
  labs(
    title = "Electric Range by Vehicle Type",
    x = "Electric Vehicle Type",
    y = "Electric Range (miles)"
  )
  
graph3 <- ev_df %>% ggplot(aes(x = electric_range, y = average_MSRP, color = ev_type)) +
  geom_point() +
  labs(
    title = "Electric Range vs Average MSRP, by Vehicle Type",
    x = "Electric Range (miles)",
    y = "Average MSRP ($)",
    color = "Vehicle Type"
  ) +
  scale_y_continuous(labels = scales::comma) +
  theme(legend.position = "bottom")

graph1 / (graph2 + graph3)

#===============================================================================
# WRITING FUNCTIONS, CONDITIONAL STATEMENTS & LOOPS  ---------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 4. function price_category 
#-------------------------------------------------------------------------------
price_category <- function(MSRP){
  if(MSRP < 30000){
    "Affordable"
  }else if(MSRP >= 30000 && MSRP <= 60000){
    "Mid-Range"
  }else{
    "Luxury"
  }
}

#-------------------------------------------------------------------------------
# Question 5. Test when the MSRP is $45000
#-------------------------------------------------------------------------------
price_category(45000)
# ANSWER: Mid-Range

#-------------------------------------------------------------------------------
# Question 6. Enhance price_category not take not numeric
#-------------------------------------------------------------------------------
price_category <- function(MSRP){
  if(!is.numeric(MSRP)){
    stop("This function only works for numeric inputs!. You have provided an object of the following class: ", class(MSRP))
  }
  
  if(MSRP < 30000){
    "Affordable"
  }else if(MSRP >= 30000 && MSRP <= 60000){
    "Mid-Range"
  }else{
    "Luxury"
  }
}

#-------------------------------------------------------------------------------
# Question 7. Test when the MSRP is "high"
#-------------------------------------------------------------------------------
price_category("high")
# ANSWER: Error in price_category("high") : 
# This function only works for numeric inputs!. You have provided an object of
# the following class: character

#-------------------------------------------------------------------------------
# Question 8. Use map_chr() 
#-------------------------------------------------------------------------------
ev_df <- ev_df %>% 
  mutate(price_category = map_chr(average_MSRP, price_category)) %>%
  as.data.frame()

#-------------------------------------------------------------------------------
# Question 9. Use case_when()
#-------------------------------------------------------------------------------
ev_df <- ev_df %>%
  mutate(range_category = case_when(
    electric_range < 100 ~ "Low Range",
    electric_range >= 100 & electric_range <= 250 ~ "Medium",
    electric_range > 250 ~ "High Range"
  ))

#-------------------------------------------------------------------------------
# Question 10. Use case_when()
#-------------------------------------------------------------------------------
ev_df %>% 
  filter(ev_type == "Battery Electric Vehicle (BEV)") %>% 
  ggplot(aes(x= electric_range, y = average_MSRP)) +
  geom_point() +
  geom_smooth() + 
  labs(
    title = "Electric Range vs Average MSRP",
    x = "Electric Range",
    y = "Average MSRP ($)",
  )

# ANSWER: 
#Low Electric Range (~0-100 miles): The MSRP is relatively high at first but then dips, suggesting that some short-range EVs may be budget-friendly.
# Mid Electric Range (~100-200 miles): A sharp increase in MSRP is noticeable, indicating that vehicles in this range tend to be more expensive.
# High Electric Range (~200-300+ miles): The MSRP varies widely, showing both premium and affordable long-range electric vehicles.
