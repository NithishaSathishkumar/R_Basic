getwd()

#1
sleep_df <- read.csv("msleep.csv")

#2 
barplot(table(sleep_df$vore),
        main = "Feeding behavior Frequency",
        xlab = "Eating behavior",
        ylab = "Frequency",
        horiz = TRUE,
        col = "green3"
        )

#3
boxplot(sleep_df$sleep_total,
        horizontal = TRUE)
summary(sleep_df$sleep_total)

#4
boxplot(sleep_df$sleep_total ~ sleep_df$vore)

#5 
plot(sleep_df$sleep_total, sleep_df$awake)
