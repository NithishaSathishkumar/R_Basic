library(tidyverse)
names(mpg)

#Facets
# functions provide a simple way to create small multiples
# facet_wrap: primarily used to create small multiples based on a single variable
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap(~class, nrow = 2) # nrow & ncol

# facet_grid: primarily used to create a small multiples grid based on two variables
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl)

#Overplotting
# LAYERING HELPS DISPLAY PATTERNS
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

#this 
mpg %>% 
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth()

# or

#this
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(shape = drv)) +   
  geom_smooth(aes(color = drv))

# LAYERING HELPS ID ABNORMALITIES
mpg %>%
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()
# Looks like it could be the 2 seaters but we need to verify

mpg %>%
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(color = class == "2seater")) +
  geom_smooth(data = filter(mpg, class == "2seater"), se = FALSE) +
  geom_smooth(data = filter(mpg, class != "2seater"), se = FALSE)

#Superimposing
# COMBINE HISTOGRAM AND DENSITIES
ggplot(mpg) +
  aes(x = hwy, y = after_stat(density)) +
  geom_histogram() +
  geom_density()

# SUPERIMPOSE SEVERAL DENSITIES
ggplot(mpg) +
  aes(x = hwy, color = drv, fill = drv) +
  geom_density(alpha = 0.25) # add transparency

# PLOTS EXAMPLES
#BoxPlot
ggplot(mpg) +
  aes(x = drv, y = hwy, fill = drv) +
  geom_boxplot(varwidth = TRUE) +
  geom_jitter(alpha = 0.25, width = 0.2) +
  facet_wrap(~year) +
  theme(legend.position = "none") +
  scale_fill_manual(values = c("darkred", "darkgreen", "steelblue"))

#COMBINE PLOTS WITH {PATCHWORK}
p_a <- ggplot(mpg) +
  aes(x = displ, y = hwy) +
  geom_point()

p_b <- ggplot(mpg) +
  aes(x = hwy) +
  geom_histogram()

p_c <- ggplot(mpg) +
  aes(x = drv, y = hwy) +
  geom_boxplot()

library(patchwork)
p_a + p_b + p_c
p_a / p_b / p_c

# Mix them up
p_a + p_b / p_c

# MANAGING DATES
# DATE AND TIME VARIABLES
# data_df <- mpg %>% 
#   mutate(date = as.Date("2024-05-02") - 0:nrow(mpg) - 1)

#SAVE PLOT
ggplot(mpg) +
  aes(x = displ, y = hwy) +
  geom_point()
  
ggsave("plot1.pdf")

ggsave("plot.pdf", width = 12, height = 12, units = "cm", dpi = 300)
ggsave("plot1.pdf")
