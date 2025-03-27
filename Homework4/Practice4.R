getwd()
setwd("/Users/nithishasathishkumar/Desktop/R/Homework4")

library(tidyverse)
library(lubridate)
library(stringr)
library(patchwork)
library(nycflights13)

book <- read.csv("book_info.csv")
amazon <- read.csv("amazon_info.csv")

#3
kindle_df <- book %>% inner_join(amazon, by=c("product_id" = "asin"))

#4
kindle_df <- kindle_df %>% 
  mutate(category_name = str_replace(category_name, "Science Fiction", "Sci-Fi"))

#5
total_book <- kindle_df %>% summarise(total_book = n())

kindle_df %>% 
  filter(str_detect(category_name, "Mystery")) %>%
  summarise(total_Mystey_books = n() / total_book)

#6
kindle_df %>% 
  filter(str_detect(category_name, "Money"), is_editors_pick == TRUE) %>%
  arrange(desc(stars)) %>%
  select(title, stars) %>% 
  head(4)

#7
kindle_df %>% 
  mutate(title_lower = str_to_lower(title), food_count = str_count(title_lower,"food")) %>%
  slice_max(food_count, n = 1)

#8
mpg <- mpg
mpg %>% 
  ggplot(aes(x = manufacturer, fill = as.factor(year))) +
  geom_bar(position = "stack") +
  labs(
    title = "Car data from 1999 and 2008",
    x = "Car Manufacturer",
    y = "Number of cars",
    fill = "Manufacturer"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      color = "red",
      size = 12
    ),
    legend.position = "bottom",
    axis.text.x = element_text(
      angle = 60,
      hjust = 1
    )
  )

#9
p_a <- mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar() +
  facet_grid(year ~ drv) +
  labs(
    title = "Manufacture count by year and drv"
  )

p_b <- mpg %>% 
  ggplot(aes(x = year)) +
  geom_bar() +
  labs(
    title = "Counts by year"
  )

p_c <- mpg %>% 
  ggplot(aes(x = drv)) +
  geom_bar() +
  labs(
    title = "Car drive trains"
  )

p_a / (p_b + p_c)

#10
car_df %>% ggplot(aes(x = manufacturer, fill = as.factor(year))) +
  geom_bar(position = "stack") +
  labs(
    title = "Car Data from 1999 and 2008",
    x = "Car Manufacturer",
    y = "Number of Cars",
    fill = "Manufacturing Year"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      size = 12,
      color = "red"
    )
  )

#11
car_df %>% 
  ggplot(aes(x = Manufacturer)) +
  geom_bar() +
  facet_wrap(~year, nrow = 2) +
  labs(
    title = "Car Data Counts by Manufacturer and Year",
    y = "Number of Cars",
    x = "Car Manufacturer"
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60,
      hjust = 1
    )
  )

#12
sales_df %>% 
  mutate(spending_category = case_when(
    total_spent < 40 ~ "Low Spenders",
    total_spent >= 40 & total_spent < 80 ~ "Medium Spenders",
    total_spent >= 80 ~ "High Spenders"
  )
) %>%
  group_by(spending_category) %>%
  summarise(total_sales = sum(total_spent))

#13
# Based on the CustomerSatisfaction's pvalue = 0.04, 
# We would reject the null hypothesis which states that 
# the CustomerSatisfaction does not affect PurchaseFrequecy. 
# This shows that purchase frequency is significantly different between at least one of 
# customer satisfaction levels

#14
# I choose ElectronicsHigh - ClothingHigh that has 0.001 Pvalue which is less than 0.05 which we reject the null hypothesis,
# which states that there is a different of 1.20, there is a significant different in 

#15
mod <- lm(Salary ~ YearsExperience + DepartmentEngineering, data =.)
summary(mod)

#16
ev_df <- read.csv("ev-WA.csv")

ev_df %>% ggplot(aes(x = county)) +
  geom_bar() +
  labs(
    title = "Number of Electric Vehicles by County",
    x = "County",
    y = "Count of Electric Vehicles"
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60,
      hjust = 1
    ),
    plot.title = element_text(
      hjust = 0.5
    )
  ) +
  scale_y_continuous(labels = scales::comma)

#17
ev_df %>% ggplot(aes(x = ev_type, y = electric_range)) +
  geom_boxplot() +
  labs(
    title = "Electric Range by Vehical Type",
    x = "Electric Vehicle Type",
    y = "Electric Range (miles)"
  )

#18
ev_df %>% ggplot(aes(x = electric_range, y = average_MSRP, color = ev_type)) +
  geom_point() +
  labs(
    title = "Electric Range vs Average MSRP, by Vehicle Type",
    x = "Electri Range (miles)",
    y = "Average MSRP ($)",
    fill = "Vehicle Type"
  ) +
  scale_y_continuous(labels= scales::comma) +
  theme(
    legend.position = "bottom"
  )

#19
ev_df %>% filter(ev_type == "Battery Electric Vehicle (BEV)") %>%
  ggplot(aes(x = electric_range, y = average_MSRP)) +
  geom_point() +
  geom_smooth() +
  labs(
    title = "electric_range and average_MSRP based on BEV",
    x = "Electric Range (miles)",
    y = "Average MSRP ($)"
  )

#20
price_category <- function(MSRP){
  if(!is.numeric(MSRP)){
    stop("This function only works for numeric inputs! You have provided an object of the following class ", class(MSRP))
  }
  if(MSRP < 30000){
    "Affordable"
  }else if(MSRP >= 30000 && MSRP <= 60000){
    "Mid-Range"
  }else{
    "Luxury"
  }
}

price_category("MSRP")

#21
ev_df <- ev_df %>% mutate(
  range_category = case_when(electric_range < 100 ~ "Low Range",
                             electric_range <= 250 ~ "Medium Range", 
                             .default = "High Range")
)

#22
flights_df <- flights
airlines_df <- airlines
flights_df %>% left_join(airlines_df, by="carrier") %>%
  filter(name == "Virgin America") %>%
  group_by(time_hour) %>%
  summarise(mean_depDelay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(mean_depDelay)) %>%
  head(10)

