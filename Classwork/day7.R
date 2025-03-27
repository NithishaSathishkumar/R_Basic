getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Classwork")

# load core tidyverse packages
library(tidyverse)
# load other non-core tidyverse packages
# these aren’t the only non-core tidyverse packages
library(readxl) # reading excel spreadsheets
library(lubridate) # working with dates and datetimes
library(glue) # an alternative to paste

excel_sheets("aircraft.xlsx") # "Bombers","Fighters", Trainers","UAV_Drones","Tankers_Transporters"

aircraft_df <- read_excel("aircraft.xlsx", sheet = "Trainers", skip = 3)
view(aircraft_df)

summary(aircraft_df) #summary of the data, gallon and 
quantile(aircraft_df$FH, probs = 0.9) #90% of flying 109828.8
table(aircraft_df$MD) # which MDs are represented
range(aircraft_df$Cost, na.rm = TRUE) #range of the cost

#histogram
hist(aircraft_df$FH)
summary(aircraft_df$FH)

#boxplot
boxplot(aircraft_df$FH ~ aircraft_df$MD
        xlab = "Aircraft Model",
        ylab = "Aircraft Flying hours"
        ) #largest variance is T-6

#boxplot 
barplot(table(aircraft_df$FY)) 

#wide to long 
#gather(): Flips the row to column to columns to row
bomberWide_df <- readRDS("bomber_wide.rds")
view(bomberWide_df)

bomberWide_df <- bomberWide_df %>% gather(Year, values, 3:21) #column 3 and until row 21
view(bomberWide_df)

#Long to wide
bomberLong_df <- readRDS("bomber_long.rds")
view(bomberLong_df)

bomberLong_df <- bomberLonf_df %>% spread(Output, Value) #take the column name (output) and spread the colunn (value)
view(bomberLong_df)

#separate the objects
bomber_Sep_df <- readRDS("bomber_combined.rds")
view(bomber_Sep_df)

bomber_Sep_df <- bomber_Sep_df %>% separate(AC, c("Type", "MD"), sep =" ") #separted the AC to Type and MD
view(bomber_Sep_df)

#Unites
bomberCombine_df <- readRDS("bomber_prefix.rds")
view(bomberCombine_df)

bomberCombine_df <- bomberCombine_df %>% unite(MD, prefix, number, sep = "-") #separted the AC to Type and MD
view(bomberCombine_df) 
