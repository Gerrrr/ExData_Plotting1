data <- read.csv("/Users/gerrrr/Downloads/household_power_consumption.txt",
                 header = TRUE, sep = ";",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"),
                 na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename = "plot3.png", bg = "transparent")

data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

plot(data$DateTime, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
