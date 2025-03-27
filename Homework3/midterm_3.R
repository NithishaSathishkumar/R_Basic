getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework3")

library(tidyverse)

university_df <- read.csv("rankings.csv")

university_df <- university_df %>% rename(students_faculty_ratio = Students.to.Faculty.Ratio)

university_df <- university_df %>% mutate(overall_score = (teaching + research_environment + research_quality + industry_impact + international_outlook) / 5)

university_df <- university_df %>% select(name:international_students, overall_score, everything())

# How many universities have an overall_score higher than 80?
university_df %>% filter(overall_score > 80) %>% summarise(Number_of_University = n())

# What are the top 5 universities with the highest Research Quality score? 
# Show the university name,country, and research quality score
university_df %>% 
  select(name, country, research_quality) %>%
  arrange(desc(research_quality)) %>%
  head(5)
  
#Create a new variable called faculty that calculates the number of faculty at the university. Use the
#round function to round your result to the nearest integer (0 digits).
university_df <- university_df %>% mutate(faculty = round(student_population / students_faculty_ratio))

university_df %>% select(name, country, faculty) %>% arrange(faculty) %>% head(3)

university_df %>% group_by(country) %>% summarise(avg_score = mean(teaching, na.rm = TRUE)) %>% arrange(avg_score) %>% head(1)
