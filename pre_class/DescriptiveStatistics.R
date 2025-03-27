#Descriptive Statistics 

#-----------------Quantitative vs Qualitative----------------
#variable can collect either qualitative(marital Status) or quantitative(income) data
#Quantitative variables can be either discrete or continuous.
#Qualitative variables, can have categorical and ordinal

#----------------DESCRIPTIVE STATISTICS--------------------
#first pieces of information used to understand and represent a dataset
#describe the main features of numerical and categorical information with simple summaries
#summaries can be presented with a single numeric measure, using summary tables, or via graphical representation.

# Set Working Directory ---------------------------------------------------

getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/")

# Import Data -------------------------------------------------------------

# given that we set the working directory to the folder where the file is stored,
# you don't have to to write the entire path to the file

read.csv("Supermarket Transactions.csv")   

# The full path would be:
# read.csv("C:/Users/codri/Desktop/BBUS301/3/Supermarket Transactions.csv") 

# create a data frame called supermarket that would store the imported data

supermarket <- read.csv("Supermarket Transactions.csv")

#-----------------CATEGORICAL DATA DESCRIPTIVE STATISTICS---------------------
#Frequencies: The number of observations for a particular category
  #To produce contingency tables which calculate counts for each combination of categorical variables we can use R’s table() function
table(supermarket$Gender)
#   F    M 
# 7170 6889 

table(supermarket$Marital.Status, supermarket$Gender)
#     F    M
# M 3602 3264
# S 3568 3625

#Multidimensional tables based on three or more categorical variable
#customer counts across location by gender and marital status
table1 <- table(supermarket$Marital.Status, supermarket$Gender, supermarket$State.or.Province)
ftable(table1)
#       BC   CA   DF Guerrero Jalisco   OR Veracruz   WA Yucatan Zacatecas
#
#M F   190  638  188       77      15  510      142 1166     200       476
#  M   197  692  210       94       5  514      108 1160     129       155
#S F   183  686  175      107      30  607      125 1134     164       357
#  M   239  717  242      105      25  631       89 1107     161       309

#Proportions: The percent that each category accounts for out of the whole
# Percentages of gender categories
table2 <- table(supermarket$Gender)
prop.table(table2)
#         F         M 
# 0.5099936 0.4900064 

# Percentages for gender by marital status
table3 <- table(supermarket$Marital.Status, supermarket$Gender)
prop.table(table3)
#           F         M
# M 0.2562060 0.2321644
# S 0.2537876 0.2578420

# Customer percentages across location by gender and marital status
# using table1 from previous code chunk
ftable(round(prop.table(table1), 3))
#       BC    CA    DF Guerrero Jalisco    OR Veracruz    WA Yucatan Zacatecas
# M F  0.014 0.045 0.013    0.005   0.001 0.036    0.010 0.083   0.014     0.034
# M  0.014 0.049 0.015    0.007   0.000 0.037    0.008 0.083   0.009     0.011
# S F  0.013 0.049 0.012    0.008   0.002 0.043    0.009 0.081   0.012     0.025
# M  0.017 0.051 0.017    0.007   0.002 0.045    0.006 0.079   0.011     0.022

#Marginals: The totals counts or percentages in a cross tabulation by row or column
table3
#     F    M
# M 3602 3264
# S 3568 3625

# FREQUENCY MARGINALS
# row marginals - totals for each marital status across gender
margin.table(table3, 1)
#    M    S 
# 6866 7193

# column marginals - totals for each gender across marital status
margin.table(table3, 2)
#    F    M 
# 7170 6889 

# PERCENTAGE MARGINALS
# row marginals - row percentages across gender
prop.table(table3, margin = 1)
#           F         M
#  M 0.5246140 0.4753860
#  S 0.4960378 0.5039622

# column marginals - column percentages across marital status
prop.table(table3, margin = 2)
#            F         M
#  M 0.5023710 0.4737988
#  S 0.4976290 0.5262012

#-----------------NUMERICAL DATA DESCRIPTIVE STATISTICS-------------------------
salaries <- read.csv("Baseball Salaries 2011.csv")   
#library(moments) # for calculating the skew and kurtosis
#library(outliers) # identifying and extracting outlines

# Central Tendency: What are the most typical values?
# Three common measures: mean, median, mode
mean(salaries$Salary, na.rm = TRUE) # 3305055
median(salaries$Salary, na.rm = TRUE) # 1175000

# Variability: How do the values vary? 
# Range, Percentiles, and Variance

# Range
# get the minimum value
min(salaries$Salary, na.rm = FALSE) # 414000

# get the maximum value
max(salaries$Salary, na.rm = FALSE) # 32000000

# get both the min and max values
range(salaries$Salary, na.rm = FALSE) # 414000 32000000

# compute the spread between min & max values
max(salaries$Salary, na.rm = FALSE) - min(salaries$Salary, na.rm = FALSE) # 31586000

# Percentiles
# default quantile() percentiles are 0%, 25%, 50%, 75%, and 100%
quantile(salaries$Salary, na.rm = TRUE)
#      0%      25%      50%      75%     100% 
#  414000   430325  1175000  4306250 32000000 

# we can customize quantile() for specific percentiles
quantile(salaries$Salary, probs = seq(from = 0, to = 1, by = .1), na.rm = TRUE)
#    0%      10%      20%      30%      40%      50%      60%      70%      80%      90%     100%
#414000   416520   424460   441300   672000  1175000  2004000  3320000  5500000  9800000 32000000
      
# we can quickly compute the difference between the 1st and 3rd quantile
IQR(salaries$Salary) # 3875925

summary(salaries$Salary)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# 414000   430325  1175000  3305055  4306250 32000000

# Variance
# variance
var(salaries$Salary) # 2.056389e+13

# standard deviation
sd(salaries$Salary) # 4534742

# Shape: Are the values symmetrically or asymmetrically distributed?
library(moments)

# Skewness is a measure of symmetry for a distribution. Negative values represent a left-
# skewed distribution where there are more extreme values to the left causing the mean to be
# less than the median. Positive values represent a right-skewed distribution where there are
# more extreme values to the right causing the mean to be more than the median.
skewness(salaries$Salary, na.rm = TRUE)

# Kurtosis is a measure of peakedness for a distribution. Negative values indicate a flat
# (platykurtic) distribution, positive values indicate a peaked (leptokurtic) distribution, and a
# near-zero value indicates a normal (mesokurtic) distribution
kurtosis(salaries$Salary, na.rm = TRUE)

# Outliners: Are there values that represent abnormalities in the data
# Outliners in data can distort predictions and affect their accuracy

# gets most extreme right-tail observation
outlier(salaries$Salary)

# gets most extreme left-tail observation
outlier(salaries$Salary, opposite = TRUE)

#Correlations
# The correlation measures the linear relationship between two variables.
# The strength of relationship can be anywhere between −1 and +1. The
# stronger the correlation, the closer the correlation coefficient comes to
# ±1. If the coefficient is a positive number, the variables are directly related 
cor(mtcars)
cor(mtcars$mpg, mtcars$wt) # -0.8676594
