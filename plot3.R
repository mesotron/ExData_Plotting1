# Read the data

zipped_data<-unz("exdata-data-household_power_consumption.zip",filename="household_power_consumption.txt")
data<-read.table(zipped_data, header=T, sep=";", stringsAsFactors=F)
d <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")  #Date is in day/month/year format in this assignment

# Plot the data, creating a png file with a transparent background, just like the example.
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
time <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

plot(time, as.numeric(d$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(time, as.numeric(d$Sub_metering_2), type="l", col="red")
lines(time, as.numeric(d$Sub_metering_3), type="l", col="blue")
legend(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), x="topright", col=c("black", "red", "blue"), lty=1)

dev.off()