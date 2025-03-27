# Base R and Data cleaning

# Selecting values (subsetting)
# Subsetting with positive integers
v1 <- 8:17
v1
# a b c d e f g h i j
# 8  9 10 11 12 13 14 15 16 17

# use names() to assign names to each element of vector
names(v1) <- letters[1:length(v1)]
attributes(v1)
# $names
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"

v1[2] # select the element in position 2
# b 
# 9

v1[2:4] # select elements within a range of positions
# b  c  d 
# 9 10 11

v1[c(2, 4, 6, 8)] # select elements from specific positions
# b  d  f  h 
# 9 11 13 15

v1[c(2, 2, 4)] # note that you can duplicate index positions
# b  b  d 
# 9  9 11

# SUBSETTING WITH NEGATIVE INTEGERS
# Subsetting with negative integers will omit the elements at the specified positions:
  v1[-1]
# b c d e f g h i j
# 9 10 11 12 13 14 15 16 17
  
v1[-c(2, 4, 6, 8)]
# a c e g i j
# 8 10 12 14 16 17

# SUBSETTING WITH LOGICAL VALUES
v1[c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE)]
# a c e f g j
# 8 10 12 13 14 17

v1[v1 < 12] # we can select/ subset using logical operators as well
# a  b  c  d 
# 8  9 10 11 

v1[v1 < 12 | v1 > 15]
# a  b  c  d 
# 8  9 10 11

v1[c(TRUE, FALSE)]
# if logical vector is shorter than the length of the vector being
# subsetted, it will be recycled to be the same length

# SUBSETTING WITH NAMES
v1["b"]
# b
# 9

v1[c("a", "c", "h")]
# a c h
# 8 10 15

#Simplifying subsets returns the simplest possible data structure that can represent
# the output. Preserving subsets keeps the structure of the output the same as the input.
# single brackets [ ] preserves
v1[1]
# a
# 8

# double brackets [[ ]] simplifies
v1[[1]]
# [1] 8

#Creating a data frame
v1 <- 1:3
v2 <-c("this", "is", "text")
v3 <- c(TRUE, FALSE, TRUE)
v4 <- c(2.5, 4.2, 3.1)

# convert same length vectors to a data frame using data.frame()
test_df <- data.frame(v1, v2, v3, v4)

# add/change column names with names()
names(test_df) <- c("col.1", "col.2", "col.3", "col.4")

# add row names
rownames(test_df) <- c("row1", "row2", "row3")

# SELECTING VALUES FROM DATA FRAMES
test_df
# col.1 col.2 col.3 col.4
# row1     1  this  TRUE   2.5
# row2     2    is FALSE   4.2
# row3     3  text  TRUE   3.1

# subsetting by row numbers
test_df[2:3, ]
# col.1 col.2 col.3 col.4
# row2     2    is FALSE   4.2
# row3     3  text  TRUE   3.1

# subsetting by row names
test_df[c("row2", "row3"), ]
#   col.1 col.2 col.3 col.4
# row2     2    is FALSE   4.2
# row3     3  text  TRUE   3.1

# subsetting columns like a matrix
test_df[ , c("col.2", "col.4")] # we can also use df[c("col.2", "col.4")]
# col.2 col.4
# row1 this 2.500000
# row2 is 4.200000
# row3 text 3.100000

# subset for both rows and columns
test_df[1:2, c(1, 3)]
# col.1 col.3
# row1 1 TRUE
# row2 2 FALSE

# use a vector to subset
v <- c(1, 2, 4)
test_df[ , v]
# col.1 col.2 col.4
# row1     1  this   2.5
# row2     2    is   4.2
# row3     3  text   3.1

#Using conditional statement
# using brackets
mtcars[mtcars$mpg > 20, ]
# using the simplified subset function
subset(mtcars, mpg > 20)

# FILTER FOR MULTIPLE CONDITIONS
# using brackets
mtcars[mtcars$mpg > 20 & mtcars$cyl == 6, ]
# using the simplified subset function
subset(mtcars, mpg > 20 & cyl == 6)

#SUBSET THEN SELECT DF COLUMNS
# using brackets
mtcars[mtcars$mpg > 20 & mtcars$cyl == 6, c("mpg", "cyl", "wt")]
# using the simplified subset function
subset(mtcars, mpg > 20 & cyl == 6, c("mpg", "cyl", "wt"))

# SUBSET THEN SELECT DF COLUMNS
# using brackets
mtcars[mtcars$mpg > 30 | mtcars$mpg < 10 , c("mpg")]

# SIMPLIFYING VS. PRESERVING
# simplifying results in a named vector
test_df$col.2
## [1] "this" "is" "text"
# simplifying results in a named vector
test_df[, 2]
# preserving results In a 3x1 data frame
test_df[2]
## col.2
## row1 this
## row2 is
## row3 text

# Modifying values
# MODIFYING VECTOR VALUES
my_vector <- c(1, 2, 3, 4, 5)
my_vector[1] <- 86

# MODIFYING MANY VECTOR VALUES
# Overwrite the 1st and 3rd values with 86 and 53
my_vector[c(1, 3)] <- c(86, 53)
# Overwrite the other values with -1
my_vector[c(2, 4, 5)] <- -1

# RE-CREATING OUR DATA FRAME
v1 <- 1:3
v2 <-c("this", "is", "text")
v3 <- c(TRUE, FALSE, TRUE)
v4 <- c(2.5, 4.2, 3.1)
# convert same length vectors to a data frame using data.frame()
test_df <- data.frame(v1, v2, v3, v4)
# add/change column names with names()
names(test_df) <- c("col.1", "col.2", "col.3", "col.4")
# add row names
rownames(test_df) <- c("row1", "row2", "row3")

# select the col.1 column
# then change the first 2 values in that column to 1000
test_df$col.1[1:2] <- 1000

# check the data frame using the head() function
head(test_df)

# Missing data