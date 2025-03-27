#Tip about graph
# Categorical data visualization
# Barplots (Bar Chart): visualize categorical variables (Count of customers/frequencies)
# Mosaic plot: visualize a contingency table of two qualitative variables

# Numerical Data Visualization
# Histograms: showing the distribution of a numerical variable
# Boxplot: distributed, including the median, quartiles, minimum, maximum, and any outliers
    #https://www.simplypsychology.org/boxplots.html
# Scatter plots: check whether there is a potential link between two quantitative variables
# Line plot: time series or finance
# Correlogram: allows to analyse the relationship between each pair of numeric variables of a dataset

# Visualization
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/pre_class")

supermarket <- read.csv("Supermarket Transactions.csv")

# Categorical data visualization
#Barplots (bar charts) are most often used to visualize categorical variable
# the count of customers by location and a name to the x-axis label and to the y-axis label
barplot(
        table(supermarket$State.or.Province),
        xlab = "State or Province",
        ylab = "count"
       )

#draw a barplot of the proportions instead of the frequencies by adding prop.table()
barplot(prop.table(table(supermarket$State.or.Provinc)))

# Mosaic Plot
# A mosaic plot allows to visualize a contingency table of two qualitative variables
# the proportion of male and female between the three countries
mosaicplot(table(supermarket$Country, supermarket$Gender),
           color = TRUE,
           main = "Proportion of gender by country",
           xlab = "Country",
           ylab = "Gender" # label for y-axis
)

# Numerical Data Visualization
salaries <- read.csv("Baseball Salaries 2011.csv")

# Histograms and boxplots are the most fundamental ways to visualize numerical data
hist(salaries$Salary)

#A boxplot graphically represents the distribution of a quantitative variable by visually displaying five common location summary (minimum, median, first/third quartiles and maximum)
boxplot(salaries$Salary)

# you can use a log scale to spread out the data, and horizontal display
boxplot(salaries$Salary, horizontal = TRUE, log = "x")

boxplot(salaries$Salary ~ salaries$Position)
options(scipen = 999)
# get rid of scientific notation
boxplot(salaries$Salary ~ salaries$Position, las = 3,
        main = "MLB Salaries by Position",
        xlab = "",
        ylab = "")
# las = 3 make all labels vertical
# ann, choose whether or not axis should be annotated

#Scatter Plots
#Scatterplots allow to check whether there is a potential link between two quantitative variables. 
# we will use the mtcars dataset available in R to assess the relation between the weight of the car and fuel efficiency (miles per gallon)
plot(x = mtcars$wt, y = mtcars$mpg)
plot(x = mtcars$wt, y = mtcars$mpg,
     main = "Fuel Efficiency vs. Car Weight",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles/(US) gallon"
)

#Line Plot
plot(x = mtcars$wt, y = mtcars$mpg, type = "l")
plot(x = mtcars$wt, type = "l")

#Correlogram
#install.packages("corrplot")
library(corrplot) # load it in your library so we can use it
M <- cor(mtcars)
corrplot(M, method = "circle")
corrplot(M, type = "upper", method = "circle", order = "alphabet")
corrplot.mixed(M)

#Lares Package
install.packages("lares")
library(lares)
corr_cross(mtcars, # name of dataset
           max_pvalue = 0.05, # display only significant correlations (at 5% level)
           top = 10 # display top 10 couples of variables (by correlation coefficient)
)
corr_var(mtcars, # name of dataset
         mpg, # name of variable to focus on
         top = 5 # display top 5 correlations
)
