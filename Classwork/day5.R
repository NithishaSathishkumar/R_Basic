#Base R and data Cleaning 
#check working directory 
getwd()

#set working directory
setwd("/Users/nithishasathishkumar/Desktop/R/Classwork")

deck_df <- read.csv("deck.csv")
deck_df

#Selecting values from DF
deck_df$new <- 1:52 #add new column named new with 1 to 52 numbers
deck_df

head(deck_df, 3) # give the first 3 data 

deck_df$new <- NULL #remove the new column
deck_df 

deck_df[c(13, 26, 39, 52),] # print the whole array of the specific value

deck_df[c(13, 26, 39, 52), 3] # print column 3 of the array value

deck_df$value[c(13, 26, 39, 52)] # print the column value result 

#Logical Sub-setting
# How many ace?
deck_df[deck_df$face == "ace", ]

deck_df$face == "ace"
sum(deck_df$face == "ace") #4
mean(deck_df$face == "ace") #0.07692308

#value of ace cards
deck_df$value[deck_df$face == "ace"]

#change the ace value of 14
deck_df[deck_df$face == "ace", ][3] <- 14
deck_df$value[deck_df$face == "ace"] <- 14

#face of queen 
deck_df[deck_df$face == "queen", ]
#     face     suit value
# 2  queen   spades    12
# 15 queen    clubs    12
# 28 queen diamonds    12
# 41 queen   hearts    12

#queen and spades
deck_df[deck_df$face == "queen" & deck_df$suit == "spades", ]

#table value of suit
table(deck_df$suit) #there are two clubs and cubs

#combine the clubs and cubs
deck_df$suit[deck_df$suit == "cubs"] <- "clubs"
table(deck_df$suit) 

#Missing Values
# total number of missing values
sum(is.na(deck_df))
colSums(is.na(deck_df)) #specific colSums

#remove all the value NA and create new table
deck2_df <- na.omit(deck_df)
deck2_df

deck_df$suit[is.na(deck_df$suit)] <- "unknown"

deck_df$value[is.na(deck_df$value)] <- mean(deck_df$value, na.rm = TRUE)
table(deck_df$value)
