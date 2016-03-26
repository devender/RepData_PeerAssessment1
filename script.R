library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)

# Setup Working dir
setwd("/Users/Devender/RepData_PeerAssessment1")
# Clean up work space
rm(list=ls())
gc()
if(!file.exists("activity.csv")){
    unzip("activity.zip")
}

#read the csv
activityData <- read.csv("activity.csv", header= T, na.strings = c("NA"), stringsAsFactors = F)
names(activityData)<-c("steps","date","inter")
str(activityData)

avgActivityPattern <- activityData %>%
    filter(!is.na(steps)) %>%
    group_by(inter) %>% 
    summarise(avg_steps = mean(steps))

findMean <- function(interval){
    subset(avgActivityPattern, avgActivityPattern$inter == interval)$avg_steps
}
activityDataFixed = within(activityData, {
    newSteps = ifelse(is.na(steps), 0 , steps)
})




