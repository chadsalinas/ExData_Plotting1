#  Chad Salinas
#  9/19/2016
#  Exploratory Data Analysis Project1
#  The input for the script is ;-delimited text data
#  The output is 1 plot
#  There are no parameters to the script

setwd("~/Documents/JohnsHopkinsData/ExploratoryDataAnalysis/Project1")
library(data.table)
myData <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE)

# Get date and time as a comparable date/time in a single col
myData <- subset(myData, Date == "2/2/2007" | Date == "1/2/2007")
myData$Date = as.Date(myData$Date,"%d/%m/%Y")
myData$Date = as.character(myData$Date)
myData$dtString <- paste(myData$Date, myData$Time, sep = " ")
myData$dt <- strptime(myData$dtString,"%Y-%m-%d %H:%M:%S")

myData$Global_active_power = as.numeric(myData$Global_active_power)

# Specific Plot
plot(myData$dt, myData$Sub_metering_1, type = "l", ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), 
       col = c("black", "red", "blue"),
       cex = 0.8)
lines(myData$dt, myData$Sub_metering_2, col = "red")
lines(myData$dt, myData$Sub_metering_3, col = "blue")

# Cleanup
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off() 






