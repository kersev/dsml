Week 2 - Probability Distributions
================

# What is exploratory data analysis? EDA

## Random variables

> *“A random variable, usually written X, is a variable* *whose possible
> values are numerical outcomes of a* *random phenomenon.”*
> <http://www.stat.yale.edu/Courses/1997-98/101/ranvar.html>

Two types:

- Discrete (number of students in a class)
- Continuous (amount of time it take to run a mile)

### Discrete and Continuous

$$
X = \begin{cases}
1 & \text{heads} \\
2 & \text{ tails}
\end{cases}
$$

*Y = Time it takes to run a mile*

## **Probability distribution**

> *“A probability distribution is… an equation that* *links each outcome
> of a statistical experiment* *with its probability of occurrence.”*
> <http://stattrek.com/probability-distributions/probability-distribution.aspx>

## Discrete Probability Distribution

Suppose you flip a coin 2 times.

Possible outcomes: **HH, HT, TH and TT**

E.G. Probability distribution of the number of heads?

<figure>
<img src="lecimages/image.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

<http://stattrek.com/probability-distributions/probability-distribution.aspx>

## Cumulative probability

> *“A cumulative probability refers to the probability* *that the value
> of a random variable falls within a* *specified range.”*
> <https://stattrek.com/statistics/dictionary.aspx?definition=cumulative_probability>

Probability that 2 coin flips includes 1 or fewer heads?

$$
P(X ≤ 1) = P(X = 0) + P(X = 1) = 0.25 + 0.50 = 0.75
$$

![](lecimages/c22c6cb9-eb50-4012-b424-8f8ebf06bac9.png)

<https://www.khanacademy.org/math/statistics-probability/random-variables-stats-library/discrete-and-continuous-random-variables/v/discrete-probability-distribution>

## Continuous variables

- Height, weight, distance, time etc.
- So how do we work with continuous variables and their distributions?

![](lecimages/image5.png)

## Discretization / Quantization of continuous variables

- Range = max – min
- Number of intervals/bins: Not less than 10 and no more than 20

Step interval size = range / number of intervals/bins

$$
k = \left\lceil \frac{\max x - \min x}{h} \right\rceil .
$$

This formula is used to calculate the number of bins or intervals needed
to divide a range of data, often used in creating histograms.

In simple terms:

- Take the maximum value in your dataset
- Subtract the minimum value in your dataset
- Divide this range by h (which represents the width of each bin)
- Round up to the nearest whole number

The result, k, tells you how many bins of width h you would need to
cover the entire range of your data.

For example, if your data ranges from 10 to 45, and you want each bin to
be 5 units wide, you would calculate: k = ceiling((45 - 10)/5) =
ceiling(7) = 7

So you would need 7 bins to cover the entire range of data with bins of
width 5.

<aside>

<img src="https://www.notion.so/icons/chat-user_lightgray.svg" alt="https://www.notion.so/icons/chat-user_lightgray.svg" width="40px" />

*Intervals are also known as bins (k=bin width)*

</aside>

Histograms can change depending on the number of bins

![](lecimages/image7.png)

![](lecimages/image8.png)

<http://www.shodor.org/interactivate/activities/Histogram/>

## Computing Bin size

- **Square-root choice**

  $$
    k = \sqrt n ,
    $$

- **Sturges’ formula**

  $$
    k = \lceil log_2~n \rceil + 1,
    $$

  - If n was 8 then k = 4
  - If n was 16 then k = 5

- **Freedman-Diaconis**

- **Rice**

- **Scott**

- **…**

### **Number of bins computed**

![](lecimages/image11.png)

## Continuous Probability Distribution

Distribution of times it took you to drive to work **(average=50,
SD=20)**

What is the probability that it will take you 50 minutes?

**P(Y = 50)**

<figure>
<img src="lecimages/image%201.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

Distribution of times it took you to drive to work (average=50, SD=20)

**P(49 \< Y \< 51)**

<figure>
<img src="lecimages/image%202.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

Distribution of times it took you to drive to work **(average=50,
SD=20)**

**P(49 \< Y \< 51)**

### **tigerstats R package**

