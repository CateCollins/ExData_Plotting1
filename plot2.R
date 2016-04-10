data_a <- read.table("household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", na.strings = "?", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=1439)
data_b <- read.table("household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", na.strings = "?", skip=grep("2/2/2007", readLines("household_power_consumption.txt")), nrows=1439)
data_c <- rbind(data_a, data_b)
data_c <- transform(data_c, Date=as.Date(strptime(Date, "%e/%m/%Y")), Time=strptime(paste(Date, Time), "%e/%m/%Y %H:%M:%S"))
# Create Plot 2
png(filename = "plot2.png", bg = "transparent")
plot(data_c$Time, data_c$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
# Turn off graphics device
dev.off()
