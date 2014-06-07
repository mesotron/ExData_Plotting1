
# Read the data

zipped_data<-unz("exdata-data-household_power_consumption.zip",filename="household_power_consumption.txt")
data<-read.table(zipped_data, header=T, sep=";", stringsAsFactors=F)
d <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")  #Date is in day/month/year format in this assignment

# Plot the data, creating a png file with a transparent background, just like the example.

png(file = "plot1.png", width = 504, height = 504, units = "px", bg = "transparent")
hist(as.numeric(d$Global_active_power), breaks=12, freq=T, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()