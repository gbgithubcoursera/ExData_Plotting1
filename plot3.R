#!/bin/env Rscript

# Getting full dataset
# Alternatively you could use read.table
dataComplete <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataComplete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataComplete)

# Simplify the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3
# Open the device.
png(filename="plot3.png", height=480, width=480)

with(data, {
    plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Turn of the device
dev.off()
