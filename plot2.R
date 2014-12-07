#!/bin/env Rscript

dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get only data within the specified dates by using the %in% operator.
dateRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(sprintf("%s %s",dateRange$Date,dateRange$Time), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dateRange$Global_active_power)

# open png device and provide output filename.
png("plot2.png", width=480, height=480)

# Plot by using type lines
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
