setwd("C:/Users/Dell/Desktop/R program/repdata_data_activity")

library(ggplot2)
library(dplyr)
library(tidyr)
library(lattice)

## Code for reading in the dataset and/or processing the data

dataSet<- read.csv("activity.csv")
date<-as.Date(dataSet$date)
dataSet$date<-format(date,"%d-%A-%Y")
new<-na.omit(dataSet)

## Histogram of the total number of steps taken each day

daywise<-tapply(new$steps,new$date,sum)
hist(daywise,col = "steelblue")

## Mean and median number of steps taken each day

summary(daywise)

## Time series plot of the average number of steps taken

Timeseries<-aggregate(steps~interval,data=new,sum)
ggplot(Timeseries,aes(x=interval,y=steps))+geom_line()+ggtitle("Time series plot of the average number of steps taken")

## The 5-minute interval that, on average, contains the maximum number of steps

new$interval[which.max(new$steps)]

## Code to describe and show a strategy for imputing missing data
dataSet_new <- dataSet
count<-is.na(dataSet_new$steps) %>% sum()
dataSet_new[is.na(dataSet_new)]<- mean(dataSet$steps,na.rm = TRUE)
print(paste("No. of rows in original data set :",nrow(dataSet)))
print(paste("No. of rows in new data set :",nrow(dataSet_new)))
print(head(dataSet_new,10))

## Histogram of the total number of steps taken each day after missing values are imputed

daywise<-tapply(dataSet_new$steps,dataSet_new$date,sum)
hist(daywise,col = "steelblue")

## Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends

dataSet_new$day<-format(as.Date(date,"%d-%A-%Y"),format="%A")
dataSet_new$Week<- ifelse(dataSet_new$day %in% c("Sunday","Saturday") ,"Weekends","Weekdays")
stepsByDay<-aggregate(steps~Week+interval,data = dataSet_new,mean)
xyplot(steps~interval|Week,data= stepsByDay,layout=c(1,2),type="l")


