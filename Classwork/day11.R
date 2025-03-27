library(tidyverse)
names(mpg)

# Create histogram that illustrates distribution of the cty variable
ggplot(data = mpg, aes(x = cty)) + 
  geom_histogram()

# Create barplot & flip coordinates
ggplot(data = mpg, aes(x = manufacturer)) + 
  geom_bar() + 
  coord_flip()

# Create scatter plot
ggplot(data = mpg, aes(x = cty, y = displ, color = class)) +
  geom_point()

mpg

# Categorical & continuous
# Categorical: Data falls into a limited number of possible values. year, cyl, manufacture
# continuous: cty, displ

# Create Scatter plot with color, size, shape
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "blue", size = 2, shape = "square")
# shape = different number, and define what shape

# ----------3 data------------------ 
# Create Scatter plot with color, size, shape for continuous
ggplot(data = mpg, aes(x = displ, y = hwy, color = cty , size = cty)) +
  geom_point()

#continous: shape will not work because there are not much of shape in ggplot

# Create Scatter plot with color, size, shape for Categorical
ggplot(data = mpg, aes(x = displ, y = cty, color = drv , size = drv, shape = drv)) +
  geom_point()

# Non mapping aesthetics
ggplot(data = mpg, aes(x = displ, y = cty)) +
  geom_point(color = "red", fill = "green", size = 5, stroke = 2, shape = 21)

ggplot(data = mpg, aes(x = displ, y = cty, color = displ < 5)) +
  geom_point()

# customize your plot
mpg %>% 
  ggplot(aes(x = manufacturer, fill = as.factor(year))) + 
  geom_bar(position = "stack") +
  labs(
    title = "Car data from 1999 and 2008",
    x = "Car manfacturer",
    y = "Number of cars",
    fill = "Manfacturing year"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5, #center
      size = 12, 
      color = "red",
      face = "bold" # bold title
    ),
      axis.text.x = element_text(
        angle = 60, 
        hjust = 1 #center the label
      )
  ) 
  
  