``` r
library("tigerstats")
```

    ## Warning: package 'tigerstats' was built under R version 4.4.3

    ## Loading required package: abd

    ## Warning: package 'abd' was built under R version 4.4.3

    ## Loading required package: nlme

    ## Loading required package: lattice

    ## Loading required package: grid

    ## Loading required package: mosaic

    ## Warning: package 'mosaic' was built under R version 4.4.3

    ## Registered S3 method overwritten by 'mosaic':
    ##   method                           from   
    ##   fortify.SpatialPolygonsDataFrame ggplot2

    ## 
    ## The 'mosaic' package masks several functions from core packages in order to add 
    ## additional features.  The original behavior of these functions should not be affected by this.

    ## 
    ## Attaching package: 'mosaic'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     count, do, tally

    ## The following object is masked from 'package:Matrix':
    ## 
    ##     mean

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     stat

    ## The following objects are masked from 'package:stats':
    ## 
    ##     binom.test, cor, cor.test, cov, fivenum, IQR, median, prop.test,
    ##     quantile, sd, t.test, var

    ## The following objects are masked from 'package:base':
    ## 
    ##     max, mean, min, prod, range, sample, sum

    ## Welcome to tigerstats!
    ## To learn more about this package, consult its website:
    ##  http://homerhanumat.github.io/tigerstats

``` r
?pnormGC
pnormGC( c(49,51), region="between", mean=50, sd=20, graph=TRUE )
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

    ## [1] 0.03987761

<figure>
<img src="lecimages/image%203.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

## Descriptive statistics – I know you know this

- Central tendency
  - mean, median, mode, geometric mean interquartile mean…
- Spread
  - variance, standard deviation, range, interquartile range

## What measures should I use?

- Parametric statistics
  - Mean ± SD
  - t-test family
  - Pearson correlation
- Non-parametric statistics
  - Median ± IQR
  - Wilcoxon or Mann Whitney test
  - Spearman correlation

<figure>
<img src="lecimages/image%204.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

Exact distribution vs. using an approximate distribution

## Central limit theorem

> *“If the sample is large (n\>=30) then statistical theory says that
> the sample mean is normally distributed… This is a result of a famous
> statistical theorem, the Central limit theorem.”* Source:
> <https://en.wikibooks.org/wiki/Statistics/Testing_Data/t-tests>

### Normal distribution

$$
AreaUnderNormalCurve = \int_{-\infty}^{\infty} f(x)dx = 1
$$

<figure>
<img src="lecimages/image20.png"
alt="https://commons.wikimedia.org/wiki/File:Empirical_Rule.PNG" />
<figcaption aria-hidden="true"><a
href="https://commons.wikimedia.org/wiki/File:Empirical_Rule.PNG">https://commons.wikimedia.org/wiki/File:Empirical_Rule.PNG</a></figcaption>
</figure>

<https://commons.wikimedia.org/wiki/File:Empirical_Rule.PNG>

### Cumulative distribution function (CDF)

mean=50, SD=25

<figure>
<img src="lecimages/image%205.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
#pnorm(x, mean, sd)
pnorm(30, 50, 25)
```

    ## [1] 0.2118554

### Standardisation and Z-values

<figure>
<img src="lecimages/image%206.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

- A z-value is used to standardise a number so that it becomes ‘metric
  agnostic’
- Z-values then can be summed with z-values derived from other metrics
  to create a composite score.

## Problem with z-scores

- From –infinity to +infinity
- Confusing

## Sigma scale

- All positive scores
- Divide distribution into 100 equal parts
- 0 = 3 SDs below the mean
- 100 = 3 SDs above the mean

16z + 50

## Hull scale

- All positive scores
- Divide distribution into 100 equal parts
- 0 = 3.5 SDs below the mean
- 100 = 3.5 SDs above the mean

14z + 50

## t scale

- All positive scores
- Divide distribution into 100 equal parts
- 0 = 5 SDs below the mean
- 100 = 5 SDs above the mean

10 Z + 50

## Whilst you might assume that your variable is normally distributed, you should test this?

<figure>
<img src="lecimages/image25.png"
alt="http://stattrek.com/statistics/charts/data-patterns.aspx?Tutorial=AP" />
<figcaption aria-hidden="true"><a
href="http://stattrek.com/statistics/charts/data-patterns.aspx?Tutorial=AP">http://stattrek.com/statistics/charts/data-patterns.aspx?Tutorial=AP</a></figcaption>
</figure>

<http://stattrek.com/statistics/charts/data-patterns.aspx?Tutorial=AP>

## Skewness

Example – what about salary distribution

<figure>
<img src="lecimages/image26.png"
alt="https://commons.wikimedia.org/wiki/File:Relationship_between_mean_and_median_under_different_skewness.png" />
<figcaption aria-hidden="true"><a
href="https://commons.wikimedia.org/wiki/File:Relationship_between_mean_and_median_under_different_skewness.png">https://commons.wikimedia.org/wiki/File:Relationship_between_mean_and_median_under_different_skewness.png</a></figcaption>
</figure>

