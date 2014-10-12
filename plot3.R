# Project 1, plot 3

# Read in data for household power consumption, provided by UC Irvine
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

# Extract data subset corresponding to dates 1/2/2007 and 2/2/2007
limited_dates_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(limited_dates_data$Date, limited_dates_data$Time)
date_conv <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data_conv <- cbind(date_conv, limited_dates_data[,3:9])

# Plot
png(filename = "plot3.png")
plot(data_conv$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", axes = FALSE, frame.plot = TRUE, col = "black")
lines(data_conv$Sub_metering_2, col = "red")
lines(data_conv$Sub_metering_3, col = "blue")
axis(1, at = c(0,1500,2880), lab = c("Thu", "Fri", "Sat"))
axis(2, at = c(0,10,20,30))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black','red','blue'))
dev.off()
