Week 2 - Statistical Computing with R
================

# Week 2 - Statistical Computing with R

# R System

- Download R from CRAN (Comprehensive R Archive Network)
  - [http://cran.r-project.org](http://cran.r-project.org/)
  - You are downloading the BASE package
    - the **base** package which is required to run R and contains the
      most fundamental functions.
  - You then download other packages that you may need – more on this
    later

# Numbers

- Numbers (double precision real numbers)
- If you want an integer, you specify the L suffix
  - 1 gives you a numeric object; 1L gives you an integer object
- There is also the number Inf (infinity);
  - e.g. 1 / 0 = Inf
  - 1 / Inf = 0
- The value NaN (“not a number”);
  - e.g. 0 / 0 = NaN
  - can also be thought of as a missing value
  - NULL can be thought of as undefined

# Working directory

- Shows the working directory (wd)
  - `getwd()`
- Changes the wd
  - `setwd(“C:/myfolder/data")`
- Saved workspace is in a file called .Rdata

## Hello world example

R is case sensitive (so msg and Msg are different variables)

Type the following into the R console: \<- is the assignment operator.

``` r
msg <- “hello world”;
print(msg); #explicit printing
msg; #auto-printing occurs
```

# Mixing Objects

What will happen here?

``` r
y <- c(1.7, "a”)
y <- c(TRUE, 2)
y <- c("a", TRUE)
```

- ***Implicit coercion*** occurs so that every element in the vector is
  of the same class (Regress to lowest common denominator)

What would happen here?

``` r
x <- c(1,2,3)
y <- c(x,x,1,2,3)
length(y)
length(x)
```

## Creating Vectors using seq()

``` r
x <- seq(from=12, to=30,by=3)
[1] 12 15 18 21 24 27 30
seq(12, 30, 3)
```

Creating Vectors using repeat function

``` r
x <- rep(8, 4)
[1] 8 8 8 8
x <- rep(c(5,6,7), 4)
[1] 5 6 7 5 6 7 5 6 7 5 6 7
```

Evaluating Vectors using any() and all()

``` r
x <- c(50:100)
        *x <- 50:100*
any(x > 8)
any(x < 8)
all(x > 50)
```

## Sub-vectors (subsetting/filtering)

``` r
x <- c(7,1,3)
y <- x[2:3] #Notice the square brackets!
y <- x[x > 2]
y <- x[x >= 2]
y <- x[c(1,3)]
y <- x[c(1:3)]
```

# Logical Operators

![](image7.png)

<http://www.statmethods.net/management/operators.html>

## Sub-vectors (subsetting/filtering)

``` r
x <- c(1,5,3)
y <- x[x > 2 | x == 1]
y <- x[x > 2 & x < 4]
```

## Recoding example - ?

``` r
x <- c(5,2,3,8)
x[x > 4] <- 0
```

## Using the subset() function

``` r
x <- c(1:5) #*same as c(1,2,3,4,5)*
y <- subset(x, x > 2)
3 4 5
x[x > 2]
```

Advantage of subset() – removes NA values

## Using the which() function

``` r
x <- c(8, 1, 5, 2)
which(x > 2)
1 3
which.max(x)
```

# Arithmetic Operators

![](image8.png)

<http://www.statmethods.net/management/operators.html>

## Vectorisation/Vectorised Functions

``` r
x <- c(3,4,2)
y <- c(5,3,1)
x > y
```

<aside>

<img src="https://www.notion.so/icons/priority-mid_gray.svg" alt="https://www.notion.so/icons/priority-mid_gray.svg" width="40px" />

FALSE TRUE TRUE

</aside>

``` r
x <- c(9,16,25)
sqrt(x)
```

<aside>

<img src="https://www.notion.so/icons/priority-mid_gray.svg" alt="https://www.notion.so/icons/priority-mid_gray.svg" width="40px" />

3 4 5

</aside>

``` r
x <- c(9.5,16.3,25.1)
round(x)
```

<aside>

<img src="https://www.notion.so/icons/priority-mid_gray.svg" alt="https://www.notion.so/icons/priority-mid_gray.svg" width="40px" />

10 16 25

</aside>

# Recycling

- R automatically repeats or recycles vectors when necessary

``` r
x <- c(3,4,2)
x+2
```

<aside>

<img src="https://www.notion.so/icons/priority-mid_gray.svg" alt="https://www.notion.so/icons/priority-mid_gray.svg" width="40px" />

5 6 4 *\# element wise addition*

c(3,4,2) + c(2,2,2)

</aside>

> c(1,2,4) + c(6,0,9,20,22,11)

Becomes

> c(1,2,4,1,2,4) + c(6,0,9,20,22,11)

> c(2) + c(6,0,9,20,22)

> 2 + c(6,0,9,20,22)

Becomes

> c(2,2,2,2,2) + c(6,0,9,20,22)

# 3 Key principles

- **Recycling**
  - Automatic lengthening/repetition of vectors
- **Filtering**
  - Subsetting / creating sub vectors
- **Vectorisation**
  - Where functions are applied to **element-wise** to vectors

# Explicit Coercion

- Coercion from one class to another using the as.\* functions:

``` r
x <- 0:6 // same as x <- c(0:6) or x <- c(0,1,2,3,4,5,6)
class(x)
[1] "integer”
as.numeric(x)
[1] 0 1 2 3 4 5 6
as.logical(x)
[1] FALSE TRUE TRUE TRUE TRUE TRUE TRUE
as.character(x)
[1] "0" "1" "2" "3" "4" "5" "6”
```

# Simulating Data in R

``` r
?rnorm
x <- rnorm(10)
x <- rnorm(10, 20, 2)
rnorm(n=10, mean=20, sd=2)
summary(x)
```

![](image9.png)

# Setting the seed

``` r
set.seed(1)
rnorm(5)
```

``` r
rnorm(5)
```

``` r
set.seed(1)
rnorm(5)
```

# Bootstrapping: Random Sampling

``` r
set.seed(1)
sample(c(1:10), 4) 
#3 4 5 7
```

``` r
sample(c(1:10), 10, replace = TRUE)
# 2 9 7 8 2 8 5 9 7 8
```

# Matrices and Arrays

- Matrices are 2 dimensional vectors (or 2D arrays)
- 3 dimensional vectors are referred to as 3D arrays (no longer a
  matrix)
- Column major order (what is this?)

``` r
m <- matrix( c(1,2,3,4,5,6), nrow = 2, ncol = 3)
m
            [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```

``` r
m <- matrix( c(1,2,3,4,5,6), nrow = 2, ncol = 3)
```

``` r
dim(m)
nrow(m)
ncol(m)
```

``` r
colnames(m) <- c(‘a’, ’b’, ‘c’)
m[,’b’]
```

# Matrices – Extraction ?

``` r
m <- matrix(c(1:6), nrow = 2, ncol = 3)
```

``` r
m[2,2]  # 4
m[,2]   # all rows in column 2
m[1,]   # all columns in row 1
m[,1:2] # all rows in columns 1 and 2
```

# Matrices – Setting Values

``` r
m <- matrix(c(1:6), nrow = 2, ncol = 3)
```

``` r
m[1,1] <- 1
m[1,2] <- 3
```

### Matrices can be created by *column-binding* or *row-binding*

``` r
x <- c(1:3)
y <- c(10:12)
cbind(x, y)
```

``` r
         x y
[1,] 1 10
[2,] 2 11
[3,] 3 12
```

``` r
rbind(x, y)
```

``` r
    [,1] [,2] [,3]
x   1    2    3
y  10   11   12
```

# Apply() Function

**Functional Programming: One of the most used functions in R:**

``` r
apply(m, dimcode, f, fargs)
x <- matrix(1:20, nrow = 10, ncol = 2)
apply(x, 2, mean)
round( apply(x, 2, mean) )
```

``` r
apply(m, dimcode, f, fargs)
x <- matrix(1:20, nrow = 10, ncol = 2)
rowSums <- apply(x, 1, sum)
rowMeans <- apply(x, 1, mean)
colSums <- apply(x, 2, sum)
colMeans <- apply(x, 2, mean)
apply(x, 1, quantile, probs = c(0.25, 0.75))
```

``` r
x <- matrix(rnorm(200), 20, 10)
boxplot(x)
```

![](image11.png)

## Apply() Function - Customized

``` r
x <- matrix(c(1:6), nrow = 3, ncol = 2)
f <- function(x) {
        return( x / c(2,8) )
}
**y <- apply(x, 1, f)**
```

# Other Matrix functions

- Transpose
  - t()

# Lists

- A list is a vector that can contain elements of different
  modes/classes/data types

``` r
x <- list(1, "a", TRUE, 500)
x[[2]]
“a”
```

Note the use of double brackets!

## Lists – key vale pairs

``` r
x <- list(name= ‘ray’, age= 32, male=TRUE)
x$name
#ray
```

# Factors

Factors represent nominal/categorical data.

“1stClass” , “2.1” and “2.2”

“Labor” and “Tory”

“GCSE” and “A-level” and “BSc”

“Cat” and “Dog” and “Hammster”

What about? - Jill, Jack, Susie, Jason ?

## Factors

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
[1] yes yes no yes no
```

**Levels: no yes**

``` r
table(x)
no yes
2  3
```

## Factors

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"), 
levels=c("no", "yes”,”undecided”))
```

# Missing values: NA and NAN

- Missing values are denoted by NA or NaN
- is.na(x) is used to test for NA
- is.nan(x) is used to test for NaN

**Data Cleansing scenario**

``` r
x[is.na(x)] <- 0
x[is.na(x)] <- mean(x)
# will cause an error
```

# NA and NAN functions

Note: **NaN values are also an NA but the opposite is not true**

``` r
x <- c(1, 2, NA, 10, 3)
is.na(x)
[1] FALSE FALSE TRUE FALSE FALSE
```

``` r
is.nan(x)
[1] FALSE FALSE FALSE FALSE FALSE
```

``` r
x <- c(1, 2, NaN, NA, 4)
is.na(x)
[1] FALSE FALSE TRUE TRUE FALSE
```

``` r
is.nan(x)
[1] FALSE FALSE TRUE FALSE FALSE
```

# Handling NA and NAN

``` r
x <- c(1, 2, NA, 10, 3)
mean(x)
# NA
```

``` r
mean(x, na.rm=TRUE)
```

# Data Frames

- Stores tabular data
- Every list element in the data frame has to have the same length
- Different from matrices as data frames can store different classes of
  elements just like lists
- **Can be described as a list of equal length vectors**
- Basically a 2 dimensional list (a list of lists)
- Data frames are created or imported using
  - data.frame(), read.table() or read.csv()
- A data frame be converted to a matrix
  - data.matrix(data frame)

``` r
x <- data.frame( a= c(1,2,3), b= c(T, T, F) )
x

a b
1 TRUE
2 TRUE
3 FALSE

nrow(x)
[1] 3

ncol(x)
[1] 2
```

``` r
x <- data.frame(names= c(“ray”, “susan”, “joe”), ages= c(31, 24, 45))

str(x)

x$names

x <- data.frame(names= c(“ray”, “susan”, “joe”), ages= c(31, 24, 45), stringsAsFactors=FALSE)
```

# Harmonize different Data Frames

``` r
merge()
merge(d1, d2, by.x=“fullnames”, by.y=“names”)
```

# R’s Built in Datasets

data()

![](image12.png)

``` r
Nile
?Nile

mean(Nile)
sd(Nile)

summary(Nile)
```

Time series of annual river flow

# R Packages

``` r
install.packages("psych")
library(psych)
describe(mydata)
```

# Tidyverse - <https://www.tidyverse.org/>

A collection of data science packages/libraries for R

install.packages(“tidyverse”)

- readr – for reading in datasets
- dplyr – for data wrangling
- tidyr – for subsetting/filtering
- …

# ggplot2

``` r
install.packages("ggplot2")
library(ggplot2)
```

<http://docs.ggplot2.org/current/>

``` r
?mpg
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
```

![](image13.png)

``` r
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot() + geom_jitter(width = 0.2)
```

![](image14.png)

``` r
p + geom_boxplot(aes(colour = drv))
```

![](image15.png)

# If-then-else statements

``` r
x <- 5

if(x > 3) {
                    y <- 10
} else {
                    y <- 0
}
```

# For loops

``` r
x <- c(1,5,4,3,2)

for(i in 1:5) {
                print(x[i])
}
```

``` r
for(i in 1:length(x)) {
                print(x[i])
}
```

### Nested For loops

``` r
x <- matrix(1:6, 2, 3)

for(i in seq_len( nrow(x) ) ) {
                for(j in seq_len( ncol(x) ) ) {
                                print(x[i, j])
                }
}
```

# While Loop

``` r
i <- 1
while(i < 20) {
                print(i)
                i <- i + 1
}
```

# Repeat and Break

``` r
repeat {
                if(<condition>) {
                                break
                } else {
                                #do some calculations
                }
}
```

# Next

``` r
for(i in 1:50) {
                if(i <= 10) {
                                ## Skip the first 10 iterations 
                                **next**
                }
                # Do some calculations
}
```

# Custom Functions

``` r
f <- function(<arguments>) {
                ## Do something interesting
}
```

# Functions

- Not all arguments have to be used
- You can pass in arguments in the right order or an arbitrary order
  providing you specify the argument names

``` r
args(sd)

sd(mydata, na.rm=TRUE)
sd(na.rm=TRUE, x = mydata)
```

``` r
f <- function(a, b) {
        y <- a*b
        return(y)
}
f(2,3)

f(a=2,b=3)

f(b=3, a=2)
```

``` r
f <- function(a, b) {
        y <- a*b
        y
}
```

## The Argument ‘…’

``` r
myplot <- function(x, y, type = "l", ...) {
                plot(x, y, type = type, ...)
}
```
