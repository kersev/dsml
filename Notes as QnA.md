# Notes with answers

**Week 1: Introduction to Data Science and Machine Learning & R Scripting**

1. **What is the primary difference between supervised and unsupervised learning?**
    - **Solution:** In supervised learning, the algorithm is trained on labeled data (with input-output pairs), while in unsupervised learning, the algorithm works with unlabeled data and must find patterns or structure on its own.
2. **What are the main stages of the data science lifecycle?**
    - **Solution:** The main stages typically include: Problem Definition, Data Collection, Data Cleaning/Preprocessing, Exploratory Data Analysis, Feature Engineering, Modeling, Evaluation, and Deployment.
3. **In R, how do you create a vector containing the numbers from 1 to 10?**
    - **Solution:** my_vector <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) or more efficiently: my_vector <- 1:10
4. **What is the difference between a vector and a list in R?**
    - **Solution:** A vector in R is a collection of elements of the same data type, while a list can contain elements of different data types, including other lists.
5. **How do you install and load a package in R?**
    - **Solution:** To install: install.packages("package_name"). To load: library(package_name) or require(package_name).
6. **How do you create a data frame in R?**
    - **Solution:**

> df <- data.frame(
> 
> 
> Name = c("Alice", "Bob", "Charlie"),
> 
> Age = c(25, 30, 35),
> 
> Score = c(85, 92, 78)
> 

)

1. **How do you select rows from a data frame where a condition is met in R?**
    - **Solution:** df[df$column_name > value,] or using dplyr: filter(df, column_name > value)
2. **What does the following R code do? apply(matrix, 2, mean)**
    - **Solution:** It calculates the mean of each column in the matrix.

**Week 2: Statistical Computing with R & Probability Distributions**

1. **What is a probability distribution?**
    - **Solution:** A probability distribution is a mathematical function that gives the probabilities of occurrence of different possible outcomes for an experiment or random variable.
2. **What are the key properties of a normal distribution?**
    - **Solution:** A normal distribution is symmetric around its mean, bell-shaped, and fully characterized by two parameters: mean (μ) and standard deviation (σ). About 68% of the data falls within one standard deviation of the mean, 95% within two standard deviations, and 99.7% within three standard deviations.
3. **How would you generate 100 random samples from a normal distribution with mean 0 and standard deviation 1 in R?**
    - **Solution:** random_samples <- rnorm(100, mean = 0, sd = 1)
4. **What is the central limit theorem and why is it important?**
    - **Solution:** The central limit theorem states that the distribution of sample means approximates a normal distribution as the sample size becomes larger, regardless of the population's distribution. It's important because it allows us to make inferences about a population using sample statistics, even when the population distribution is unknown.
5. **What is the difference between rnorm(), dnorm(), pnorm(), and qnorm() functions in R?**
    - **Solution:**
        - rnorm(): Generates random values from a normal distribution
        - dnorm(): Calculates the probability density function (PDF) value at a point
        - pnorm(): Calculates the cumulative distribution function (CDF) value (probability of x ≤ X)
        - qnorm(): Calculates the quantile function (inverse CDF)
6. **How would you generate random samples from a binomial distribution with 10 trials and success probability 0.3?**
    - **Solution:** rbinom(n = 100, size = 10, prob = 0.3)
7. **What is the law of large numbers?**
    - **Solution:** The law of large numbers states that as the sample size increases, the sample mean approaches the population mean. It explains why the average of a random sample from a large population is likely to be close to the mean of the whole population.
8. **How do you create a histogram in R to visualize the distribution of a variable?**
    - **Solution:** hist(data_vector, main = "Histogram", xlab = "Values", col = "lightblue")

**Week 3: Inferential Statistics and Hypothesis Testing**

1. **What is the difference between descriptive and inferential statistics?**
    - **Solution:** Descriptive statistics summarize or describe the characteristics of a dataset (e.g., mean, median, mode), while inferential statistics use sample data to make predictions or inferences about a larger population.
