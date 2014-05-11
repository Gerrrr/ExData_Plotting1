data <- read.csv("/Users/gerrrr/Downloads/household_power_consumption.txt",
                 header = TRUE, sep = ";",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"),
                 na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", bg = "transparent")

plot(data$DateTime, data$Global_active_power,
     type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
