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
myData$Sub_metering_1 <- as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2 <- as.numeric(myData$Sub_metering_2)
myData$Sub_metering_3 <- as.numeric(myData$Sub_metering_3)

DateTime <- as.POSIXct(paste(myData$Date, myData$Time), format="%Y-%m-%d %H:%M")
myData <- cbind(DateTime, myData)
par(mar=c(2, 4, 2, 0.5))
par(mfrow = c(2,2))


#Plot 1
plot(myData$DateTime, myData$Global_active_power/500, pch = "|",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot 2
plot(myData$DateTime, myData$Voltage, pch = "|",
     xlab = "datetime", ylab = "Voltage")

#Plot 3
yticks <- seq(0, 40, 10)
with(myData, plot(DateTime, Sub_metering_1, pch = "|",
     xlab = "", ylab = "Energy sub metering", ylim=c(0, 40), type="n"))

legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),
       lwd=c(2.5,2.5, 2.5),col=c("black","red","blue")) 

axis(2, at = yticks, labels = yticks)

with(subset(myData, Sub_metering_1 >= 30 | Sub_metering_1 <= 2), 
     points(DateTime, Sub_metering_1, pch = "|", type="l")) 

with(subset(myData, Sub_metering_2 != 14), 
     points(DateTime, Sub_metering_2, pch = "|", col = "red",  type="l")) 

lines(myData$DateTime, myData$Sub_metering_3, pch = "|", col = "blue", type="l") 

#Plot 4
plot(myData$DateTime, myData$Global_reactive_power, pch = "|",
     xlab = "datetime", ylab = "Global_reactive_power")





