# Reproducible Research: Peer Assessment 1
Devender R. Gollapally  

## Introduction

Using the data from a personal activity monitoring device this project we will try to answer the following questions:

1. **What is mean total number of steps taken per day ?**
2. **What is the average daily activity pattern ?**
3. **Are there differences in activity patterns between weekdays and weekends ?**

The device used, collects data at 5 minute intervals. The data consists of two months collected during the months of October and November, 2012 and include the number of steps taken each day.

## Data Source

The data used in this assignment can be downloaded from this [LINK](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip).



## Loading and preprocessing the data



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

```r
dim(activityData)
```

```
## [1] 17568     3
```

```r
names(activityData)
```

```
## [1] "steps"    "date"     "interval"
```

#### Histogram of the total number of steps taken each day

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:data.table':
## 
##     between, last
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```
## Warning: package 'ggplot2' was built under R version 3.2.4
```

```r
## What is mean total number of steps taken per day?



## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
```
