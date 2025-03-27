# R variable
#create new variable
name <- "Nithisha Sathishkumar"
length(name) #Output: 1 because there is only one quote 

# Separate the text by 
name_nith <- c("Nithisha", "Sathishkumar")
length(name_nith) #output: 2

#vector and data types----------------------------------------------------------
#create vector
z <- c(1, 4, 6, 8)

#Data type of the vector
typeof(z) #double 

#Added 2 to each element 
z + 2 # 4 10 14 18

#Multiply 3 to each element 
z * 3 #6 24 36 48

#added two vector together 
result <- c(z, c(1,2, 3, 4))
result 

str(result) # num [1:4] 3 10 15 20 #type of element, 1 

typeof(result) #double
class(result) #"numeric"


#TEST OUR SKILLS----------------------------------------------------------------
#1. create new variable
my.num <- c(1, 2, 3, 4, 5, 6)

#2. create new variable
my.char <- c("a", "b", "c", "d", "e")

#3. combine 2 variable my.num and my.char into a variable
both <- c(my.num, my.char)
both

#4. length of both
length(both) #11

#5. class of both (num < char)
class(both) #character

#6. divide both by 3, what happens?
#both / 3 # error in both/3 : non-numeric argument to binary operator

#7. 
x <- c(1, 2, 3, 4, 5, 6)

#8
y <- c(10, 20, 30, 40, 50)

#9
x + y #11 22 33 44 55 16 (if the length of vector is different it is rotate the shortest vector, y = 10 + x = 6 = 16) 
#but Warning message: x + y : longer object length is not a multiple of shorter object length

#10 
#y <- c(70, y) #added the 70 to the front # 70 10 20 30 40 50
y <- c(y, 70) 
y # 10 20 30 40 50 70 

#11
x + y #11 22 33 44 55 76


#Vectors and Data types
# 1
a <- seq(from = 1, to = 5) #seq(from, to) == 1:5
a
class(a) #integer

#2
b <- c("TRUE", "FALSE", "TRUE", "FALSE") #as.logical(seq(1, 4) %% 2)
class(b)

#3
b <- as.logical(b)
class(b)

#4
sum(b) # TRUE = 1, FALSE = 0, TRUE = 1, FALSE = 0 = 1 + 0 + 1 + 0 = 2

#5 
mean(b) # 4 varible 2 true  = 2/4 = 0.50 50% true and 50%false


test_df <- data.frame(
  sex = c("male", "female", "male", "male", "female"),
  age = c(22, 45, 33, 27, 30)
)

names(test_df) # "sex" "age" column name
ncol(test_df) #2 column
nrow(test_df) #5 row

dim(test_df) # 5 2 (row, column)

str(test_df) 
#'data.frame':	5 obs. of  2 variables:
#$ sex: chr  "male" "female" "male" "male" ...
#$ age: num  22 45 33 27 30

#col3 = as.logical(seq(1,3) %% 2)

#TEST OUR SKILLS
test2_df <- data.frame(
  col1 = seq(1, 3),
  col2 = c("this", "is", "text"),
  col3 = as.logical(c("TRUE", "FALSE", "TRUE")),
  col4 = c(2.5, 4.2, pi)
)

dim(test2_df) #3rows 4column
str(test2_df)
#'data.frame':	3 obs. of  4 variables:
#$ col1: int  1 2 3
#$ col2: chr  "this" "is" "text"
#$ col3: logi  TRUE FALSE TRUE
#$ col4: num  2.5 4.2 3.14
#col5 <- c("A", "B", "C")

test2_df <- cbind(test2_df, col5)
#col1 col2  col3     col4   col5
#1    1 this  TRUE 2.500000    A
#2    2   is FALSE 4.200000    B
#3    3 text  TRUE 3.141593    C

#change names of each column 
names(test2_df) #"col1" "col2" "col3" "col4"
names(test2_df) <- c("v1", "v2", "v3", "v4", "v5")

