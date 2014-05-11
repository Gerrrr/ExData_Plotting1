data <- read.csv("/Users/gerrrr/Downloads/household_power_consumption.txt",
                 header = TRUE, sep = ";",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"),
                 na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

data$DateTime <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png", bg = "transparent")
par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data$DateTime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(data$DateTime, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, data$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
