library(tidyverse)
options(scipen = 999)

#1
pokemon_df <- read.csv("pokemon.csv")

#2
modelx <- pokemon_df %>% 
  lm(combat_power ~ attack + defense + type1, data =.)

summary(modelx)

#3 
# combat_power = 121.7106 + 2.3275 * attack + 1.1590 * defense + 103.4783 * type1Electric
# player will start with 121.7106, for each attack will increase 1.1590 for combat_power, 
# for each defense will increase 1.1590 for combat_power and for each type1Electric will increase 103.47 for combat_power

#4
predict(modelx,
        new = data.frame(type1 = "Psychic", attack = 40, defense = 65),
        interval = "confidence",
        level = .95
        )
# fit      lwr      upr
# 1 431.9768 389.0602 474.8935