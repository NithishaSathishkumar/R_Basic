# we will install the package here so you don't have to 
# re-install in every time you knit your .Rmd file
install.packages("nasaweather")


# code chunk 1
library(nasaweather)
library(tidyverse)

# code chunk 2
means <- atmos %>%
  filter(year == year) %>%
  group_by(long, lat) %>%
  summarize(temp = mean(temp, na.rm = TRUE),
            pressure = mean(pressure, na.rm = TRUE),
            ozone = mean(ozone, na.rm = TRUE),
            cloudlow = mean(cloudlow, na.rm = TRUE),
            cloudmid = mean(cloudmid, na.rm = TRUE),
            cloudhigh = mean(cloudhigh, na.rm = TRUE)) %>%
  ungroup()

# code chunk 3
ggplot(data = means, aes(x = temp, y = ozone)) + geom_point()

# code chunk 4
means$locale <- "north america"
means$locale[means$lat < 10] <- "south pacific"
means$locale[means$long > -80 & means$lat < 10] <- "south america"
means$locale[means$long > -80 & means$lat > 10] <- "north atlantic"
