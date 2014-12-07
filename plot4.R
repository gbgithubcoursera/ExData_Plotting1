#!/bin/env Rscript

dataFile <- "./household_power_consumption.txt"

# You could also use read.csv to read the dataset into a dataframe.
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get only data within the specified dates by using the %in% operator.
dateRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime  <- strptime(sprintf("%s %s",dateRange$Date,dateRange$Time), "%d/%m/%Y %H:%M:%S")

globalActivePower   <- as.numeric(dateRange$Global_active_power)
globalReactivePower <- as.numeric(dateRange$Global_reactive_power)

voltage <- as.numeric(dateRange$Voltage)

subMetering1 <- as.numeric(dateRange$Sub_metering_1)
subMetering2 <- as.numeric(dateRange$Sub_metering_2)
subMetering3 <- as.numeric(dateRange$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="dateTime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(dateTime, globalReactivePower, type="l", xlab="dateTime", ylab="Global_reactive_power")

dev.off()
