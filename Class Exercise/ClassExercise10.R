library(tidyverse)
names(mpg)

mpg %>% ggplot(aes(x = class, fill = as.factor(cyl))) + 
  geom_bar(position = "fill") + 
  coord_flip() +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Car engine configuration",
    y = "Pecentage",
    x = "Type of car",
    fill = "Number of cylinders"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      size = 12
    )
  )
  
  


