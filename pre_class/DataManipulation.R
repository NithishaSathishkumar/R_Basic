# tibbles
library(tidyverse)
install.packages("nycflights13")
library(nycflights13)

# filter(): pick observation based on values
filter(flights, month == 1) #Subset the data for January flights
filter(flights, month == 1, day == 2) #Subset the data for January 2nd flights
filter(flights, month == 1, day == 2, dep_delay > 0) #Subset the data for delayed January 2nd flights

#save new data frame after filter
dec25 <- filter(flights, month == 12, day == 25)
view(dec25)

#logical tests
12 == 12 #TRUE
12 <= c(12, 11) #TRUE FALSE
12 %in% c(12, 11, 8) #TRUE %in% Group membership
12 %in% c(11, 11, 8) #FALSE if the number does not exist
x <- c(12, NA, 11, NA, 8)
is.na(x) # FALSE TRUE FALSE TRUE FALSE

#Comparison
filter(flights, month == 12) # month 12's
filter(flights, month != 12) # nothing month but 12
filter(flights, month %in% c(11, 12)) # month column contains either 11 or 12 
filter(flights, arr_delay <= 120)
filter(flights, !(arr_delay <= 120))
filter(flights, is.na(tailnum)) #tailnum is NA

# Multiple Logical tests
12 == 12 & 12 < 14 # TRUE
12 == 12 & 12 < 10 # FALSE
12 == 12 | 12 < 10 # TRUE
any(12 == 12, 12 < 10) # TRUE (any true)
all(12 == 12, 12 < 10) # FALSE (all true)

#Multiple comparisons
# Using comma is same as using & 
filter(flights, month == 12, day == 25)
filter(flights, month == 12 & day == 25)

#Use %in% as a shortcut for |
filter(flights, month == 11 | month == 12)
filter(flights, month %in% c(11, 12))

#Are these the same???? YES because the first one has ! (not)
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

#arrange
arrange(flights, dep_delay) # ascending 
arrange(flights, desc(dep_delay)) #descending
# the primary sorting column (ascending by default), secondary sorting column, 
# If two flights have the same dep_delay, they will be sorted by arr_delay
arrange(flights, dep_delay, arr_delay) 
# missing values are always sorted at the end
df <- data.frame(x = c(5, 2, 5, NA))
arrange(df, x)
arrange(df, desc(x))

#select
#same
select(flights, year, month, day)
select(flights, year:day)

#deselect
select(flights, -(year:day))

#select functions
# - = Select everything but
# : = Select range
# contains()  = Select columns whose name contains a character string
# ends_with() = Select columns whose name ends with a string
# everything() = Select every column
# matches() = Select columns whose name matches a regular expression
# num_range() = Select columns named x1, x2, x3, x4, x5
# all_of() = Select columns whose names are in a group of names
# starts_with() = Select columns whose name starts with a character string

select(flights, ends_with("time"))
select(flights, c(carrier, ends_with("time"), contains("delay")))

#Variable Placement
# just want to change the order of variables
select(flights, time_hour, air_time, everything())

#renaming variables
rename(flights, BOTHELL = dep_delay)

#Mutate = create new variables with functions of existing variables
flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60
)

# If you only want to keep the new variables use transmute()
transmute(flights,
         gain = arr_delay - dep_delay,
         hours = air_time / 60,
         gain_per_hour = gain / hours
)

#summarise Collapse many values down to a single summary statistic
summarise(flights, dep_delay_mean = mean(dep_delay, na.rm = TRUE))
