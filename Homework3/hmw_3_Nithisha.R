#===============================================================================
# Homework 3 -------------------------------------------------------------------
#===============================================================================

# Nithisha Sathishkumar
# February 10
# Material Covered: Intro to Tidyverse and Tidying Data, & Data Manipulation

#===============================================================================
# RESHAPE YOUR DATA ------------------------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 1. Set working directory where the csv file is located
#-------------------------------------------------------------------------------
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework3")

#-------------------------------------------------------------------------------
# Question 2. Load the Tidyverse package in your library
#-------------------------------------------------------------------------------
library(tidyverse)

#-------------------------------------------------------------------------------
# Question 3. create new data frame for the cities.csv
#-------------------------------------------------------------------------------
# read data
cities_df <- read.csv("cities.csv") 
# view(cities_df)

#-------------------------------------------------------------------------------
# Question 4. re-shape data frame so it looks like the picture 
#-------------------------------------------------------------------------------
# Separate the location-> city and country, combine temperature_value and scale to temperature, spread the variable table into each category with value, rearrange the data 
cities_df <- cities_df %>% 
  separate(location, c("city", "country"), sep ="/") %>% 
  unite(temperature, temperature_value, scale, sep = " ") %>% 
  spread(variable, value) %>% 
  select(city, country, area_km2, temperature, population, gdp_million)
view(cities_df)

# cities_df <- cities_df %>% unite(location, city, country, sep = "/") %>%
#   separate(temperature, c("temperature_value", "scale"), sep = " ") %>%
#   select(location, temperature_value, scale, area_km2, population, gdp_million) %>%
#   gather(variable, value, area_km2:gdp_million)
# view(cities_df)

#===============================================================================
# DATA MANIPULATION AND INSIGHTS -----------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 5. create new data frame for the university.csv
#-------------------------------------------------------------------------------
university_df <- read.csv("rankings.csv")

#-------------------------------------------------------------------------------
# Question 6. Rename the variable
#-------------------------------------------------------------------------------
university_df <- rename(university_df, students_faculty_ratio = Students.to.Faculty.Ratio)

#-------------------------------------------------------------------------------
# Question 7. Create a new variable called overall_score
#-------------------------------------------------------------------------------
university_df <- mutate(university_df, overall_score = (teaching + research_environment + research_quality + industry_impact + international_outlook) / 5)
# view(university_df)

#-------------------------------------------------------------------------------
# Question 8. Change the order of the variables
#-------------------------------------------------------------------------------
university_df <- select(university_df, name:international_students, overall_score, everything())
# view(university_df)

#-------------------------------------------------------------------------------
# Question 9. How many universities have an overall_score higher than 80? 
#-------------------------------------------------------------------------------
filter(university_df, overall_score > 80) %>% summarise(number_of_universities = n())
# ANSWER: 
# number_of_universities
#                     100

#-------------------------------------------------------------------------------
# Question 10. What are the top 5 universities with the highest Research Quality score?
#-------------------------------------------------------------------------------
university_df %>% slice_max(order_by = research_quality, n = 5) %>%
  select(name, country, research_quality)
#ANSWER:
#                               name            country           research_quality
#  Massachusetts Institute of Technology    United States             99.7
#  Massachusetts Institute of Technology    United States             99.7
#                    Stanford University    United States             99.6
#                    Stanford University    United States             99.6
#                     Harvard University    United States             99.4

#-------------------------------------------------------------------------------
# Question 11. Create a new variable called faculty that calculates the number of faculty at the university.
#-------------------------------------------------------------------------------
university_df <- mutate(university_df, faculty = round(student_population / students_faculty_ratio, 0))
view(university_df)

#-------------------------------------------------------------------------------
# Question 12. Find the 3 universities with the lowest number of faculty
#-------------------------------------------------------------------------------
university_df %>% slice_min(order_by = faculty, n = 3) %>%
  select(name, country, faculty)
#ANSWER:
#                    name                                               country  faculty
# National Institute of Applied Sciences, Strasbourg (INSA Strasbourg)  France      42
# École Nationale des Travaux Publics de l'État (ENTPE)                 France      51
# Toyota Technological Institute                                        Japan       51

#-------------------------------------------------------------------------------
# Question13. Which country has the lowest Teaching score on average across all universities?
#-------------------------------------------------------------------------------
university_df %>% group_by(country) %>% summarise(lowestAvg_teaching_score = mean(teaching, na.rm = TRUE)) %>% slice_min(order_by = lowestAvg_teaching_score, n = 1)
# ANSWER:
# country    lowestAvg_teaching_score
# Mozambique                     10.3