#  Chad Salinas
#  9/16/2016
#  Exploratory Data Analysis Project1
#  The input for the script is ;-delimited text data
#  The output are 4 plots
#  There are no parameters to the script

setwd("~/Documents/JohnsHopkinsData/ExploratoryDataAnalysis/Project1")

library(data.table)
library(dplyr)

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
mydata <- data[data$Date == "2007-2-1" | data$Date == "2007-2-2", ]

# Test these changes show up on Github




