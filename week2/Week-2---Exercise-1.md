Week 2 - Exercise 1
================

## Exercise

**Continuing on from last week, try the following code snippets:**

### 1. The apply() function:

Read about the apply function by typing in

``` r
?apply
```

    ## starting httpd help server ... done

*The structure of the apply function is as follows:*

apply(m, dimcode, f, fargs)

Now try the apply function with the mean function:

``` r
x <- matrix(1:20, nrow = 10, ncol = 2)
apply(x, 2, mean)
```

    ## [1]  5.5 15.5

Now try the following code and try to understand each statement:

``` r
x <- matrix(1:20, nrow = 10, ncol = 2)
rowSums <- apply(x, 1, sum)
rowMeans <- apply(x, 1, mean)
colSums <- apply(x, 2, sum)
colMeans <- apply(x, 2, mean)
```

Now try this code using the quantile function with the probs argument.
Note that the probs argument is of the quantile function as opposed to
the apply function.

``` r
apply(x, 1, quantile, probs = c(0.25, 0.75))
```

    ##     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
    ## 25%  3.5  4.5  5.5  6.5  7.5  8.5  9.5 10.5 11.5  12.5
    ## 75%  8.5  9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5  17.5

### 2. Factors

Factors represent nominal/categorical data.

Try the following code:

``` r
?factor
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
```

    ## [1] yes yes no  yes no 
    ## Levels: no yes

The print out should be: ***yes yes no yes no Levels: no yes***

Note: levels is a statistical term meaning categories.

### 3. The table function:

Now try the table() function in R. This function takes a factor variable
and provides the number of occurrences of each category/level in that
variable.

``` r
x <- factor(c("yes", "yes", "no", "yes", "no"))
table(x)
```

    ## x
    ##  no yes 
    ##   2   3

The print out should be:

**no** **yes**  
**2** **3**

### 4. The tapply() function:

The tapply() function is a mixture of the table and apply functions. The
tapply function runs a function across two variables, for example you
can run the mean function to calculate the average age of people in each
subgroup (by affiliation). Try the following code:

``` r
ages <- c(25, 26, 37, 56, 42, 25)
affill <- factor(c("U", "R", "R", "D", "D", "U"))
tapply(ages, affill, mean)
```

    ##    D    R    U 
    ## 49.0 31.5 25.0

``` r
tapply(ages, affill, range)
```

    ## $D
    ## [1] 42 56
    ## 
    ## $R
    ## [1] 26 37
    ## 
    ## $U
    ## [1] 25 25

### 5. Handling missing values:

Try the following code:

``` r
x <- c(25, 26, NA, 56, 42, 25)
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE FALSE

``` r
is.nan(x)
```

    ## [1] FALSE FALSE FALSE FALSE FALSE FALSE

The function is.na(x) is used to test for NA and returns a logical
vector. The function is.nan(x) is used to test for NaN and returns a
logical vector.

Try the following code:

``` r
x <- c(1, 2, NA, 10, 3)
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

*Print out should be:* FALSE FALSE TRUE FALSE FALSE

``` r
is.nan(x)
```

    ## [1] FALSE FALSE FALSE FALSE FALSE

*Print out should be:* FALSE FALSE FALSE FALSE FALSE

``` r
x <- c(1, 2, NaN, NA, 4)
is.na(x)
```

    ## [1] FALSE FALSE  TRUE  TRUE FALSE

*Print out should be:* FALSE FALSE TRUE TRUE FALSE

``` r
is.nan(x)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

*Print out should be:* FALSE FALSE TRUE FALSE FALSE

### 6. Data cleansing of missing values:

Try the following two approaches for cleansing missing values. The first
approach sets all missing values to 0 and the second just inputs the
mean average.

``` r
x <- c(1, 2, NA, 10, 3)
x[is.na(x)] <- 0
x
```

    ## [1]  1  2  0 10  3

``` r
x <- c(1, 2, NA, 10, 3)
x[is.na(x)] <- mean(x, na.rm = TRUE)
x
```

    ## [1]  1  2  4 10  3

### 7. The mean function with missing values:

If you try the following code, you will notice that it does not work as
expected:

``` r
x <- c(1, 2, NA, 10, 3)
mean(x)
```

    ## [1] NA

To work as expected you need to use the na.rm argument to remove NA
values:

``` r
mean(x, na.rm = TRUE)
```

    ## [1] 4
