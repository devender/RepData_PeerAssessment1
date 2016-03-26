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
    group_by(date) %>% 
    summarise(total_steps = sum(steps))

ggplot(stepsByDay, aes(x=total_steps)) + 
    geom_histogram(aes(y=..density..), colour="black", fill="white", bins=30)+
    geom_density(alpha=.2, fill="#FF6666") 



