# Read the data

zipped_data<-unz("exdata-data-household_power_consumption.zip",filename="household_power_consumption.txt")
data<-read.table(zipped_data, header=T, sep=";", stringsAsFactors=F)
d <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")  #Date is in day/month/year format in this assignment

# Plot the data, creating a png file with a transparent background, just like the example.

png(file = "plot4.png", width = 504, height = 504, units = "px", bg = "transparent")

datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

# Set up a 2x2 grid of plots
par(mfrow = c(2, 2))

# Plot 1
plot(datetime, as.numeric(d$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Plot 2
plot(datetime, as.numeric(d$Voltage), type="l", ylab="Voltage")

# Plot 3
plot(datetime, as.numeric(d$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(datetime, as.numeric(d$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(d$Sub_metering_3), type="l", col="blue")
legend(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), x="topright", col=c("black", "red", "blue"), lty=1)

# Plot 4
plot(datetime, as.numeric(d$Global_reactive_power), type="l", ylab="Global_reactive_power")

dev.off()