<https://commons.wikimedia.org/wiki/File:Relationship_between_mean_and_median_under_different_skewness.png>

E.g. mean is a bad measure of the distribution if the variable is skewed

## Kurtosis

Measure of the tailedness and peakness

<figure>
<img src="lecimages/image%207.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

## Kurtosis

- Kurtosis of a normal distributed variable is 3.
- Distributions with kurtosis less than 3 are said to be *platykurtic*
- Distributions with kurtosis greater than 3 are said to be
  *leptokurtic*.

## Types of distributions

- Normal (Gaussian)
- Binomial distributions
- Chi-square

*Tutorial on other distributions*

- Uniform
- Beta
- Gamma
- Poisson
- Exponential
- Log
- … … …

## Discretization features for Machine Learning

- Some algorithms may only use nominal features
  - E.g. Decision trees
- How would you convert heights to categories? E.g. small, typical,
  tall…
- Is there an optimal method for this?

## **Entropy-Based Discretization**

$$
\text{Entropy}(D_1) = -\sum_{i=1}^{m} p_i \log_2\,p_i
$$

M = number of classes

P = probability, e.g. number of people aged \<25 earning \<=50k (class)

|               | **Salary \<60k** | **Salary \>60k** |
|---------------|------------------|------------------|
| **Aged \<30** | 30               | 2                |
| **Aged \>30** | 8                | 22               |

``` r
# Entropy(age<30) = (30/32 * log2(30/32)) + (2/32 * log2(2/32)) = 0.3372901
# Entropy(age>30) = (8/30 * log2(8/30)) + (22/30 * log2(22/30)) = 0.8366407
# Net entropy = mean(c(0.3372901, 0.8366407)) = 0.5869654
```

<aside>

<img src="https://www.notion.so/icons/warning_pink.svg" alt="https://www.notion.so/icons/warning_pink.svg" width="40px" />

Be careful when dichotomizing variables (converting a numeric variable
into categories)

</aside>

# Exercise - Tutorial

Open rundata.csv on BBL

**Open in Excel**

## How you can generate data

``` r
# if issues run the following:
# getwd()
# setwd("./week2")

rundata <- read.csv("../rundata.csv")
rundata$FirstRun <- rnorm(99, 30, 10)
rundata$SecondRun <- rundata$FirstRun + rnorm(99, 5, 2)
rundata$FinalRun <- rundata$SecondRun + rnorm(99, 7, 3)
```

![](lecimages/image29.png)

![](lecimages/image30.png)

Let’s assume each row is a runner and each number is how far they ran at
each consecutive run.

### Tutorial

``` r
rundata$FirstRun
```

    ##  [1] 40.966650 45.223559 32.468533 29.365796 28.858644 39.200772 27.734068
    ##  [8] 35.955872  9.902974 31.708646 17.905562 33.180694 31.617578 14.039046
    ## [15] 32.446460 17.564528 10.667120 28.700671 25.798031 35.870006 32.021256
    ## [22] 21.081807 42.462683 51.463381 23.016385 41.131854 50.179608 26.932851
    ## [29] 19.067766 40.593998 18.540404 26.631558 35.487406 37.473441 31.870145
    ## [36] 39.004494 32.993627 32.989987 31.386159 33.674469 17.098803 25.911280
    ## [43] 32.187033 30.953739 24.043190 41.283364 23.332843 23.645131 29.721161
    ## [50] 39.316774 21.838659 18.922503 41.129746 33.724212 13.533743 50.418537
    ## [57] 29.754818 44.520191 36.116746 32.424681 29.944536 45.811679 29.995593
    ## [64] 23.090961 18.170484 34.692438 43.174329 43.076396 29.606398 36.342192
    ## [71] 30.503618 28.101076 36.236813 45.893840 31.282998 20.571962 21.514469
    ## [78] 27.919763 50.366440 45.969079 19.621275 22.966757 33.405512 16.280908
    ## [85] 25.926971 13.372470 42.006253 26.277342 37.438542 15.214066 29.914108
    ## [92] 17.337447 21.746915 38.108213 31.774232 43.165166 33.526764 27.811286
    ## [99] 26.837567

``` r
mean(rundata$FirstRun)
```

    ## [1] 30.7278

``` r
sd(rundata$FirstRun)
```

    ## [1] 9.613917

