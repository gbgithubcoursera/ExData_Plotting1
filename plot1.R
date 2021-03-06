#!/bin/env Rscript

dataFile <- "./household_power_consumption.txt"

# Read the data into a data frame
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get only data within the specified dates by using the %in% operator.
dateRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(dateRange$Global_active_power)

# Open dev png and provide the output filename
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
