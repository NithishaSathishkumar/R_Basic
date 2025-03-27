library(tidyverse)
library(patchwork)

p_a <- mpg %>% ggplot(aes(y = cty)) +
  geom_boxplot() +
  facet_wrap(~drv, nrow = 3) +
  labs(title = "City Fuel Efficiency, by drivertrain")
 
p_cty <- mpg %>% ggplot(aes(cty)) + 
  geom_histogram() +
  labs(title = "City Fuel Efficiency distribution")

p_drv <- mpg %>% ggplot(aes(drv)) + 
  geom_bar() +
  labs(title = "Drive train count")

p_a + (p_cty / p_drv)
