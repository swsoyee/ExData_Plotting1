setwd("D:\\coursera\\household_power_consumption")
library(data.table)
data <- fread("household_power_consumption.txt")
subData <- data[Date %in% c("1/2/2007", "2/2/2007")]

# Plot 4
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
Sys.setlocale("LC_TIME","English")
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

# Subplot 1
plot(x = as.POSIXct(paste(subData$Date, subData$Time)),
     y = subData$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
# Subplot 2
plot(x = as.POSIXct(paste(subData$Date, subData$Time)),
     y = subData$Voltage, type = "l",
     ylab = "Voltage",
     xlab = "")
# SubPlot 3
plot(x = as.POSIXct(paste(subData$Date, subData$Time)),
     y = subData$Sub_metering_1, type = "l", col = 1,
     ylab = "Energy sub metering",
     xlab = "")
lines(x = as.POSIXct(paste(subData$Date, subData$Time)),
     y = subData$Sub_metering_2, type = "l", col = 2)
lines(x = as.POSIXct(paste(subData$Date, subData$Time)),
      y = subData$Sub_metering_3, type = "l", col = 4)
legend("topright", lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c(1, 2, 4))
# Subplot 4
plot(x = as.POSIXct(paste(subData$Date, subData$Time)),
     y = subData$Global_reactive_power, type = "l",
     ylab = "Global Reactive Power",
     xlab = "")
dev.off()
