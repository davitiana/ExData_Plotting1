# Project 1, plot 2

# Read in data for household power consumption, provided by UC Irvine
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

# Extract data subset corresponding to dates 1/2/2007 and 2/2/2007
limited_dates_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(limited_dates_data$Date, limited_dates_data$Time)
date_conv <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data_conv <- cbind(date_conv, limited_dates_data[,3:9])

# Plot
png(filename = "plot2.png")
plot(data_conv$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", axes = FALSE, frame.plot = TRUE)
axis(1, at = c(0,1500,2880), lab = c("Thu", "Fri", "Sat"))
axis(2, at = c(0,2,4,6))
dev.off()
