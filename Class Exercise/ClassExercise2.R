getwd()

#1
sleep_df <- read.csv("msleep.csv")

#2
mean(sleep_df$sleep_total) #10.43373
median(sleep_df$sleep_total) #10.1
max(sleep_df$sleep_total) #19.9
min(sleep_df$sleep_total) #1.9

#3
library(moments)
skewness(sleep_df$sleep_total, na.rm = TRUE) #0.05326943
# We think it is normal distribution because it is between 0.5 and -0.5

kurtosis(sleep_df$sleep_total, na.rm = TRUE) #2.34881
#We think is a peaked (leptokurtic) distribution because it is positive value and value is greater than 2

#4
table(sleep_df$vore)
#  carni   herbi insecti    omni 
#     19      32       5      20 

#5
table1 <- table(sleep_df$vore)
prop.table(table1)
#       carni      herbi    insecti       omni 
# 0.25000000 0.42105263 0.06578947 0.26315789 

#6
table2 <- table(sleep_df$vore, sleep_df$conservation)
prop.table(table2, margin = 1) # 14% of carnivores are domesticated 