``` r
summary(rundata$FirstRun)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   9.903  23.489  31.283  30.728  36.890  51.463

<figure>
<img src="lecimages/image%208.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

### hist(rundata\$FirstRun)

``` r
hist(rundata$FirstRun)
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

<figure>
<img src="lecimages/image%209.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

## Other parameters

``` r
#?hist
hist(rundata$FirstRun, ylab="y-axis title", xlab="x-axis title", main="main title")
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
dens <- density(rundata$FirstRun)
plot(dens)
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->

<figure>
<img src="lecimages/image%2010.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
convertToFunc <- with(dens, splinefun(x,y))
integrate(convertToFunc, lower=20, upper=25)
```

    ## 0.1281879 with absolute error < 3.1e-06

### Normality Testing

Shapiro-Wilk test of normality.

``` r
shapiro.test(rundata$FirstRun)
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  rundata$FirstRun
    ## W = 0.98797, p-value = 0.5136

**Hypothesis test**

$$
H_0 = Null~ hypothesis:~ Data~ is~ normally~ distributed
$$

$$
H_1 = Alternative~ hypothesis:~ Data~ is~ not~
 normally~ distributed
$$

<figure>
<img src="lecimages/image%2011.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

<figure>
<img src="lecimages/image%2012.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

<figure>
<img src="lecimages/image%2013.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

<figure>
<img src="lecimages/image%2014.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

<figure>
<img src="lecimages/image%2015.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
plot(density(rundata$FirstRun), col="red")
lines(density(rundata$SecondRun), col="green")
legend("bottom", legend = c("First run","Second run"), fill=c("red","green"))
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

<figure>
<img src="lecimages/image%2016.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
boxplot(rundata)
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

``` r
?boxplot
```

<figure>
<img src="lecimages/image%2017.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
plot(rundata$FirstRun, rundata$SecondRun)
```

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

<figure>
<img src="lecimages/image%2018.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
time <- c(19.09, 19.55, 17.89, 17.73, 25.15, 27.27, 25.24, 21.05, 21.65, 20.92, 22.61, 15.71, 22.04, 22.60, 24.25)
```

``` r
library(moments) #*slightly skewed* 
skewness(time)
```

    ## [1] -0.01565162

``` r
kurtosis(time) #platykurtic…
```

    ## [1] 2.301051

<https://www.r-bloggers.com/measures-of-skewness-and-kurtosis/>

``` r
library(ggplot2)
qplot(time, geom = 'histogram', binwidth = 2) + xlab('Time')
```

    ## Warning: `qplot()` was deprecated in ggplot2 3.4.0.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

<figure>
<img src="lecimages/image%2019.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

``` r
sample <- rnorm(n = 10000, mean = 55, sd = 4.5)
library(moments)
skewness(sample)
```

    ## [1] -0.01693669

``` r
kurtosis(sample)
```

    ## [1] 3.062924

``` r
#Histogram
library(ggplot2)
datasim <- data.frame(sample)
ggplot(datasim, aes(x = sample), binwidth = 2) +
    geom_histogram(aes(y = ..density..), fill = 'red', alpha = 0.5) +
    geom_density(colour = 'blue') + xlab(expression(bold('Simulated Samples'))) +
    ylab(expression(bold('Density')))
```

    ## Warning: The dot-dot notation (`..density..`) was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `after_stat(density)` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](C:\Users\Kevin\OneDrive%20-%20Ulster%20University\DSML\week2\Week-2---Probability-Distributions_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->

<figure>
<img src="lecimages/image%2020.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

## Generating a Normal Distribution of a Random Variable

``` r
?rnorm
x <- rnorm(10)
x <- rnorm(10, 20, 2)
summary(x)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   16.70   18.65   19.88   20.00   21.16   24.91

<figure>
<img src="lecimages/image%2021.png" alt="image.png" />
<figcaption aria-hidden="true">image.png</figcaption>
</figure>

<aside>

<img src="https://www.notion.so/icons/warning_pink.svg" alt="https://www.notion.so/icons/warning_pink.svg" width="40px" />

Can I transform my data to make it normally distributed?

Try taking the *log()* of your vector

</aside>

Other exercises

<https://www.r-bloggers.com/normal-distribution-functions/>

<https://www.r-bloggers.com/measures-of-skewness-and-kurtosis/>

<https://www.r-statistics.com/2013/05/log-transformations-for-skewed-and-wide-distributions-from-practical-data-science-with-r/>
