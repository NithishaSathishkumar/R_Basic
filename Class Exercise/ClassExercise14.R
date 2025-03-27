library(tidyverse)
edu_df <- read.csv("GenderEduIncome.csv")

edu_df %>% ggplot(aes(x = educ, y = appxincome, color = sex)) +
  geom_boxplot()

result_aov <- edu_df %>% 
  aov(formula = appxincome ~ educ * sex, data =.)
summary(result_aov)
# Df    Sum Sq   Mean Sq F value   Pr(>F)    
# educ           2 1.930e+11 9.652e+10  54.813  < 2e-16 ***
#   sex            1 3.209e+10 3.209e+10  18.220 2.08e-05 ***
#   educ:sex       2 7.049e+09 3.525e+09   2.001    0.135    
# Residuals   1582 2.786e+12 1.761e+09                     

TukeyHSD(result_aov, conf.level = 0.95)
# Tukey multiple comparisons of means
# 95% family-wise confidence level

# Fit: aov(formula = appxincome ~ educ * sex, data = .)

# $educ
# diff       lwr         upr    p adj
# High School Grad-College          -20434.99 -26075.92 -14794.0551 0.000000
# Less High School-College          -31926.72 -42044.10 -21809.3386 0.000000
# Less High School-High School Grad -11491.73 -22254.03   -729.4354 0.033043

# $sex
# diff      lwr      upr    p adj 
# Male-Female 8992.289 4853.664 13130.91 2.15e-05

# $`educ:sex`
#                                                     diff          lwr         upr     p adj
# High School Grad:Female-College:Female          -25455.4080 -35713.03170 -15197.7843 0.0000000 (reject)
# Less High School:Female-College:Female          -28299.0812 -47101.73559  -9496.4269 0.0002683 (reject)
# College:Male-College:Female                       7321.2805    -49.29916  14691.8602 0.0527399 (fail to reject)
# High School Grad:Male-College:Female            -10030.9836 -19343.51455   -718.4526 0.0261724 (reject)
# Less High School:Male-College:Female            -28109.6873 -44439.31756 -11780.0570 0.0000148 (reject)
# Less High School:Female-High School Grad:Female  -2843.6732 -22926.03934  17238.6929 0.9986198 (fail to reject)
# College:Male-High School Grad:Female             32776.6886  22574.38179  42978.9953 0.0000000 (reject)
# High School Grad:Male-High School Grad:Female    15424.4244   3741.75131  27107.0975 0.0023607 (reject)
# Less High School:Male-High School Grad:Female    -2654.2793 -20442.43384  15133.8753 0.9982242 (fail to reject)
# College:Male-Less High School:Female             35620.3618  16847.82784  54392.8957 0.0000011 (reject)
# High School Grad:Male-Less High School:Female    18268.0976  -1348.37040  37884.5657 0.0846618 (fail to reject)
# Less High School:Male-Less High School:Female      189.3939 -23574.85253  23953.6404 1.0000000 (fail to reject)
# High School Grad:Male-College:Male              -17352.2641 -26603.82902  -8100.6993 0.0000015 (reject)
# Less High School:Male-College:Male              -35430.9678 -51725.90707 -19136.0286 0.0000000 (reject)
# Less High School:Male-High School Grad:Male     -18078.7037 -35339.14495   -818.2625 0.0338237 (reject)