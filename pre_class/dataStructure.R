#Data Structures, variables and data types

#--------------Variable--------------
radius <- 3
pi <- 3.14
area <- pi * radius * radius
print(area)

#--------------Data Types--------------
#--------------Numeric (integers are treated as numeric or double)--------------
number1 <- 3.5
number2 <- 3

class(number1) #check data type using class function: returns class or type
is.numeric(number1) #check if data type is numeric using is.numeric() function

#--------------Character--------------
firstName <- "jovial"
lastName <- 'man'

class(firstName) #check data type
is.character(firstName) #use is.character to check data type

#--------------coerce any data type to character--------------
age <- as.integer(30) # integer
score <- 9.8 # numeric/double
opt_course <- TRUE # logical
today <- Sys.time() # date time

as.character(age)
as.character(score)
as.character(opt_course)
as.character(today)

#--------------logical--------------      
x <- 3
y <- 4

x > y
z <- x > y
class(z) #logical

#TRUE is represented by all numbers except 0. FALSE is represented only by 0 and no other numbers.
as.logical(1) # true
as.logical(0) # false

# using numbers
as.numeric(TRUE) # 1
as.numeric(FALSE) # 0

# using different numbers
as.logical(-2, -1.5, -1, 0, 1, 2) # true

#--------------vector--------------
character_vector <- c("hello", "how", "are")
numeric_vector <- seq(from = 1, to = 39, by = 2)
is.vector(character_vector) #TRUE
is.character(character_vector) #TRUE

# a slick way to ensure, you create an int vector, use L after a num
int_vec <- c(1L, 1e4L, -5L)

#logical vector
logical_vector <- c(TRUE, FALSE, TRUE)

#length of vector
length(character_vector)

#typeof or class to identify type of atomic vector
typeof(character_vector)
class(logical_vector)

#attributes: information you can attach to an R object, will not appear when displaying an object or affect object value
nlp_vector <- c("hello", "How are you?") 

#check for attributes
attributes(numeric_vector) #Null

#names attribute
#view names of each element
names(nlp_vector) #null

#assign or change names with a character vector
names(nlp_vector) <- c("greeting", "followup question")
attributes(nlp_vector) 
# $names
#[1] "greeting"          "followup question"

names(nlp_vector) <- NULL
names(nlp_vector)

#--------------Vector Coercion--------------
#forcing functions on data types coerces vectors
as.character(43)
as.logical(0)
as.numeric(TRUE)

#vector coercion isn't always a bad things
#math with logical
logical_vector #TRUE FALSE  TRUE
sum(logical_vector) #1 + 0 + 1 = 2 
mean(logical_vector) # 2/3 = 0.6666667

#--------------Matrix--------------
# Two-dimensional array, Numeric data only

VADeaths
#Rural Male Rural Female Urban Male Urban Female
#50-54       11.7          8.7       15.4          8.4
#55-59       18.1         11.7       24.3         13.6
#60-64       26.9         20.3       37.0         19.3
#65-69       41.0         30.9       54.6         35.1
#70-74       66.0         54.3       71.1         50.0

class(VADeaths) #matrix array

nrow(VADeaths) #5

ncol(VADeaths) #4

dim(VADeaths) #5 4

#--------------Data Frame--------------
#Two dimension, named list of vectors with specific attributes, each vector become a column & vector must be same length in data frame
#iris_abbreviated

#data.frame() function to create a data frame
cool_df <- data.frame(
  # columns of data frame
  observation = c("a", "b", "c", "d"),
  rand_norm_value = rnorm(4),
  exclude_flag = c(TRUE, FALSE, FALSE, TRUE),
  # other options for data frame
  row.names = NULL,
  stringsAsFactors = FALSE
)

cool_df 
#observation rand_norm_value exclude_flag
#1           a      -0.1738558         TRUE
#2           b       0.1154106        FALSE
#3           c       1.3856783        FALSE
#4           d       1.2576400         TRUE

class(cool_df) # data.frame

#str() to examine structure of data frame
str(cool_df)
#'data.frame':	4 obs. of  3 variables:
#$ observation    : chr  "a" "b" "c" "d"
#$ rand_norm_value: num  -0.174 0.115 1.386 1.258
#$ exclude_flag   : logi  TRUE FALSE FALSE TRUE

