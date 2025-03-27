#control + Enter to excute in console
5 + 6

#declare variable 
a <- 5 
b <- 7
a + b 
sum(a,b) #existing function

#string variable
name <- c('Nithisha', 'Sathishkumar') #c = concatenation chr[1:2]
name 

#table data
name <- c('Kenisha', 'Gayathri', 'Sathishkumar') #c = concatenation chr[1:2]
age <- c(47, 52, 34) #num
gender <- c("M", "M", "F") #chr

friends <- data.frame(name, age, gender) #data table is created 
friends$name #accesses specific data in the table
friends[ , ] #print the table out 
#           name age gender
#1      Kenisha  47      M
#2     Gayathri  52      M
#3 Sathishkumar  34      F

friends[1 , ] #print the table out 1 row with all column
#           name age gender
#1      Kenisha  47      M

friends[1 , 1] #print the table out 1 row with 1 column
#1  Kenisha  

friends[friends$age < 50, 1:2] #set age range and print the row:column
#           name age
#1      Kenisha  47
#3 Sathishkumar  34

#Install Packages
#install.packages("tidyverse")
library(tidyverse)
friends %>%
  select(name, age) %>%
  filter(age < 50) %>%
  arrange(age)
#          name age
#1 Sathishkumar  34
#2      Kenisha  47

# R is case sensitive, overwrites variable names
# ls() : list all object name
ls() #1] "a"       "age"     "b"       "friends" "gender"  "name"   

# rm() : remove objects
rm()


#logical operators
# == is equal to
# != is not
# >= larger than or equal to
# < smaller than

x <- 4
x == 6
# [1] FALSE

x != 10
# [1] TRUE

#function
# using functions in R
round(2.71828) #3
sd(1:10) #3.02765
round(sd(1:10)) #3
round(2.71828, digits = 2) #2.72

# more on function arguments
sd(1:10, digits = 3) #Error in sd(1:10, digits = 3) : unused argument (digits = 3)

#args() = look up a functions arguments
args(sd) #function (x, na.rm = FALSE) NULL
sd(1:10, TRUE) #3.02765

#Script
# set your working directory
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R") # insert your working directory here
getwd()

# Import and Export Data 
# Use the read.csv() function to read in .csv files
getwd()  
read.csv("/Users/nithishasathishkumar/Desktop/R/1. Introduction to R programming/week1_cincy_crimes.csv")

# create a data frame
cincy_crimes_df <- read.csv("/Users/nithishasathishkumar/Desktop/R/1. Introduction to R programming/week1_cincy_crimes.csv")

# Use the write.csv() function to save .csv files to your hard drive
write.csv(cincy_crimes_df, "/Users/nithishasathishkumar/Desktop/R/1. Introduction to R programming/week1_cincy_crimes.csv")

