### Calculate correlations between variables:
cor.test(iris$Sepal.Length, iris$Sepal.Width, method="pearson")

# Pearson's product-moment correlation

# data:  iris$Sepal.Length and iris$Sepal.Width
# t = -1.4403, df = 148, p-value = 0.1519
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.27269325  0.04351158
# sample estimates:
#        cor 
# -0.1175698 

### Now also create a scatter plot:
plot(iris$Sepal.Length, iris$Sepal.Width)

### Create an adjacency matrix and interpret the results:
cor(iris[c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")])

# Sepal.Length Sepal.Width Petal.Length Petal.Width
# Sepal.Length    1.0000000  -0.1175698    0.8717538   0.8179411
# Sepal.Width    -0.1175698   1.0000000   -0.4284401  -0.3661259
# Petal.Length    0.8717538  -0.4284401    1.0000000   0.9628654
# Petal.Width     0.8179411  -0.3661259    0.9628654   1.0000000


### Now create SPLOM graphics:
pairs(iris[c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")])
install.packages("psych")
library(psych)
pairs.panels(iris[c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")])

### rundata.csv
### Plot data and create regression line
plot(rundata$FirstRun, rundata$SecondRun)
reg1 <- lm(rundata$SecondRun~rundata$FirstRun)
abline(reg1)

### Compute the Pearson Correlation Coefficient
cor(rundata$FirstRun, rundata$SecondRun)
# [1] 0.9762012

### Check if the Correlation is significant
cor.test(rundata$FirstRun, rundata$SecondRun)

# Pearson's product-moment correlation

# data:  rundata$FirstRun and rundata$SecondRun
# t = 44.333, df = 97, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  0.9647003 0.9839856
# sample estimates:
#       cor 
# 0.9762012

### Create a Multiple Regression Model to predict the distance achieved 
### in the final run based on the previous runs
lma <- lm(rundata$FinalRun ~ FirstRun + SecondRun, data=rundata)

# summary(lma)
# 
# Call:
#   lm(formula = rundata$FinalRun ~ FirstRun + SecondRun, data = rundata)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -6.4895 -1.6483  0.1199  1.6938 10.5144 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   5.5375     1.1337   4.884 4.14e-06 ***
#   FirstRun     -0.2783     0.1427  -1.951    0.054 .  
# SecondRun     1.2866     0.1367   9.412 2.73e-15 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.92 on 96 degrees of freedom
# Multiple R-squared:  0.9261,	Adjusted R-squared:  0.9245 
# F-statistic: 601.1 on 2 and 96 DF,  p-value: < 2.2e-16


help("~") 
# Tilde is used to separate the left- 
# and right-hand sides in a model formula.


# SIMPLE REGRESSION TUTORIAL
set.seed(12345)

run2 <- rundata[ order ( runif(99)),]

lma <- lm(FinalRun ~ FirstRun + SecondRun, data=run2[c(1:80),])

testing <- run2[c(81:99),]

predictions <- predict(lma, testing)

diff <- predictions - testing$FinalRun

diff_ABS <- abs(diff)

mean(diff)
