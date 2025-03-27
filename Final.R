#1
# order_id customer_id product_id order_date order_amount product_name product_category price
    # 101         1           201   2024-01-10      250       Laptop       Electronics     1000
    # 102         2           202   2024-02-15      150       Smartphone   Electronics     500
    # 103         3           203   2024-03-15      300       Tablet       Electronics     300
    # 104         4           201   2024-04-01      400       Laptop       Electronics     1000
    # 105         5           205   2024-05-05      180       Smartwatch   Electronics     200
     
#2
    # no change
    
    # product_name
    # laptop
    # laptop
    # smartphone
    # laptop
    # tablet
    
    # is_laptop
    # TRUE
    # TRUE
    # FALSE
    # TRUE
    # FALSE
    
    # year
    # 2022
    # 2022
    # 2022
    # 2023
    # 2023
    
    # 2022 (3 + 5) * 1 = 8
    # 2023 8 * 1 = 8
    
#3
    car_df %>% ggplot(aes (x = manufacturer, fill = as.factor(year))) +
      geom_bar(position = "stack") +
      labs(
        title = "Car Data from 1999 & 2008",
        x = "Car Manufacturer",
        y = "Number of Cars",
        fill = "Manufacturing Year"
      ) +
      theme(
        plot.title = element_text(
          hjust = 0.5,
          size = 12,
          color = "red",
        ),
      )
    
#4
    car_df %>% ggplot(aes(x = manfacturer)) +
      geom_bar() +
      facet_wrap(~year, nrow = 2) +
      labs(
        title = "Car Data Counts by Manufacturer and Year",
        x = "Car Manfacturer",
        y = "Number of Cars"
      ) +
      theme(
        axis.text.x = element_text(
          angle = 60,
          hjust = 1
        )
      )
    
#5
    sales_df %>% 
      mutate(spending_category = case_when(
        total_spent < 40 ~ "Low spenders",
        total_spent >= 40 & total_spent < 80 ~ "Medium spenders",
        total_spent >= 80 ~ "High spenders"
      )) %>%
      group(spending_category) %>%
      summaries(total_sales = sum(total_spent))
    
#6
    # creating a function called total_cost with unit_prices & quantites parameter
    # if unitprices or quantites is not numeric 
    # then stop the executes of the function with error message with class of the untiesPices and quntires
    # sum of unit_prices * quanites and store it in total
    # then round the total to 2 decimal
    
    # 5.99 * 2 + 10.50 * 3 = 43.48
      