2. **What is a p-value in hypothesis testing?**
    - **Solution:** A p-value is the probability of observing a test statistic as extreme as or more extreme than the one observed, assuming the null hypothesis is true. Small p-values suggest that the observed data is unlikely under the null hypothesis.
3. **Explain the terms Type I error and Type II error in hypothesis testing.**
    - **Solution:**
        - Type I error: Rejecting a null hypothesis when it is actually true (false positive)
        - Type II error: Failing to reject a null hypothesis when it is actually false (false negative)
4. **What is a confidence interval?**
    - **Solution:** A confidence interval is a range of values that is likely to contain the true population parameter with a certain level of confidence. For example, a 95% confidence interval means that if we repeated our sampling process many times, about 95% of the intervals would contain the true parameter.
5. **How would you perform a t-test in R to compare the means of two independent samples?**
    - **Solution:** t.test(group1, group2, var.equal = FALSE)
6. **What assumption(s) should be met when using a t-test?**
    - **Solution:** The key assumptions are:
        - The data should be approximately normally distributed (or sample size large enough)
        - For an independent t-test, the variances should be roughly equal (though R's default t.test handles unequal variances)
        - Observations should be independent
7. **What is the difference between a one-tailed and a two-tailed test?**
    - **Solution:** A one-tailed test examines the possibility of a relationship in one direction (e.g., greater than or less than), while a two-tailed test examines the possibility of a relationship in both directions (different from). Two-tailed tests are more conservative.
8. **How would you compute correlation between two variables in R?**
    - **Solution:** cor(variable1, variable2) or cor.test(variable1, variable2) for testing significance

**Week 4: Regression, Time Series & Survival Analysis**

1. **What is linear regression and what is its main objective?**
    - **Solution:** Linear regression is a statistical method that models the relationship between a dependent variable and one or more independent variables by fitting a linear equation. Its main objective is to predict the value of the dependent variable based on known values of the independent variables.
2. **How do you interpret the R² value in a regression model?**
    - **Solution:** R² represents the proportion of variance in the dependent variable that is explained by the independent variable(s). It ranges from 0 to 1, with higher values indicating a better fit of the model to the data.
3. **What is the difference between simple linear regression and multiple linear regression?**
    - **Solution:** Simple linear regression uses one independent variable to explain or predict the dependent variable, while multiple linear regression uses two or more independent variables.
4. **How would you implement a simple linear regression in R?**
    - **Solution:**
5. model <- lm(y ~ x, data = my_data)
6. summary(model)
7. **What is logistic regression and when would you use it instead of linear regression?**
    - **Solution:** Logistic regression is a statistical method used to model the probability of a binary outcome. It's used instead of linear regression when the dependent variable is categorical (especially binary) rather than continuous.
8. **How would you implement logistic regression in R?**
    - **Solution:**
9. model <- glm(y ~ x1 + x2, data = my_data, family = binomial)
10. summary(model)
11. **What is a time series?**
    - **Solution:** A time series is a sequence of data points indexed in chronological order, typically at successive equally spaced points in time.
12. **What are the components of a time series?**
    - **Solution:** The main components are:
        - Trend: The long-term movement in the data
        - Seasonality: Regular patterns that repeat over fixed periods
        - Cyclical fluctuations: Rises and falls that don't follow a fixed period
        - Irregular/residual component: Random variations that can't be attributed to trend, seasonality, or cyclical patterns
13. **How would you decompose a time series into its trend, seasonal, and residual components in R?**
    - **Solution:**

> decomposed <- decompose(ts_data, type = "multiplicative") # or "additive"
> 
> 
> plot(decomposed)
> 
1. **What is an SPLOM graph and how is it useful?**
    - **Solution:** SPLOM stands for Scatter PLOt Matrix. It's a visualization that shows pairwise scatter plots of all variables in a dataset, allowing for quick identification of relationships between multiple variables simultaneously.
2. **How would you create an SPLOM graph in R?**
    - **Solution:**

> pairs(data[, c("var1", "var2", "var3", "var4")])
> 
> 
> # Or with ggplot2
> 
> library(GGally)
> 
> ggpairs(data[, c("var1", "var2", "var3", "var4")])
> 
1. **What is autocorrelation in time series analysis?**
    - **Solution:** Autocorrelation is the correlation of a signal with a delayed copy of itself. It helps identify patterns and dependencies in sequential data by measuring the relationship between current values and past values at different lags.

**Week 5: Supervised Machine Learning and Feature Engineering**

1. **What is feature engineering and why is it important in machine learning?**
    - **Solution:** Feature engineering is the process of transforming raw data into features that better represent the underlying problem, resulting in improved model performance. It's important because the quality of features often has a greater impact on model performance than the choice of algorithm.
2. **What is a confusion matrix and what information does it provide?**
    - **Solution:** A confusion matrix is a table used to evaluate classification model performance, showing the counts of:
        - True Positives (TP): Correctly predicted positive class
        - False Positives (FP): Incorrectly predicted positive class
        - True Negatives (TN): Correctly predicted negative class
        - False Negatives (FN): Incorrectly predicted negative class

From these, we can calculate metrics like accuracy, precision, recall, and F1 score.

1. **What is the k-nearest neighbors (KNN) algorithm and how does it work?**
    - **Solution:** KNN is a simple supervised learning algorithm that classifies a data point based on how its k nearest neighbors are classified. It stores all available cases and classifies new cases based on a similarity measure (e.g., distance functions).
2. **How would you implement KNN classification in R?**
    - **Solution:**

> library(class)
> 
> 
> prediction <- knn(train = train_data, test = test_data, cl = train_labels, k = 5)
> 
1. **What are decision trees and how do they work?**
    - **Solution:** Decision trees are supervised learning models that make decisions by recursively splitting the data based on feature values. They create a flowchart-like structure where internal nodes represent feature tests, branches represent decision outcomes, and leaf nodes represent class labels or value predictions.
2. **What is the Boruta algorithm and what is it used for?**
    - **Solution:** Boruta is a feature selection algorithm based on random forest. It works by creating shadow features (random permutations of original features), training a random forest, and comparing the importance of real features to their shadow copies. It's used to find all relevant features in a dataset, rather than just the minimal optimal set of features.
3. **What is the difference between a decision tree and a random forest?**
    - **Solution:** A random forest is an ensemble method that builds multiple decision trees and merges their predictions. It improves upon single decision trees by:
        - Training each tree on a bootstrap sample of the data (bagging)
        - Considering only a random subset of features at each split
        - These strategies help reduce overfitting and improve generalization.

**Week 6: Ethics in Data Science & Machine Learning**

1. **What is algorithmic bias, and how can it manifest in machine learning models?**
    - **Solution:** Algorithmic bias refers to systematic errors in algorithms that create unfair or discriminatory outcomes for certain groups. It can manifest in ML models through:
        - Biased training data (historical prejudices, underrepresentation)
        - Feature selection that disadvantages certain groups
        - Target variable choice that reflects existing inequities
        - Proxy variables that correlate with protected attributes
        - Inappropriate model optimization metrics
2. **What is the GDPR (General Data Protection Regulation) and what are its key principles?**
    - **Solution:** GDPR is a regulation in EU law on data protection and privacy. Key principles include:
        - Lawfulness, fairness, and transparency
        - Purpose limitation
        - Data minimization
        - Accuracy
        - Storage limitation
        - Integrity and confidentiality (security)
        - Accountability
        - Individual rights (access, rectification, erasure, portability)
3. **What is data anonymization and why is it important?**
    - **Solution:** Data anonymization is the process of removing or modifying personally identifiable information to prevent identification of individuals. It's important for:
        - Protecting privacy and confidentiality
        - Complying with regulations like GDPR
        - Enabling data sharing for research or business purposes
        - Reducing risks in the event of data breaches
4. **What is synthetic data and what are its advantages in machine learning?**
    - **Solution:** Synthetic data is artificially generated data that mimics real data's statistical properties but doesn't contain actual records. Advantages include:
        - Privacy protection (no real individuals' data is used)
        - Overcoming data scarcity
        - Balancing imbalanced datasets
        - Simulating rare events or edge cases
        - Testing systems without regulatory constraints
5. **What is the caret package in R, and what is it used for?**
    - **Solution:** The caret (Classification And REgression Training) package in R provides a unified interface for training various machine learning models. It simplifies the process of:
        - Data preprocessing
        - Model training and tuning
        - Feature selection
        - Model evaluation
        - Comparing model performance
6. **What ethical considerations should be addressed when sharing data for research or commercial purposes?**
    - **Solution:** Key considerations include:
        - Obtaining appropriate consent
        - Ensuring data anonymization or pseudonymization
        - Assessing re-identification risks
        - Establishing clear data usage agreements
        - Implementing appropriate security measures
        - Being transparent about data sharing practices
        - Ensuring compliance with relevant regulations
7. **What is the concept of "ethics by design" in data science and machine learning?**
    - **Solution:** Ethics by design is an approach that integrates ethical considerations into every phase of the data science and machine learning lifecycle, rather than treating ethics as an afterthought. It involves proactively identifying and addressing ethical issues during problem formulation, data collection, feature engineering, model development, deployment, and monitoring.

**Additional Practice Questions for COM747 (Weeks 1-6)**

**R Programming Fundamentals**

1. **How do you check the structure of a data frame in R?**
- **Solution:** You can use str(df) or glimpse(df) from the dplyr package.
1. **What's the difference between c() and data.frame() in R?**
- **Solution:** c() combines values into a vector (one-dimensional, same data type), while data.frame() creates a tabular data structure with rows and columns that can have different data types.
1. **How do you create a factor variable in R?**
- **Solution:**

gender <- factor(c("Male", "Female", "Female", "Male"), levels = c("Male", "Female"))

1. **What is the difference between lapply() and sapply() in R?**
- **Solution:** Both apply a function to elements of a list or vector. lapply() always returns a list, while sapply() tries to simplify the result to a vector or matrix when possible.
1. **How would you merge two data frames in R?**
- **Solution:**

# Using base R

merged_df <- merge(df1, df2, by = "common_column")

# Using dplyr

library(dplyr)

merged_df <- inner_join(df1, df2, by = "common_column")

**Probability and Statistics**

1. **What is the difference between population parameters and sample statistics?**
- **Solution:** Population parameters are numerical characteristics of an entire population (e.g., μ for population mean), while sample statistics are numerical characteristics calculated from a sample (e.g., x̄ for sample mean).
1. **What is the formula for variance and standard deviation?**
- **Solution:**
    - Variance: σ² = Σ(x - μ)² / N (population) or s² = Σ(x - x̄)² / (n-1) (sample)
    - Standard deviation: σ = √σ² (population) or s = √s² (sample)
1. **What is the formula for calculating z-scores, and what do they represent?**
- **Solution:** z = (x - μ) / σ. Z-scores represent how many standard deviations a data point is from the mean.
1. **In a normal distribution, what percentage of data falls within 1, 2, and 3 standard deviations from the mean?**
- **Solution:**
    - Within 1 standard deviation: approximately 68.2%
    - Within 2 standard deviations: approximately 95.4%
    - Within 3 standard deviations: approximately 99.7%
1. **How would you calculate the interquartile range (IQR) in R?**
- **Solution:** IQR(data_vector) or manually: quantile(data_vector, 0.75) - quantile(data_vector, 0.25)
1. **What is the relationship between the binomial and normal distributions?**
- **Solution:** As the number of trials (n) in a binomial distribution increases, it approximates a normal distribution with mean = np and variance = np(1-p), where p is the probability of success.
1. **What does the set.seed() function do in R and why is it important?**
- **Solution:** set.seed() initializes the random number generator to produce a reproducible sequence of "random" numbers. It's important for reproducibility in simulations and data analysis.

**Inferential Statistics and Hypothesis Testing**

1. **What are the null and alternative hypotheses in a statistical test?**
- **Solution:** The null hypothesis (H₀) typically represents no effect or no difference, while the alternative hypothesis (H₁ or Hₐ) represents the presence of an effect or difference that the researcher aims to demonstrate.
1. **What is a Type I error and how is its probability related to the significance level (α)?**
- **Solution:** A Type I error is rejecting a null hypothesis when it is actually true (false positive). Its probability is equal to the significance level (α).
1. **What is statistical power and how is it related to Type II error?**
- **Solution:** Statistical power is the probability of correctly rejecting a false null hypothesis. It equals 1 - β, where β is the probability of a Type II error (false negative).
1. **What factors affect the power of a statistical test?**
- **Solution:**
    - Sample size (larger samples increase power)
    - Effect size (larger effects are easier to detect)
    - Significance level (higher α increases power but also increases Type I error risk)
    - Variability in the data (less variability increases power)
1. **What is the formula for a t-statistic in a one-sample t-test?**
- **Solution:** t = (x̄ - μ) / (s / √n), where x̄ is the sample mean, μ is the hypothesized population mean, s is the sample standard deviation, and n is the sample size.
1. **How would you interpret a 95% confidence interval for a mean?**
- **Solution:** If we were to repeat the sampling process and calculate the confidence interval many times, about 95% of these intervals would contain the true population mean.

**Data Visualization and Exploratory Data Analysis**

1. **What R functions would you use to check for missing values in your dataset?**
- **Solution:**

# Count missing values

sum(is.na(data))

# See missing values by column

colSums(is.na(data))

# Visualize missing values

library(naniar)

vis_miss(data)

1. **What is the difference between a histogram and a density plot?**
- **Solution:** A histogram divides data into bins and shows the frequency or count within each bin, while a density plot shows a continuous estimation of the probability density function of the data.
1. **How would you create a boxplot in R to visualize the distribution of a variable grouped by a categorical variable?**
- **Solution:**

# Base R

boxplot(numeric_var ~ categorical_var, data = df)

# ggplot2

library(ggplot2)

ggplot(df, aes(x = categorical_var, y = numeric_var)) +

geom_boxplot()

1. **What is a SPLOM (Scatter Plot Matrix) and how would you create one in R?**
- **Solution:** A SPLOM shows pairwise scatter plots for all variables in a dataset, allowing for quick identification of relationships between multiple variables simultaneously.

# Base R

pairs(df[, c("var1", "var2", "var3")])

# ggplot2/GGally

library(GGally)

ggpairs(df[, c("var1", "var2", "var3")])

**Regression Analysis**

1. **In a multiple regression, what does the coefficient for a predictor variable represent?**
- **Solution:** The coefficient represents the expected change in the dependent variable for a one-unit change in the predictor variable, holding all other predictors constant.
1. **What is the difference between correlation and regression?**
- **Solution:** Correlation measures the strength and direction of a linear relationship between two variables without implying causation. Regression quantifies the relationship between variables with a predictive model, where one variable (dependent) is predicted from one or more other variables (independent).
1. **How do you interpret the results of the summary() function applied to a linear regression model in R?**
- **Solution:** The output includes:
    - Coefficients (estimates, standard errors, t-values, p-values)
    - R-squared and adjusted R-squared values
    - F-statistic and its p-value
    - Residual standard error
    - Degrees of freedom
    - Information about residuals (min, max, quartiles)
1. **What diagnostic plots are typically used to check the assumptions of a linear regression model?**
- **Solution:**
    - Residuals vs. Fitted: Checks linearity and homoscedasticity
    - Normal Q-Q plot: Checks normality of residuals
    - Scale-Location: Checks homoscedasticity
    - Residuals vs. Leverage: Identifies influential points
1. **How would you detect multicollinearity in a multiple regression model?**
- **Solution:**
    - Check correlation matrix for high correlations between predictors
    - Calculate Variance Inflation Factors (VIF):
- library(car)
- vif(model)
    - VIF values > 5 or 10 typically indicate problematic multicollinearity
1. **What is the difference between R² and adjusted R² in regression?**
- **Solution:** R² measures the proportion of variance explained by the model, but can increase just by adding more predictors even if they don't improve the model. Adjusted R² penalizes for adding predictors that don't improve the model, making it better for comparing models with different numbers of predictors.

**Time Series Analysis**

1. **How would you convert a regular data frame with a date column to a time series object in R?**
- **Solution:**

# For monthly data

ts_data <- ts(df$value, frequency = 12, start = c(2020, 1))

1. **What is the difference between additive and multiplicative time series decomposition?**
- **Solution:** In additive decomposition, components are added: Y = Trend + Seasonality + Residual. Used when seasonal variations are relatively constant over time. In multiplicative decomposition, components are multiplied: Y = Trend × Seasonality × Residual. Used when seasonal variations increase with the level of the series.
1. **How would you test for stationarity in a time series?**
- **Solution:**

library(tseries)

adf.test(ts_data) # Augmented Dickey-Fuller test

kpss.test(ts_data) # KPSS test

1. **What is the difference between ACF (Autocorrelation Function) and PACF (Partial Autocorrelation Function)?**
- **Solution:** ACF measures the correlation between a time series and its lagged values, including indirect correlations. PACF measures the direct correlation between a time series and its lags, controlling for the values of the time series at all shorter lags.

**Supervised Machine Learning**

1. **What is the difference between classification and regression in machine learning?**
- **Solution:** Classification predicts categorical class labels (discrete values), while regression predicts continuous numerical values.
1. **How would you split your data into training and testing sets in R?**
- **Solution:**

# Using base R

set.seed(123)

train_indices <- sample(1:nrow(data), 0.7 * nrow(data))

train_data <- data[train_indices, ]

test_data <- data[-train_indices, ]

# Using caret

library(caret)

set.seed(123)

train_indices <- createDataPartition(data$target, p = 0.7, list = FALSE)

train_data <- data[train_indices, ]

test_data <- data[-train_indices, ]

1. **What is cross-validation and why is it important?**
- **Solution:** Cross-validation is a technique where the dataset is repeatedly split into training and validation sets to assess how well a model generalizes to independent data. It's important for detecting overfitting and providing a more reliable estimate of model performance.
1. **What is the difference between a gini impurity and entropy in decision trees?**
- **Solution:** Both measure the impurity or disorder in a set of examples. Gini impurity calculates the probability of misclassifying a randomly chosen element if it were randomly labeled according to the distribution in the subset. Entropy uses information theory to measure impurity. They typically give similar results, but gini is computationally simpler.
1. **What is the value of k in k-nearest neighbors, and how do you choose it?**
- **Solution:** k is the number of nearest neighbors considered when making a prediction. Choosing k often involves:
    - Odd values of k to avoid ties in binary classification
    - Using cross-validation to find the optimal k
    - Generally, smaller k leads to more flexible models (potential overfitting), while larger k leads to smoother decision boundaries
1. **What is overfitting and how can it be prevented?**
- **Solution:** Overfitting occurs when a model learns the training data too well, including its noise and peculiarities, and performs poorly on new, unseen data. Prevention methods include:
    - Using more training data
    - Feature selection/reduction
    - Regularization techniques
    - Cross-validation
    - Pruning decision trees
    - Using ensemble methods
    - Early stopping during model training
1. **How would you handle categorical variables in machine learning models?**
- **Solution:**
    - One-hot encoding (creating binary columns for each category)
    - Label encoding (converting categories to integers)
    - Target encoding (replacing categories with the mean of the target variable)
    - Embedding (for neural networks with many categories)
- # One-hot encoding in R
- model.matrix(~ categorical_var - 1, data = df)
1. **What is feature scaling and when is it necessary?**
- **Solution:** Feature scaling is the process of normalizing the range of features in a dataset. It's necessary for algorithms that use distance measures or are sensitive to the scale of input features, such as k-nearest neighbors, support vector machines, principal component analysis, and neural networks. Common methods include:
    - Min-Max scaling: (x - min) / (max - min)
    - Standardization (Z-score normalization): (x - mean) / std_dev

**Ethics in Data Science**

1. **What is data bias and how might it affect machine learning models?**
- **Solution:** Data bias occurs when the data used to train models doesn't accurately represent the population it's meant to serve. This can lead to models that:
    - Perform worse for underrepresented groups
    - Perpetuate or amplify existing social biases
    - Make unfair or discriminatory predictions
    - Fail to generalize to the entire population
1. **What are some methods to ensure fairness in machine learning models?**
- **Solution:**
    - Pre-processing: Resampling or reweighting training data to balance representation
    - In-processing: Incorporating fairness constraints during model training
    - Post-processing: Adjusting model outputs to ensure fair predictions
    - Regular auditing of model performance across different groups
    - Diverse teams developing and evaluating models
1. **What is the difference between privacy, anonymity, and confidentiality?**
- **Solution:**
    - Privacy: The right to control one's personal information and how it's collected, used, and shared
    - Anonymity: The state of being unidentifiable within a dataset
    - Confidentiality: The obligation to protect and not disclose sensitive information without authorization
1. **What techniques can be used to create synthetic data?**
- **Solution:**
    - Statistical methods (sampling from distributions fitted to real data)
    - Agent-based modeling (simulating individual behaviors)
    - Generative models like GANs (Generative Adversarial Networks)
    - SMOTE (Synthetic Minority Over-sampling Technique) for imbalanced data
    - Data perturbation (adding noise to real data)
    - Rule-based systems for structured data
1. **What are some considerations for responsible AI development?**
- **Solution:**
    - Transparency in how models work and make decisions
    - Fairness across different demographic groups
    - Accountability for model outputs and decisions
    - Privacy protection in data collection and use
    - Security against adversarial attacks
    - Reliability and safety testing
    - Environmental sustainability (considering computational resources)
    - Alignment with human values and ethical principles

**General Data Science Concepts**

1. **What is the difference between structured and unstructured data?**
- **Solution:** Structured data is organized in a predefined format, like databases or spreadsheets, making it easily searchable and analyzable. Unstructured data lacks a predefined format (e.g., text, images, videos) and requires more complex processing techniques.
1. **What are the main steps in a typical data science project workflow?**
- **Solution:**
    1. Problem Definition/Business Understanding
    2. Data Collection
    3. Data Cleaning and Preprocessing
    4. Exploratory Data Analysis
    5. Feature Engineering
    6. Model Selection and Training
    7. Model Evaluation and Validation
    8. Model Deployment
    9. Monitoring and Maintenance
1. **What is the difference between supervised, unsupervised, and reinforcement learning?**
- **Solution:**
    - Supervised learning: Learning from labeled data to predict outcomes
    - Unsupervised learning: Finding patterns in unlabeled data
    - Reinforcement learning: Learning to take actions in an environment to maximize rewards
1. **What is the curse of dimensionality and how does it affect machine learning?**
- **Solution:** The curse of dimensionality refers to various problems that arise when analyzing data in high-dimensional spaces. As dimensions increase:
    - Data becomes sparse
    - Distance measures become less meaningful
    - More data is needed to maintain statistical significance
    - Models become more prone to overfitting
    - Computational complexity increases
1. **What are some common methods for dimensionality reduction?** - **Solution:**
    - Principal Component Analysis (PCA)
    - t-Distributed Stochastic Neighbor Embedding (t-SNE)
    - Linear Discriminant Analysis (LDA)
    - Autoencoders
    - Feature selection methods (filter, wrapper, embedded)