getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Classwork")

hers_df <- read.csv("hersdata.csv")
hers_df
#-----------------NUMERICAL DATA DESCRIPTIVE STATISTICS-------------------------
# na.rm = Remove NA

mean(her_df$LDL, na.rm = TRUE)
median(her_df$LDL, na.rm = TRUE)

#Variarace
#1st Qu??
summary(hers_df$LDL)
summary(hers_df)


#install.packages("moments")
library(moments)

#SHAPE
#Find skewness
skewness(hers_df$LDL, na.rm = TRUE) #0.925615 positive value mean right-skewed distribution where there are more extreme values to the right causing the mean to be more than the median

#Find Kurtosis
kurtosis(hers_df$LDL, na.rm = TRUE) #5.548175 positive indicate a peaked distribution

# greater than 2 to tall, smaller than -2 is flat

# TEST OUR SKILLS
# Central Tendency
# Find mean
mean(hers_df$weight, na.rm = TRUE) # 72.73484

#Find Median
median(hers_df$weight, na.rm = TRUE) # 71

#Variability 
summary(hers_df$weight)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#  37.50   62.20   71.00   72.73   81.40  132.00       2 

min(hers_df$weight, na.rm = TRUE) # 37.5
max(hers_df$weight, na.rm = TRUE) #132
quantile(hers_df$weight, na.rm = TRUE)
#   0%   25%   50%   75%  100% 
# 37.5  62.2  71.0  81.4 132.0 

#Shape
skewness(hers_df$weight, na.rm = TRUE) # 0.7042269
kurtosis(hers_df$weight, na.rm = TRUE) # 3.49991


#-----------------CATEGORICAL DATA DESCRIPTIVE STATISTICS---------------------
#HERS DATA 
#Count How many observations fall into each physical activity category
table(hers_df$physact)
#about as active     much less active     much more active    somewhat less active  somewhat more active 
#919                  197                  306                 503                   838 

table2 <- table(hers_df$physact)
prop.table(table2)
# about as active     much less active     much more active    somewhat less active    somewhat more active
# 0.33260948           0.07129931           0.11074919          0.18204850              0.30329352 
 
table1 <- table(hers_df$physact, hers_df$smoking) 
ftable(table1)
#                       no yes
# about as active       804 115
# much less active      155  42
# much more active      268  38
# somewhat less active  418  85
# somewhat more active  758  80

prop.table(table1) #Entire population not condition
#                             no        yes
# about as active      0.29098806 0.04162143
# much less active     0.05609844 0.01520087
# much more active     0.09699602 0.01375317
# somewhat less active 0.15128484 0.03076366
# somewhat more active 0.27433949 0.02895404

prop.table(table1, margin = 2) # column (no vs yes)
#                            no       yes
# about as active      0.3345818 0.3194444
# much less active     0.0645027 0.1166667
# much more active     0.1115273 0.1055556
# somewhat less active 0.1739492 0.2361111
# somewhat more active 0.3154390 0.2222222

prop.table(table1, margin = 1) # row based on topic (about as active vs much less active)
#                               no        yes
# about as active      0.87486398 0.12513602
# much less active     0.78680203 0.21319797
# much more active     0.87581699 0.12418301
# somewhat less active 0.83101392 0.16898608
# somewhat more active 0.90453461 0.09546539


#TEST OUR SKILLS
table3 <- table(hers_df$race, hers_df$diabetes)

#Frequency 
ftable(table3) #124 people are African american who does not diabetes
#                    no  yes
# African American   124   94
# Other               52   42
# White             1856  595

#Properties
prop.table(table3) # 67 % are white and no diabetes
#                         no        yes
# African American 0.04487875 0.03402099
# Other            0.01882012 0.01520087
# White            0.67173362 0.21534564

#Margins
prop.table(table3, margin = 1) #row 56% African american do not diabetes
#                        no       yes
# African American 0.5688073 0.4311927
# Other            0.5531915 0.4468085
# White            0.7572419 0.2427581

prop.table(table3, margin = 2) # column # 6% of non-diabetes are African american
#                         no        yes
# African American 0.06102362 0.12859097
# Other            0.02559055 0.05745554
# White            0.91338583 0.81395349

cor(hers_df$LDL, hers_df$BMI, use = "complete.obs") #0.06066435 No real correction

 

