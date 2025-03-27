# Class Exerices

#1 
height <- c(180, 155, 160, 167)
height

#2 
height <- c(height, 181)
height

#3 
mean(height)

#4
is.logical(height)

#5
height <- as.character(height)
height

#6
my_class_df <- data.frame(
  height = height,
  weight = c(65, 50, 52, 58, 70),
  name = c("jim", "charlotte", "Hamilton", "kate", "amelia")
)

#7 
dim(my_class_df) #5, 3

#8 
str(my_class_df) # height = chr, weight = num, name = chr

#9
names(my_class_df) <- c("ht", "wt", "id")
