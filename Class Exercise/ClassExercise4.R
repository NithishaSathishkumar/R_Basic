getwd()

#1
customer_df <- read.csv("customer.csv")

#2
table(customer_df$payment_method) #  Mailed check     MAILED CHECK
customer_df$payment_method[customer_df$payment_method == "MAILED CHECK"] <- "Mailed check"
table(customer_df$payment_method)

#3
sum(customer_df$payment_method == "Mailed check" & customer_df$new_customer == "yes")

#4
customer_df$monthly_charges[customer_df$monthly_charges < 0]  <- 0

#5
colSums(is.na(customer_df))

#6
customer_df$monthly_charges[is.na(customer_df$monthly_charges)] <- mean(customer_df$monthly_charges, na.rm = TRUE)
