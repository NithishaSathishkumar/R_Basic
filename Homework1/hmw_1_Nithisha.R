#===============================================================================
# Homework 1 -------------------------------------------------------------------
#===============================================================================

# Nithisha Sathishkumar
# January 15
# Material Covered: Introduction to R Programming, Data structures, variables, and data types
# and Descriptive Statistics in R

#===============================================================================
# INTRODUCTION TO R PROGRAMMING  -----------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 1. Create an R Script
# Question 2. Insert Section
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Question 3. Set working directory where the wa_weather.csv is located
#-------------------------------------------------------------------------------
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework1")

#-------------------------------------------------------------------------------
# Question 4. Create three new variable, a, b and c
#-------------------------------------------------------------------------------
a <- 10
b <- 3.5
c <- 100

#-------------------------------------------------------------------------------
# Question 5. determine the value of 3 variable above.
#-------------------------------------------------------------------------------
x1 = sqrt(c) 
x2 = a * x1
x3 = (b)^2
x4 = x2 + x3
x5 = c - b
x6 = x4 / x5
x6 #Output: 1.163212
# ANSWER: The result for the mathematical function is 1.163212

#===============================================================================
# DATA STRUCTURES, VARIABLES & DATA TYPES --------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 6. you are an amateur astronomer. Keeping track of how many different constellations.
#-------------------------------------------------------------------------------
#a. Create variable called constellations_observed and assign chose number, I chose Number 13 
constellations_observed <- 13

#b. Create variable called hours_per_trip
hours_per_trip <- 4

#c.Create variable called total_hours 
total_hours <- constellations_observed * hours_per_trip
total_hours #Output: 52 hours
# ANSWER: I spent 52 hours observing constellations

#d. check if total_hours equal to 40 
total_hours == 40 #Output: FALSE
#ANSWER: Logical operator I used to check if total_hours is equal to, which is used to check for exact equality between two values
# since my total_hours was 52 the logical operator returned FALSE

#-------------------------------------------------------------------------------
# Question 7. Track number of constellation you observe each month
#-------------------------------------------------------------------------------
#a. Create new variable called constellations_by_month and create vector
constellations_by_month <- c(10, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0)

#b. Find what type of vector is constellations_by_month
typeof(constellations_by_month) #Output: double
# ANSWER: The type of vector constellations_by_month is double

#c. Coerce constellations_by_month into integer vector 
constellations_by_month <- as.integer(constellations_by_month) #used as.integer to convert from double to integer
typeof(constellations_by_month) #Output: Integer

#d.Multiply each element in the constellations_by_month vector by 4
hours_by_month <- constellations_by_month * 4
hours_by_month #Output: 40 60 28  0  0  0  0  0  0  0  0  0

#e. Use a logical operator on your hours_by_month vector to check which months greater than 30
hours_by_month > 30 #Output: TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# ANSWER: Month January, February are greater than 30 

#-------------------------------------------------------------------------------
# Question 8. Create data frame with constellations_by_month and month
#-------------------------------------------------------------------------------
astronomy_data_df <- data.frame(
  #a. constellations_by_month
  constellations_by_month = constellations_by_month,
  
  #b. Create variable called month include the names of all 12 months
  month = c("January", "February", "March", "April", "May", "June", "July", "August",
             "September", "October", "November", "December")
)

astronomy_data_df #Output: prints table out 

#-------------------------------------------------------------------------------
# Question 9. str() function to examine your data frame
#-------------------------------------------------------------------------------
str(astronomy_data_df) #Output: 'data.frame':	12 obs. of  2 variables:...
#ANSWER: There are 12 observations and 2 variables

#===============================================================================
# DESCRIPTIVE STATISTICS IN R -----------------------------------------------
##===============================================================================

#-------------------------------------------------------------------------------
# Question 10. import the wa_weather.csv and create new data frame 
#-------------------------------------------------------------------------------
wa_weather_df <- read.csv("wa_weather.csv")

wa_weather_df <- data.frame(
  location = wa_weather_df$location, 
  temperature = wa_weather_df$temperature, 
  humidity = wa_weather_df$humidity, 
  windspeed = wa_weather_df$windspeed, 
  precipitation = wa_weather_df$precipitation, 
  month = wa_weather_df$month, 
  weather_condition = wa_weather_df$weather_condition
)

#-------------------------------------------------------------------------------
# Question 11. Descriptive statistics for the temperature variable
#-------------------------------------------------------------------------------
#a.Mean 
mean(wa_weather_df$temperature) #Output: 50.36667
# ANSWER: Mean of the temperature based on wa_weather_df is 50.36667

#b. Range
range(wa_weather_df$temperature)#Output: 30 64
# ANSWER: Range of the temperature based on wa_weather_df is 30 minimum and 64 maximum

#-------------------------------------------------------------------------------
# Question 12. Temperature value such that 25% of temperatures lie below this value
#-------------------------------------------------------------------------------
quantile(wa_weather_df$temperature, probs = seq(from = 0, to = 1, by = 0.25), na.rm = TRUE) 
#Output:    0%   25%   50%   75%  100% 
        # 30.00 44.25 50.50 58.75 64.00 
quantile(wa_weather_df$temperature, probs = 0.25, na.rm = TRUE) #Just 25%
#Output:  25% 
      #  44.25
#ANSWER: The Temperature value such that 25% of temperatures lie below this value is 44.25°F

#-------------------------------------------------------------------------------
# Question 13. Use one descriptive statistic discussed in Module 3
#-------------------------------------------------------------------------------
frequency_weather <- table(wa_weather_df$weather_condition)
prop.table(frequency_weather) * 100
#Output: 
# Cloudy Partly   Cloudy         Rainy         Snowy      Sunny 
#   23.33333      13.33333      26.66667      13.33333    23.33333

#ANSWER: The function I used was proportions from categorical data descriptive statistics.
      # I used this because it provides percentage of each weather condition out of the total observations in the dataset.
  
      # The data shows that 26.67% of the observations are classified as Rainy, 
      # making it the most common weather condition. Cloudy and Sunny conditions are 
      # equally frequent, each accounting for 23.33% of the total observations. 
      # Meanwhile, Partly Cloudy and Snowy are the least frequent weather conditions, each comprising 13.33% of the dataset.

#-------------------------------------------------------------------------------
# Question 14. Create a multidimensional table of frequencies
#-------------------------------------------------------------------------------
table1 <- table(wa_weather_df$location, wa_weather_df$month, wa_weather_df$weather_condition)
ftable(table1)
# Part of the Output: 
# Seattle   April           0             0     0     0     0
#           August          0             0     0     0     1
#           December        0             0     0     0     0
#           February        0             0     1     0     0
#           January         0             0     0     0     0
#           July            0             0     0     0     0
#           June            0             0     0     0     2
#           March           1             0     0     0     0
#           May             0             0     0     0     0
#           November        0             0     2     0     0
#           October         1             0     0     0     0
#           September       0             0     0     0     0

# ANSWER: There are 2 months of June recorded as sunny in Seattle in the dataset.

#-----------------------------------------------------------------------------------------
# Question 15. Analyze the relationship/ correlation between temperature and precipitation
#-----------------------------------------------------------------------------------------
cor(wa_weather_df$temperature, wa_weather_df$precipitation) #Output: -0.6404499
# ANSWER: The correlation coefficient between temperature and precipitation is -0.6404499, 
# which indicates a moderate to strong negative relationship.
