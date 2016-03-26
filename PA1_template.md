# Reproducible Research: Peer Assessment 1
Devender R. Gollapally  

## Introduction

Using the data from a personal activity monitoring device this project we will try to answer the following questions:

1. **What is mean total number of steps taken per day ?**
2. **What is the average daily activity pattern ?**
3. **Are there differences in activity patterns between weekdays and weekends ?**

The device used, collects data at 5 minute intervals. The data consists of two months collected during the months of October and November, 2012 and include the number of steps taken each day.

## Data Source

The data used in this assignment can be downloaded from this [Link](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip) on the course website, it is also included in the [github repository](https://github.com/devender/RepData_PeerAssessment1).

##### R workspace setup

```r
library(data.table)
library(dplyr)
library(ggplot2)

# Setup Working dir
setwd("/Users/Devender/RepData_PeerAssessment1")
# Clean up work space
rm(list=ls())
gc()
if(!file.exists("activity.csv")){
    unzip("activity.zip")
}
```

## Loading and preprocessing the data
Reading the CSV file into a data frame.

```r
activityData <- read.csv("activity.csv", header= T, na.strings = c("NA"))
str(activityData)
```

```
## 'data.frame':	17568 obs. of  3 variables:
##  $ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ interval: int  0 5 10 15 20 25 30 35 40 45 ...
```

## Data Exploration

Subsetting the data and grouping by each day, gives us total number of steps for each day.

```r
stepsByDay <- activityData %>% 
                select(steps, date) %>% 
                group_by(date) %>% 
                summarise(total_steps = sum(steps))
head(stepsByDay)
```

```
## Source: local data frame [6 x 2]
## 
##         date total_steps
##       (fctr)       (int)
## 1 2012-10-01          NA
## 2 2012-10-02         126
## 3 2012-10-03       11352
## 4 2012-10-04       12116
## 5 2012-10-05       13294
## 6 2012-10-06       15420
```
Using the above data we can plot a histogram of the total number of steps taken each day


```r
ggplot(stepsByDay, aes(x=total_steps)) + 
    geom_histogram(aes(y=..density..), colour="black", fill="white", bins=30)+
    geom_density(alpha=.2, fill="#FF6666") +
    ggtitle("Number of steps taken per day")
```

![](PA1_template_files/figure-html/unnamed-chunk-4-1.png)
####


## What is mean total number of steps taken per day?


## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
