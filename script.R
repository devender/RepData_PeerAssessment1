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

stepsByDay=activityData <- read.csv("activity.csv", header= T, na.strings = c("NA"))


