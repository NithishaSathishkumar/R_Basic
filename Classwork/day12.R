library(tidyverse)
mpg

#scatter plot of displ vs cty facetted by year 
mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  facet_wrap(~year, nrow = 2)

#scatter plot of displ vs cty facetted by year & cyl
# separate based on year and then cyl
mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  facet_wrap(year ~ cyl)

#scatter plot of displ vs cty facet_grid(cyl ~ year)
# year is row and cty is column 
mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  facet_grid(year ~ cyl)

#scatter plot of displ vs cty facet_grid(~ year + cyl)
# became one column of year and cyl
mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  facet_grid(~year + cyl)

#scatter plot of displ vs cty facet_grid(~ year + cyl) add scales and space
# scales more presize scale for each graph
# space more obeservation more space less observation less space
mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  facet_grid(cyl ~ year, scales="free", space = "free")

# Overplotting 
# boxplot of hwy by class add geom_jitter and width = 0.2 and alpha 0.5
mpg %>%
  ggplot(aes(x = hwy, y = class)) +
  geom_boxplot() +
  geom_jitter(width = 0.2, alpha = 0.5) # add scatter points, width added white noise to the point and alpha added transparency to point

# Scatter plot of displ by cty add geom_smooth
mpg %>%
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth() # add prediction line, 95% interval is the shade gray 

#remove geom_point: just the prediction line without no point
mpg %>%
  ggplot(aes(x = displ, y = cty)) +
  geom_smooth() 

# add geom_rug
mpg %>%
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth() + # add prediction line
  geom_rug() # added index lines 

library(patchwork)
p_a <- mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar() +
  facet_grid(year ~ drv) +
  labs(
    title = "Manufacture count by year and drv"
  )

p_b <- mpg %>%
  ggplot(aes(x = factor(year)) )+
  geom_bar() + 
  labs(
    title = "Count by year"
  )

p_c <- mpg %>%
  ggplot(aes(x = drv)) +
  geom_bar() + 
  labs(
    title = "Count by drive type"
  )

p_a / (p_b + p_c)
