#### Exercise 2 #### 

## Question a: reading csv file
setwd("/Users/tenzintashi/Downloads/CSc 460 - DS/Assignment")
# file <- file.choose()
# zeta <- read.csv(file)
zeta <- read.csv(file='Dataset/zeta.csv', header=TRUE, sep=",")
View(zeta)

## Question b: change column names from zcta to zipcode and meanhouseholdincome to income
names(zeta)[2] <- "zipCode"
names(zeta)[7] <- "income"
View(zeta)

## Question c: Summary of data
summary(zeta)
# Mean average Income = 48245
# Median average Income = 44163

## Question d: scatter plot
install.packages('ggplot2')
library(ggplot2)
data(zeta)
df <- zeta[, c("income", "zipCode")]
head(df)
qplot(x = income, y = zipCode, data = df, geom = "point")

## Question e: 


## Question f: 


## Question g: 


## Question h: 


#### Exercise 2.2 #### 
