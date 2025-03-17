cor.test(iris$Sepal.Length, iris$Sepal.Width, method="pearson")

cor(iris[c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")])

pairs(iris[c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")])


install.packages("psych")
library(psych)
pairs.panels(iris[c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")])

plot(rundata$FirstRun, rundata$SecondRun)

plot(rundata$FirstRun, rundata$SecondRun)
reg1 <- lm( rundata$SecondRun ~rundata$FirstRun)
abline(reg1)

cor(rundata$FirstRun, rundata$SecondRun)

cor.test(rundata$FirstRun, rundata$SecondRun)

lma <- lm(rundata$FinalRun ~ FirstRun + SecondRun, data=rundata)
summary(lma)
# help("~") - tilde is used to separate the left- and right-hand sides in a model formula.

lma <- lm(FinalRun ~ FirstRun + SecondRun, data=rundata)
newdata <- data.frame(FirstRun=22, SecondRun=25)
predict(lma, newdata)
#       1
#31.57917


# Important to randomly reorder dataset to avoid order bias.
set.seed(12345)
run2 <- rundata[ order( runif(99) ) , ]
lma <- lm(FinalRun ~ FirstRun + SecondRun, data=run2[c(1:80),])
testing <- run2[c(81:99), ]
predictions <- predict(lma, testing)

diff <- predictions - testing$FinalRun
diff_ABS <- abs(diff)
mean(diff)
#[1] -0.05874524
hist(diff_ABS)
boxplot(diff_ABS)


length( diff[diff> 0] )

length( diff_ABS[diff_ABS<=2] )

testing$prediction <- predictions

testing$difference <- diff_ABS


rundata$superrun = ifelse(rundata$FinalRun >= 45, 1, 0)
logitModel <- glm(superrun ~ FirstRun + SecondRun, data=rundata,
                  family=binomial(link="logit"))
summary(logitModel)


exp(coef(logitModel))
exp(cbind(OR = coef(logitModel), confint(logitModel)))

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthstimeseries <-ts(births, frequency=12, start=c(1946,1))
plot.ts(birthstimeseries)
abline(reg=lm(birthstimeseries~time(birthstimeseries)))

library("TTR")
birthstimeseries <- SMA(birthstimeseries, n=15)
plot.ts(birthstimeseries)

birthstimeseriescomponents <- decompose(birthstimeseries)
plot(birthstimeseriescomponents)

birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriesseasonallyadjusted<-birthstimeseries
birthstimeseriescomponents$random
plot.ts(birthstimeseriesseasonallyadjusted)

birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriesseasonallyadjusted <- birthstimeseries
birthstimeseriescomponents$seasonal
plot.ts(birthstimeseriesseasonallyadjusted)

plot(birthstimeseries[2:168], birthstimeseries[1:167])
cor(birthstimeseries[2:168], birthstimeseries[1:167])

acf(birthstimeseries, lag.max=24)

pacf(birthstimeseries, lag.max=24)

library("tseries")
x <- rnorm(1000)
adf.test(x)
adf.test(birthstimeseries)

plot.ts(diff(birthstimeseries))

library(forecast)
modelfit <- auto.arima(AirPassengers)
forecasts <- forecast( modelfit, h=50 )
plot( forecasts )

checkresiduals(modelfit)

accuracy(forecasts)


library(forecast)
#9 years of training data
AirPassengersTrain <- ts(AirPassengers[1:108], frequency=12, start=c(1949,1))
#3 years of testing data
AirPassengersTest <- ts(AirPassengers[109:144], frequency=12, start=c(1958,1))
modelfit <- auto.arima(AirPassengersTrain)
forecasts <- forecast( modelfit, h=36 )
accuracy(f = forecasts, x = AirPassengersTest)

mean( abs( AirPassengersTest - forecasts$mean ) )

plot( AirPassengersTest, col="red", ylab="values")
lines(forecasts$mean, col="blue")

simulatedTS <- arima.sim(model=list(order=c(0,0,1), ma=0.9), n=100)
plot(simulatedTS)


tmp <- vector(length=a)
for(i in 1: a){
  numberOfUsers <- test$user_tenures[test$user_tenures > i]
  tmp[i] <- length(numberOfUsers)
}
plot(tmp, type = 'l', main="User retention curve",
     ylab="Number of users", xlab="Number of days")


install.packages("survival")
library("survival")
survfit( Surv(pbc$time, pbc$status == 2)~1 )
plot( survfit( Surv(pbc$time, pbc$status == 2) ~1) )

install.packages("gmodels")
install.packages("class")
set.seed(1)
IrisData <- Iris[ sample(nrow(Iris), replace = FALSE), c(2,3,4,5,6)]
IrisData$Species <- factor(IrisData$Species)
table(IrisData$Species)
prop.table(table(IrisData$Species))

IrisData$SepalLengthCm <- scale(IrisData$SepalLengthCm)
IrisData$SepalWidthCm <- scale(IrisData$SepalWidthCm)
IrisData$PetalLengthCm <- scale(IrisData$PetalLengthCm)
IrisData$PetalWidthCm <- scale(IrisData$PetalWidthCm)

round(mean(IrisData$SepalLengthCm))
round(sd(IrisData$SepalLengthCm))

normalisation <- function(x) {
  normalise <- (x - min(x)) / (max(x) - min(x))
  return(normalise)
}

normalisation(c(1,2,3,4,5))

trainingData <- IrisData[c(1:100),c(1,2,3,4)]
testData <- IrisData[c(101:150),c(1,2,3,4)]
# This train/test split is 2/3 (two thirds, 66.66%) for training and 1/3 (one third, 33.33%) for testing.
library(class)
knnModelAndPredictedLabels <- knn(train = trainingData, test = testData, cl = trainingLabels, k=3)
library(gmodels)
CrossTable(x = testingLabels, y = knnModelAndPredictedLabels, prop.chisq=FALSE)


# Load the iris dataset (if not already loaded)
data(iris)

# Split data into training and test sets
trainingData <- iris[1:100, 1:4]  # First 100 rows, features only
testData <- iris[101:150, 1:4]    # Last 50 rows, features only

# Extract labels
trainingLabels <- iris[1:100, 5]  # Species column for training
testingLabels <- iris[101:150, 5] # Species column for testing

# Load required libraries
library(class)
library(gmodels)

# Run KNN model with k=3
knnModelAndPredictedLabels <- knn(train = trainingData,
                                  test = testData,
                                  cl = trainingLabels,
                                  k = 3)

# Create a cross-tabulation of predicted vs actual
CrossTable(x = testingLabels,
           y = knnModelAndPredictedLabels,
           prop.chisq = FALSE)

# Create a simple confusion matrix without chi-square testing
table(Actual = testingLabels, Predicted = knnModelAndPredictedLabels)

# Or use the caret package for a more detailed confusion matrix
library(caret)
confusionMatrix(data = knnModelAndPredictedLabels, reference = testingLabels)

set.seed(1)
DataDF <- data[ sample(nrow(data), replace = FALSE),c(2:32)]
DataDF$diagnosis <- factor(DataDF$diagnosis)
table(DataDF$diagnosis)
trainingDataDT <- DataDF[c(1:500),]
testDataDT <- DataDF[c(501:569),]
install.packages("C50")
library(C50)
decisionTree <- C5.0(diagnosis ~., data=trainingDataDT)
summary(decisionTree)

decisionTreePredictions <- predict(decisionTree, testDataDT)
table(decisionTreePredictions, testDataDT$diagnosis)

# or:

CrossTable(x = decisionTreePredictions, y = testDataDT$diagnosis, prop.chisq=FALSE)

library(smotefamily)
dataSet = sample_generator(1000, ratio = 0.70)
table(dataSet$result)

generateData = SMOTE(dataSet[,c(1,2)], dataSet[,c(3)], K=5)
newDataSet <- generateData$data
table(newDataSet$class)

