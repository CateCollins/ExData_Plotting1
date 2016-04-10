data_a <- read.table("household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", na.strings = "?", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=1439)
data_b <- read.table("household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", na.strings = "?", skip=grep("2/2/2007", readLines("household_power_consumption.txt")), nrows=1439)
data_c <- rbind(data_a, data_b)
data_c <- transform(data_c, Date=as.Date(strptime(Date, "%e/%m/%Y")), Time=strptime(paste(Date, Time), "%e/%m/%Y %H:%M:%S"))
# Create Plot 4
png(filename = "plot4.png", bg = "transparent")
par(mfrow=c(2,2))
plot(data_c$Time, data_c$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
plot(data_c$Time, data_c$Voltage, type="l", ylab="Voltage", xlab = "datetime", bg="white")
with(data_c,{
    plot(Time, Sub_metering_1, type="l", col = "black", xlab = "", ylab="Energy sub metering")
    lines(Time, Sub_metering_2, type="l", col="red")
    lines(Time, Sub_metering_3, type="l", col="blue")
    legend("topright", bty = "n", lty=1, lwd = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
plot(data_c$Time, data_c$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")
# Turn off graphics device
dev.off()
