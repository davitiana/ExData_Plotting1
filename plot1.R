# Project 1, plot 1

# Read in data for household power consumption, provided by UC Irvine
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

# Extract data subset corresponding to dates 1/2/2007 and 2/2/2007
limited_dates_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date_time <- paste(limited_dates_data$Date, limited_dates_data$Time)
date_conv <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data_conv <- cbind(date_conv, limited_dates_data[,3:9])

# Plot histogram
png(filename = "plot1.png")
hist(data_conv$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()