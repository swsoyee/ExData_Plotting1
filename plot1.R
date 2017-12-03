setwd("D:\\coursera\\household_power_consumption")
library(data.table)
data <- fread("household_power_consumption.txt")
subData <- data[Date %in% c("1/2/2007", "2/2/2007")]

# Plot 1
png(file="plot1.png",width=480,height=480)
hist(x = as.numeric(subData$Global_active_power),
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
