#  Chad Salinas
#  9/16/2016
#  Exploratory Data Analysis Project1
#  The input for the script is ;-delimited text data
#  The output is 1 plot
#  There are no parameters to the script

setwd("~/Documents/JohnsHopkinsData/ExploratoryDataAnalysis/Project1")

library(data.table)
myData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- myData[myData$Date == "2007-2-1" | myData$Date == "2007-2-2", ]
myData$Global_active_power <- as.numeric(myData$Global_active_power)

# Specific Plot 
DateTime <- as.POSIXct(paste(myData$Date, myData$Time), format="%Y-%m-%d %H:%M:%S")
myData <- cbind(DateTime, myData)
par(mar=c(2, 4, 2, 0.5))
plot(myData$DateTime, myData$Global_active_power/500, pch = "|",
     xlab = "", ylab = "Global Active Power (kilowatts)")





