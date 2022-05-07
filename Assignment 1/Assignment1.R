#### Exercise 1.1 #### 

## Question a: reading csv file
setwd("/Users/tenzintashi/Downloads/CSc 460 - DS/Assignment")
# file <- file.choose()
# college <- read.csv(file)
college <- read.csv('Dataset/College.csv')


## Question b: View data set
View(college)

rownames(college) <- college[, 1]
View(college)

# removing the fist column in the data where the name are stored
college <- college[,-1]
View(college)

## Question c:
# getting the summary
summary(college)

# Use pairs() to produce a scatterplot matrix
college[,1] = as.numeric(factor(college[,1]))
pairs(college[, 1:10])

# plot side by side boxplots of Outstate vs Private 
plot(college$Private, college$Outstate)

# create a new qualitative variable
Elite <- rep("No", nrow(college))
Elite[college$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(college, Elite)

summary(college$Elite)

# plot side by side boxplots of Outstate vs Elite
plot(college$Elite, college$Outstate, main = "Plot of Outstate vs. Elite", xlab = "Elite", ylab = "Outstate")

par(mfrow = c(2,2))
hist(college$Books)
hist(college$Outstate)
hist(college$Apps)
hist(college$Enroll)


#### Exercise 1.2 #### 

Auto <- read.csv('Dataset/Auto.csv', header = T, na.strings = "?")
Auto <- na.omit(Auto)

summary(Auto)

head(Auto)

## a. Which of the predictors are quantitative, and which are qualitative?
# The quantitative variables are cylinders, origin, and name
# and the rest are the qualitative.
qualitative_columns <- c(2, 8, 9)

## b. What is the range of each quantitative predictor? You can answer this using the range() function.
sapply(Auto[, -qualitative_columns], range)

## c. What is the mean and standard deviation of each quantitative predictor?
sapply(Auto[, -qualitative_columns], mean)
sapply(Auto[, -qualitative_columns], sd)

## d. Now remove the 10th through 85th observations. What is the range, mean, and standard deviation
## of each predictor in the subset of the data that remains?
sapply(Auto[-seq(10, 85), -qualitative_columns], mean)


## e. Using the full data set, investigate the predictors graphically, using scatterplots or other tools of
## your choice. Create some plots highlighting the relationships among the predictors. Comment on
## your findings.
pairs(Auto[, -qualitative_columns])

plot(Auto$year, Auto$mpg)

## f. Suppose that we wish to predict gas mileage (mpg) on the basis of the other variables. Do your plots
## suggest that any of the other variables might be useful in predicting mpg? Justify your answer.

# Lets plot some mpg vs. some of our qualitative features: 
plot(as.factor(Auto$cylinders), Auto$mpg)

plot(as.factor(Auto$origin), Auto$mpg)

