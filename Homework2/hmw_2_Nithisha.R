#===============================================================================
# Homework 2 -------------------------------------------------------------------
#===============================================================================

# Nithisha Sathishkumar
# January 29
# Material Covered: Statistical Graphs, Base R and Data Cleaning

#===============================================================================
# ORGANIZING YOUR WORK  -----------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 1. Create an R Script
# Question 2. Insert Section
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Question 3. Set working directory where the wa_weather.csv is located
#-------------------------------------------------------------------------------
getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework2")

#-------------------------------------------------------------------------------
# Question 4. create new data frame for the collisions.csv
#-------------------------------------------------------------------------------
collisions_df <- read.csv("collisions.csv")

#===============================================================================
# BASE R AND DATA CLEANING  -----------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 5. Identify the variable name(s) that need changed/edited to comply 
# with these style rules, and please do the change
#-------------------------------------------------------------------------------
# ANSWER: Rule of thumb for naming the variables is they should be snake_case and clear explanation
# variable that needs to be change to snake_case is severityDesc, incDate and clear explanation is road_cond, and light_cond
names(collisions_df) <- c(
  "object_id",
  "location",
  "severity_desc",
  "collision_type",
  "person_count",
  "serious_injury",
  "fatalities",
  "inc_date",
  "weather",
  "road_condition",
  "light_condition",
  "source"
)

#-------------------------------------------------------------------------------
# Question 6. Analyze data of severity of collision
#-------------------------------------------------------------------------------
#a. Create count table and what did you learned from data
table(collisions_df$severity_desc)
#Output:                
# Fatal Collision  1 
# Fatality Collision  139 
# Injury Collision 9916 
# Property Damage Only Collision 21013 
# Serious Injury Collision 1030 
# Unknown  4103

# ANSWER: The dataset provided shows that the majority of collisions only cause 
# property damage (21,013 occurrences), implying that the majority of incidents 
# are minor and do not include injuries. Injury collisions (9,916) account for a 
# sizable part, while serious injury collisions (1,030) are less common but still 
# noteworthy. Fatal collisions are uncommon, with only one reported, although 
# fatality collisions (139) emphasize the seriousness of some accidents. 
# Furthermore, the presence of 4,103 unknown cases indicates data classification 
# gaps, which could affect analysis and decision-making.

# b. More than one value in column represents car accident where someone died
# Answer: Yes, there are 2 column, Fatal Collision and Fatality Collision that 
# represent the same thing of someone died because of car accidents

#c. Combine Fatal Collision and Fatality Collision and name it Fatal Collision
collisions_df$severity_desc[collisions_df$severity_desc == "Fatality Collision"] <- "Fatal Collision"
table(collisions_df$severity_desc) 
# Output: There was Fatal Collision of 1 and Fatality Collision of 139 and now 
# they are combine into Fatal Collision of 140

#-------------------------------------------------------------------------------
# Question 7. Analyze data of weather
#-------------------------------------------------------------------------------
# a. Create count table and what did you learned from data
table(collisions_df$weather) #Output: (Part of the table) Clear 16827
# According to the dataset, the majority of documented instances (16,827) happened 
# in clear weather, making it the most common category. A considerable number of 
# incidents are classified as "Not known" (9,551) and "Overcast" (4,738), 
# indicating uncertainty or less severe weather. Rain (4,217) and fog/smog/smoke (153) 
# occur in moderate numbers, but extreme situations such as severe crosswind (4), 
# sleet/hail/freezing rain (47), and blowing sand/dirt (1) are uncommon. The 
# "Unknown" (4) and "Other" (404) categories indicate uncertainty or missing data in the dataset.

# b. more than one value in column represents unidentified information
# Answer: Yes, there are 2 column, Unknown and Not known that represent the same 
# thing of unidentified information

#c. Combine Not known and Unknown and name it Unknown
collisions_df$weather[collisions_df$weather == "Not known"] = "Unknown"
table(collisions_df$weather) 
# Output: There was Unknown of 4 and Not Known of 9551 and now they are combine 
# into Unknown of 9555

