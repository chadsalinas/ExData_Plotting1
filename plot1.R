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
yticks <- seq(0, 1200, 200)
hist(myData$Global_active_power/500, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", axes = FALSE)
axis(1)
axis(2, at = yticks, las=2)



