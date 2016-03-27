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

avgActivityPattern <- activityData %>%
    filter(!is.na(steps)) %>%
    group_by(interval) %>% 
    summarise(avg_steps = mean(steps))

activityDataFixed = within(activityData, {
    steps = ifelse(is.na(steps), 0 , steps)
})

stepsByDayFixed <- activityDataFixed %>% 
    select(steps, date) %>% 
    group_by(date) %>% 
    summarise(total_steps = sum(steps))

isWeekend <- function(dt){
    if(weekdays(ymd(dt)) %in% c("Sunday","Saturday")){
        return("WEEKEND")
    }else{
        return("WEEKDAY")
    }
}
activityDataFixed=activityDataFixed %>% rowwise() %>% mutate(wday = isWeekend(date))

aa <- activityDataFixed %>% 
    group_by(wday,interval) %>% 
    summarise(mean=mean(steps))

