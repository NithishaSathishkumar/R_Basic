# Student's test 
library(tidyverse)
diet_df <- read.csv("diet.csv")
diet_df <- diet_df %>% mutate(weight_loss = initial.weight - final.weight)

#One sample T-test
# ~5 pound in 6 weeks
# loss of 5 pound statistically different

diet_df %>% summarise(avg = mean(weight_loss, na.rm = TRUE))

diet_df %>% ggplot(aes(y = weight_loss)) +
  geom_boxplot()

# Hypothesis testing:
diet_df %>% 
  select(weight_loss) %>%
  t.test(mu = 5) # 5 pound

# One Sample t-test
# data:  .
# t = -3.6667, df = 75, p-value = 0.0004564 (reject)
# alternative hypothesis: true mean is not equal to 5
# 95 percent confidence interval:
#   3.373452 4.518653
# sample estimates:
#   mean of x 
# 3.946053 

# Interpretation of the Output:
# Null Hypothesis (H₀): The true mean weight loss is 5 pounds.
# Alternative Hypothesis (H₁): The true mean weight loss is not equal to 5 pounds (two-tailed test).
# Test Statistic (t): -3.6667 → This indicates how many standard errors the sample mean (3.946053) is away from the hypothesized mean (5).
# Degrees of Freedom (df): 75 → Since it's a one-sample t-test, df = (n - 1), meaning the sample size is 76.
# p-value: 0.0004564 → This is much smaller than a common significance level (e.g., 0.05), meaning we reject the null hypothesis.
# 95% Confidence Interval: (3.373, 4.519) → This range does not include 5, reinforcing that the true mean is significantly different from 5 pounds.
# Sample Mean: 3.946053 → The observed mean weight loss in the dataset.
# 
# Conclusion:
# Since the p-value is very small (< 0.05), we reject the null hypothesis 
# and conclude that the true mean weight loss is significantly different 
# from 5 pounds. Based on the confidence interval and mean estimate, 
# the actual average weight loss appears to be lower than 5 pounds.

# Two sides T-test
# difference between avg weight loss across gender
diet_df %>% ggplot(aes(x = gender, y = weight_loss)) +
  geom_boxplot()

diet_df %>% 
  t.test(weight_loss ~ gender, data =.)

# Welch Two Sample t-test
# data:  weight_loss by gender
# t = -0.2091, df = 68.809, p-value = 0.835 (fail to reject)
# alternative hypothesis: true difference in means between group Female and group Male is not equal to 0
# 95 percent confidence interval:
#   -1.287385  1.043128
# sample estimates:
#   mean in group Female   mean in group Male 
# 3.893023             4.015152 

#ANOVA
diet_df %>% ggplot(aes(x = diet.type, y = weight_loss)) +
  geom_boxplot()

result_aov <- diet_df%>% 
  aov(formula = weight_loss ~ diet.type, data =.)
summary(result_aov)

# Df Sum Sq Mean Sq F value Pr(>F)   
# diet.type    2   60.5  30.264   5.383 0.0066 **
#   Residuals   73  410.4   5.622                  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Reject

TukeyHSD(result_aov, conf.level = .95) #0.05
#         diff        lwr      upr     p adj
# B-A -0.032000 -1.6530850 1.589085 0.9987711 (fail to reject)
# C-A  1.848148  0.2567422 3.439554 0.0188047 (reject)
# C-B  1.880148  0.3056826 3.454614 0.0152020 (reject)

#Two way Anova
diet_df %>% ggplot(aes(x = diet.type, y = weight_loss, fill = gender)) +
  geom_boxplot()

result_mod <- diet_df %>% aov(weight_loss ~ diet.type * gender, data =.)
summary(result_mod)

# Df Sum Sq Mean Sq F value  Pr(>F)   
# diet.type         2   60.5  30.264   5.629 0.00541 **
#   gender            1    0.2   0.169   0.031 0.85991   
# diet.type:gender  2   33.9  16.952   3.153 0.04884 * 
#   Residuals        70  376.3   5.376                   
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

TukeyHSD(result_mod, conf.level = 0.95)
#  Tukey multiple comparisons of means
#     95% family-wise confidence level
# 
# Fit: aov(formula = weight_loss ~ diet.type * gender, data = .)
# 
# $diet.type
#          diff        lwr      upr     p adj
# B-A -0.032000 -1.6186577 1.554658 0.9987150
# C-A  1.848148  0.2905393 3.405757 0.0160200
# C-B  1.880148  0.3391199 3.421176 0.0128543
# 
# $gender
#                   diff        lwr     upr     p adj
# Male-Female 0.09502529 -0.9751891 1.16524 0.8599508
# 
# $`diet.type:gender`
#                         diff        lwr       upr     p adj
# B:Female-A:Female -0.4428571 -3.0107291 2.1250148 0.9958151 (fail to reject)
# C:Female-A:Female  2.8300000  0.3052886 5.3547114 0.0191170 (reject)
# A:Male-A:Female    0.6000000 -2.2129628 3.4129628 0.9887997 (fail to reject)
# B:Male-A:Female    1.0590909 -1.6782698 3.7964516 0.8656520 (fail to reject)
# C:Male-A:Female    1.1833333 -1.4893925 3.8560592 0.7855223 (fail to reject)
# C:Female-B:Female  3.2728571  0.7481458 5.7975685 0.0040103 (reject)
# A:Male-B:Female    1.0428571 -1.7701056 3.8558199 0.8852416 (fail to reject)
# B:Male-B:Female    1.5019481 -1.2354126 4.2393087 0.5963201 (fail to reject)
# C:Male-B:Female    1.6261905 -1.0465354 4.2989163 0.4833188 (fail to reject)
# A:Male-C:Female   -2.2300000 -5.0036187 0.5436187 0.1863470 (fail to reject)
# B:Male-C:Female   -1.7709091 -4.4678230 0.9260048 0.3965102 (fail to reject)
# C:Male-C:Female   -1.6466667 -4.2779524 0.9846191 0.4513580 (fail to reject)
# B:Male-A:Male      0.4590909 -2.5093998 3.4275816 0.9975014 (fail to reject)
# C:Male-A:Male      0.5833333 -2.3256625 3.4923292 0.9915569 (fail to reject)
# C:Male-B:Male      0.1242424 -2.7117126 2.9601974 0.9999949 (fail to reject)


#reject: there is different 
# fail to reject: there is no different 