# HER DATA
#check working directory 
getwd()

#set working directory
setwd("/Users/nithishasathishkumar/Desktop/R/Classwork")

hers_df <- read.csv("hersdata.csv")

#Categorical data visualization
#Bar plot
barplot(table(hers_df$physact), #total counts
          main = "Physical Activity Frequenices", # title of the graph
          ylab = "Physical Activity", # added label in y axis
          xlab = "Total counts", # added label in x axis
          width = c(50, 10, 20, 30, 40), # width of each bar charts based on the location
          space = 1, #space is added in between bar
          horiz = TRUE, # bar are in sleeping order
          col = "purple4" # color of the bar changes to purple
        ) 

#Mosaic plot
mosaicplot(table(hers_df$physact, hers_df$smoking),
             main = "Frequency of smoking across different physical activity",
             xlab = "Physical Activity",
             ylab = "Smoking", 
             color = TRUE, #added color to the larger to the block of the bar
           # width bar tell you the number of observation
           )

#TEST OUR SKILLS
#barplot
barplot(table(hers_df$raceth),
        main = "Number of observation fall into each race category",
        col = "red3"
        )

#mosacic plot
mosaicplot(table(hers_df$raceth, hers_df$diabetes),
           color = TRUE
           )

#Numerical data visualization
#Histogram
hist(hers_df$LDL)
#center : 130
#range 30 to 350
#outliner to the left so skew to the left side

summary(hers_df$LDL)
boxplot(hers_df$LDL, horizontal = TRUE)
#min = 36.8
# median = 141.0
# First quartiles = 119.6 
# Third quartiles = 166
# max = from the box end line

boxplot(hers_df$LDL ~ hers_df$race)

#TEST OUR SKILLS
#Histogram
hist(hers_df$weight)

#boxplot
boxplot(hers_df$weight)

#Scatter plots
plot(hers_df$weight, herdata$BMI,
     main="BMI vs Weight",
     xlab = "Weight",
     ylab = "BMI"
     )