#-------------------------------------------------------------------------------
# Question 8. Missing values are present per each column
#-------------------------------------------------------------------------------
colSums(is.na(collisions_df))
# Output: There are 9458 NA in collision_type, 2 NA in person_count, and 
# every other category are 0

#-------------------------------------------------------------------------------
# Question 9. Replace person_count with value of mean or missing value with 0 or 
# other and explain why?
#-------------------------------------------------------------------------------
collisions_df$person_count[is.na(collisions_df$person_count)] <- median(collisions_df$person_count, na.rm = TRUE)
# ANSWER: To handle the missing values in the person_count variable, I chose to 
# use the median of the available values. The median is a more robust statistic 
# than the mean since it is less impacted by outliers, ensuring that the imputed 
# number accurately represents typical collisions. I avoided using "0" because it 
# could incorrectly imply that no people were engaged in the collisions. Imputing 
# using the median preserves the dataset's integrity by delivering a realistic and
# reasonable estimate. This approach enables a fair treatment of missing data while 
# eliminating assumptions that may distort the analysis.

#===============================================================================
# STATISTICAL GRAPHS  -----------------------------------------------
#===============================================================================

#-------------------------------------------------------------------------------
# Question 10. Create an bar chart for type of collision
#-------------------------------------------------------------------------------
barplot(table(collisions_df$collision_type),
        main = "Types of Collisions and Their Frequency",
        xlab = "Collision Types",
        ylab = "Number of Collisions"
      )

# Output: Bar chart is displayed
# ANSWER: The most common type of collision is Angles, with a frequency of 
# over 5000 collisions, followed by Parked Car and Rear Ended collisions, each
# exceeding 4000 collisions. Left Turn and Other collisions have moderate 
# frequencies of around 2000-3000 collisions. Less common are Cycles, Pedestrian
# and Sideswipe collisions, each with around 1000-2000 collisions. The rarest 
# collisions are Head On and Right Turn, with fewer than 1000 collisions each.

#-------------------------------------------------------------------------------
# Question 11. Create an Mosaic plot for severity of collision and 
# reporting source
#-------------------------------------------------------------------------------
mosaicplot(table(collisions_df$severity_desc, collisions_df$source),
          main = "Collision Severity by Reporting Source",
          xlab = "Severity of the collision",
          ylab = "Source of Reporting",
          col = TRUE,
        )
# Output: Mosaic plot is displayed
# ANSWER: The largest proportion of reports across all severity levels is made 
# by police traffic compare to citizen vehicle collision report. The majority of 
# the collisions reported fall under the category of Property Damage Only Collisions,
# while Injury Collisions are significant but less frequent. Fatal Collisions and 
# Serious Injury Collisions are relatively rare.

#-------------------------------------------------------------------------------
# Question 12. Create an box plot for number of person involved in collision and 
# reporting source
#-------------------------------------------------------------------------------
boxplot(collisions_df$person_count ~ collisions_df$source,
        main = "Number of Persons Involved in Collisions by Reporting Source",
        xlab = "Reporting Source",
        ylab = "Number of Persons Involved in Collisions",
        )

# Output: Box plot is displayed
# ANSWER: Firstly, both Citizen Vehicle Collision Report and Police Traffic Collision Report
# show a similar distribution in the number of people involved in collisions. The 
# median number of persons involved is low for both categories, as indicated by the 
# central line in each box. Additionally, there are outliers present in both 
# categories, with the Police Traffic Collision Report having more outliers, some 
# of which are significantly higher. The height of the boxes, representing the 
# interquartile range, is small, suggesting that the majority of collision reports
# involve a similar number of persons. The whiskers extend to a small range, 
# indicating that most data points are close to the median with few extreme values.
# Overall, the box plot provides a clear comparison of the number of persons involved
# in collisions based on the reporting source, which can aid in identifying patterns 
# and outliers, useful for improving reporting accuracy and implementing better safety measures