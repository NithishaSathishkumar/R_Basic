library(tidyverse)
library(modelr)

# install.packages("performance")
# install.packages("see")
library(performance)
library(see)

prestige_df <- read.csv("prestige.csv")
# dependent ~ independent
model <- prestige_df %>% lm(prestige ~ education, data=.)
summary(model)

# Call:
#   lm(formula = prestige ~ education, data = .)
# 
# Residuals:
#     Min       1Q   Median       3Q      Max 
# -26.0397  -6.5228   0.6611   6.7430  18.1636 
# 
# Coefficients:
#             Estimate Std. Error t value
# (Intercept)  -10.732      3.677  -2.919
# education      5.361      0.332  16.148

#                 Pr(>|t|)    
# (Intercept)     0.00434 ** 
#   education    < 2e-16 ***

#   ---
#   Signif. codes:  
#   0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1
# ‘ ’ 1
# 
# Residual standard error: 9.103 on 100 degrees of freedom
# Multiple R-squared:  0.7228,	Adjusted R-squared:   0.72 
# F-statistic: 260.8 on 1 and 100 DF,  p-value: < 2.2e-16

# prestige = -10.7 + 5.361 * education
# education influence prestige 

# if you do not do education than your prestige -10.5
# each year your prestige with go up by 5.361 if based on number of education

# prestige is y because you are predicate that in scatter plot but in boxplot predication becomes x 
prestige_df %>% 
  add_predictions(model) %>% 
  add_residuals(model) %>% 
  ggplot(aes(x = education, y = prestige)) + 
  geom_point() +
  geom_line(aes(y = pred), color = "blue", linewidth = 1) +
  geom_segment(aes(xend = education, yend = pred)) # difference between predication & actual value called residuals

# Level of prestige for 12 years education
predict(model, 
        new = data.frame(education = 12), 
        interval = "confidence", 
        level = .95)

#        fit      lwr (x)     upr(y)
# 1 53.59855 51.62654 55.57056
# level of prestige is 53.59 for 12 years
 
# Multiple linear regression 
# Both education and income will affect prestige
model <- prestige_df %>% lm(prestige ~ education + income, data = .)
summary(model)

# Call:
#   lm(formula = prestige ~ education + income, data = .)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -19.4040  -5.3308   0.0154   4.9803  17.6889 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -6.8477787  3.2189771  -2.127   0.0359 *  
#   education    4.1374444  0.3489120  11.858  < 2e-16 ***
#   income       0.0013612  0.0002242   6.071 2.36e-08 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 7.81 on 99 degrees of freedom
# Multiple R-squared:  0.798,	Adjusted R-squared:  0.7939 
# F-statistic: 195.6 on 2 and 99 DF,  p-value: < 2.2e-16

# prestige = -6.84 + 4.137  * education + 0.0014 * income
# p value is null reject for edcuation so it has affect on prestige
# Multiple R-squared 0.798 more than 0.7 good model

check_model(model)
options(scipen = 999)

model3 <- prestige_df %>% lm(prestige ~ income + type, data=.)
summary(model3)

# Call:
#   lm(formula = prestige ~ income + type, data = .)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -20.2141  -6.7359  -0.1931   5.1725  25.0776 
# 
# Coefficients:
#   Estimate Std. Error t value             Pr(>|t|)    
# (Intercept) 27.9970569  1.8007687  15.547 < 0.0000000000000002 ***
#   income       0.0014012  0.0002434   5.757          0.000000107 ***
#   typeprof    25.0554739  2.3020118  10.884 < 0.0000000000000002 ***
#   typewc       7.1671551  2.1140475   3.390              0.00102 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 8.21 on 94 degrees of freedom
# (4 observations deleted due to missingness)
# Multiple R-squared:  0.7765,	Adjusted R-squared:  0.7693 
# F-statistic: 108.8 on 3 and 94 DF,  p-value: < 0.00000000000000022

# prestige = 27.99 + 0.0014 * income + 25.055 * typeprof + 7.167 * typewc
# typrprof = prof
# typewc = white worker 
predict(model3, 
        new = data.frame(income = 16000, type = "wc"),
        interval = "confidence", 
        level = .95)
#       fit      lwr      upr
# 1 57.58334 51.29518 63.87151
