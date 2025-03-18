### Try ARIMA modelling using R

### install.packages("forecast")

library(forecast)

modelfit <- auto.arima(AirPassengers)

forecasts <- forecast( modelfit, h=50 )

plot( forecasts )

accuracy(forecasts)

#                  ME     RMSE     MAE      MPE     MAPE     MASE        ACF1
# Training set 1.3423 10.84619 7.86754 0.420698 2.800458 0.245628 -0.00124847

### 9 years of training data

AirPassengersTrain <- ts(AirPassengers[1:108], frequency=12, start=c(1949,1))

### 3 years of testing data

AirPassengersTest <- ts(AirPassengers[109:144], frequency=12, start=c(1958,1))

modelfit <- auto.arima(AirPassengersTrain)

forecasts <- forecast( modelfit, h=36 )

accuracy(f = forecasts, x = AirPassengersTest)

#                      ME      RMSE       MAE         MPE     MAPE     MASE       ACF1 Theil's U
# Training set  0.3153345  9.032673  6.731484  0.07693443 2.923287 0.220178 0.01032578        NA
# Test set     -1.4834898 22.132229 17.807808 -1.08004267 4.148973 0.582470 0.61634978 0.4514313
# Warning message:
# In accuracy.default(f = forecasts, x = AirPassengersTest) :
#   Using `f` as the argument for `accuracy()` is deprecated. Please use `object` instead.

plot( AirPassengersTest, col="red", ylab="values")

lines(forecasts$mean, col="blue")