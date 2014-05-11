data <- read.csv("/Users/gerrrr/Downloads/household_power_consumption.txt",
                 header = TRUE, sep = ";",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"),
                 na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename = "plot1.png", bg = "transparent")
hist(data$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
