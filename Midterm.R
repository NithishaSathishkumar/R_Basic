# --------Introduction to R programming-----------
10 + 2 * 20 #50
(10 + 2) * 20 #1 240

# Store values
#1. Assign the value of 87 to a variable named age
age <- 87

#2. How can you see the content of the age variable?
age 

#3. Add 2 to the current age. What is the resulting value? Did the variable age change? Why not?
age + 2 #89
# ANSWER: The value did not change in age variable because we did not 
# update age value by reassigning the value

#Test our skills
#4. 
v1 <- (1.27)^2
v2 <- (2.04)^2
v3 <- v1 + v2
v4 <- v3 / 2
v4 #2.88725

#5. 
# Since R programming is case sensitive and A variable will give error message of not found

#6. Determine sq root of 2
sqrt(2) #1.414214

#7. Determine value of log base 10 of 1
log10(1) #0

# Logical operators
# Assign x the value 10, and y the value 8.
x <- 10
y <- 8

# Use R to test the following relations:
#   1. Is x equal to y?
x == y # false

#   2. Is x smaller or equal to y?
x <= y # false

#   3. Are x and y different?
x != y #true

# --------  Data structures, variables, and data types ------------
# Create a new variable called name and assign your first and last name, in quotes.
name <- "Nithisha Sathishkumar"

# Use the length() function to evaluate the variable name. What is length() function measuring?
#   Why did you get this output?
length(name) # 1 because r measure number of element in a vector not the number of characters in a string

# Vector & data types
# Create a vector called z that contains the numbers 1, 4, 6, and 8.
z <- c(1, 4, 6, 8)
# What type of vector is z?
    typeof(z)
    
#   Add the value 2 to vector z. What happens?
    z + 2
    
#   Multiply z by 3. What happens?
    z * 3
    
#   Add vector z with a new vector c(1, 2, 3, 4) and assign the results to a new variable called result.
    result <- c(z, c(1, 2, 3, 4))
    result
# What happened?
#   Use the str() function to evaluate the object result. How is this different from typeof() or class()?
    str(z)
    
#Test our skill
# 1. create a new variable called my.num that contains 6 numbers
    my.num <- c(1, 2, 3, 4, 5, 6)
# 2. create a second variable called my.char that contains 5 independent character strings
    my.char <- c('a', 'b', 'c', 'd', 'e')
# 3. combine the two variables my.num and my.char into a variable called both
    both <- c(my.num, my.char)
    both
# 4. what is the length of both?
    length(both) # 11
    
# 5. what class is both?
    class(both) #"character"
    
# 6. divide both by 3, what happens?
    #both / 3 #error because both has type of character
    
x <- c(1, 2, 3, 4, 5, 6)
y <- c(10, 20, 30, 40, 50)
x + y
y <- c(y, 70)
x + y

a <- seq(1:5)
class(a)

b <- seq(1:4) %% 2
b <- as.logical(b)

d <- c("TRUE", "FALSE", "TRUE", "FALSE")
class(d)

d <- as.logical(d)

sum(d) 
mean(d)

test_df <- data.frame(sex = c("male", "female", "male", "male", "female"),
                      age = c(22, 45, 33, 27, 30)
                      )
names(test_df)
ncol(test_df)
nrow(test_df)
dim(test_df)
str(test_df)

getwd()
setwd("/Users/nithishasathishkumar/Desktop/R")

# Homework 1 --------------------------------------------------------------
#5.
a <- 10
b <- 3.5
c <- 100

v1 <- sqrt(c)
v2 <- b^2
v3 <- a * v1
v4 <- v3 + v2
v5 <- c - b
v6 <- v4 / v5
v6 # 1.163212

#6. 
constellations_observed <- 13
hours_per_trip <- 4
total_hours <- constellations_observed * hours_per_trip
total_hours == 40

#7
constellations_by_month <- c(10, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0)
typeof(constellations_by_month)
constellations_by_month <- as.integer(constellations_by_month)
hours_by_month <- constellations_by_month * 4

hours_by_month > 30 

#8
astronomy_data_df <- data.frame(constellations_by_month, month = c("January", "February", "March", "April", "May", "June",
                                                                                             "July", "August", "September", "October", "November", "December"))
#9
str(astronomy_data_df)

#10
wa_weather_df <- read.csv("wa_weather.csv")
wa_weather_df

#11
mean(wa_weather_df$temperature)
range(wa_weather_df$temperature)

#12
quantile(wa_weather_df$temperature, 0.25, na.rm=TRUE)

#13
table1 <- table(wa_weather_df$weather_condition)
prop.table(table1) 

table2 <- table(wa_weather_df$location, wa_weather_df$month, wa_weather_df$weather_condition)
ftable(table2)
#15
cor(wa_weather_df$temperature, wa_weather_df$precipitation)

# Homework 2 --------------------------------------------------------------

collisions_df <- read.csv("collisions.csv")

names(collisions_df) <- c("object_id", "location", "severity_desc", "collision_type", "person_count", "serious_injury", "fatalities", "inc_date", "weather", "road_cond", "light_cond", "source")

table(collisions_df$severity_desc)
collisions_df$severity_desc[collisions_df$severity_desc == "Fatality Collision"] <- "Fatal Collision"

table(collisions_df$weather)
collisions_df$weather[collisions_df$weather == "Not known"] <- "Unknown"

colSums(is.na(collisions_df))
collisions_df$person_count[is.na(collisions_df$person_count)] <- mean(collisions_df$person_count, na.rm = TRUE)

barplot(table(collisions_df$collision_type), main = 'Collision Type', xlab = "type of collision", ylab = "frequency of collision")

mosaicplot(collisions_df$severity_desc ~ collisions_df$source, main = "title", xlab = "x", ylab = "y")

boxplot(collisions_df$person_count ~ collisions_df$source, main = "title", xlab = "x", ylab = "y")
