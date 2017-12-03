setwd("D:\\coursera\\household_power_consumption")
library(data.table)
data <- fread("household_power_consumption.txt")
subData <- data[Date %in% c("1/2/2007", "2/2/2007")]

# Plot 2
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
Sys.setlocale("LC_TIME","English")
png(file="plot2.png",width=480,height=480)
plot(x = as.POSIXct(paste(subData$Date, subData$Time)),
     y = subData$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()
