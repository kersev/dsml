### Use the ts() function to plot some time series data

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")

birthstimeseries <- ts(births, frequency=12, start=c(1946,1))

plot.ts(birthstimeseries)

### Now add a regression line to study the trend

abline(reg=lm(birthstimeseries~time(birthstimeseries)))

### Try using a simple moving average to also study the trend. 
### You might need to install the TTR library
### install.packages("TTR")

library("TTR")
### For the below we had to swap the n value from 15 to 1 to get rest working
birthstimeseries <- SMA(birthstimeseries, n=1)
plot.ts(birthstimeseries)

### Now study the Seasonality Trend Decomposition (STD)

birthstimeseriescomponents <- decompose(birthstimeseries)

plot(birthstimeseriescomponents)

### Filter out the random signal

birthstimeseriesseasonallyadjusted <- birthstimeseries - 
  birthstimeseriescomponents$random

plot.ts(birthstimeseriesseasonallyadjusted)

### Study auto-correlation where the lag=1

plot(birthstimeseries[2:168], birthstimeseries[1:167])

cor(birthstimeseries[2:168], birthstimeseries[1:167], use = "complete.obs")
### Now compute the auto-correlation for 1-24 lags

acf( birthstimeseries, lag.max = 24)

### Now compute the partial auto-correlation

pacf(birthstimeseries, lag.max = 24)

### Use the Augmented dickey fuller test for stationarity
### • Null hypothesis: non-stationary
### • Alternative hypothesis: stationary

library("tseries")
adf.test(birthstimeseries)

### Now try differencing the signal – notice the de-trending

plot.ts( diff(birthstimeseries))
