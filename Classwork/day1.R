getwd() #get the working directory
setwd("/Users/nithishasathishkumar/Desktop/R/") #set the working directory 

#------------------R as a calculator in console--------------
7 + 11

#------------------order of operation ---------------------
10 + 2 * 20 # 50
(10 + 2) * 20 #

#-------------------storing values-------------------
age <- 87 #assign value 
age #print the value
age + 2 # this does not overwrite the memory
age <- age + 2 #add 2 to the current age (overwrite the memory)
print(age) #print the value

#---------------test our skill---------------------
1/4 #0.25
((1.27^2) + (2.04^2)) / 2 #2.88725

#assign variable
a <- 9
b <- 3
A/b #Error because R is case sensitive 

#-------------------Mathematical function----------------
#determine sqrt of 2
sqrt(2) #1.414214

#determine value of log base 10 of 1
log10(1) # 0
log(1, base=10) #0

#----------------logical operators-------------------
x <- 10
y <- 8

x == y #false
x <= y #False
x != y #True

#------------------Practice In-class Exercise-------------
#determine the value
a1 <- (log2(5))
a2 <- a1^3
a3 <- (a2 * 0.7) 
a4 <- a3 + 1
a5 <- sqrt(a4)
a6 <- exp(a5)
a6 # 22.74971


#what wrong with the code
((2+1) / ((2-5) + 1) * (5 + 3)) #missing bracket

#---------------importing data Installed R-------------
#create csv


getwd() #restart the file 

read.csv("test.csv")

