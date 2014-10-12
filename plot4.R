# Project 1, plot 4

# Read in data for household power consumption, provided by UC Irvine
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

# Extract data subset corresponding to dates 1/2/2007 and 2/2/2007
limited_dates_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(limited_dates_data$Date, limited_dates_data$Time)
date_conv <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data_conv <- cbind(date_conv, limited_dates_data[,3:9])

# Plot
png(filename = "plot4.png")
par(mfrow = c(2,2))
# plot at 1,1
plot(data_conv$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", axes = FALSE, frame.plot = TRUE)
axis(1, at = c(0,1500,2880), lab = c("Thu", "Fri", "Sat"))
axis(2, at = c(0,2,4,6))
# plot at 1,2
plot(data_conv$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", axes = FALSE, frame.plot = TRUE)
axis(1, at = c(0,1500,2880), lab = c("Thu", "Fri", "Sat"))
axis(2, at = c(234,236,238,240,242,244,246), lab = c("234","","238","","242","","246"))
#plot at 2,1
plot(data_conv$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", axes = FALSE, frame.plot = TRUE, col = "black")
lines(data_conv$Sub_metering_2, col = "red")
lines(data_conv$Sub_metering_3, col = "blue")
axis(1, at = c(0,1500,2880), lab = c("Thu", "Fri", "Sat"))
axis(2, at = c(0,10,20,30))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black','red','blue'), bty = "n")
#plot at 2,2
plot(data_conv$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", axes = FALSE, frame.plot = TRUE)
axis(1, at = c(0,1500,2880), lab = c("Thu", "Fri", "Sat"))
axis(2, at = c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.off()
