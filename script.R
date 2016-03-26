library(futile.logger)
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

activityData <- read.csv("activity.csv", header= T, na.strings = c("NA"))

stepsByDay <- activityData %>% 
    select(steps, date) %>% 
    filter(!is.na(steps)) %>%
    group_by(date) %>% 
    summarise(total_steps = sum(steps))

ggplot(stepsByDay, aes(x=total_steps)) + 
    geom_histogram(colour="black", fill="white", bins=10)+
    xlab("Steps") +ylab("Frequency") +
    ggtitle("Total number of steps taken each day")

avgActivityPattern <- activityData %>%
            select(steps,interval)%>%
            filter(!is.na(steps)) %>%
            group_by(interval) %>% 
            summarise(avg_steps = mean(steps))

ggplot(avgActivityPattern, aes(x=interval)) + 
    geom_line( aes(y=avg_steps)) +
    xlab("Interval of Day") +ylab("Average Number of Steps") +
    ggtitle("Avg Daily Activity Pattern")



