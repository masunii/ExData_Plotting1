getwd()
setwd("C:/Users/aaa/Desktop/R/coursera")
data1 <- read.table(file = "C:/Users/aaa/Desktop/R/coursera/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data2 <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
data2$datetime <- as.POSIXct(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2), mar=c(5,5,2,1))
plot(data2$datetime, data2$Global_active_power, type ='l', ylab = "Global Active Power", xlab ="")
plot(data2$datetime, data2$Voltage, type ='l', ylab = "Voltage", xlab ="datetime")
plot(data2$datetime, data2$Sub_metering_1, type ='l', ylab = "Energy sub metering", xlab ="")
lines(data2$datetime, data2$Sub_metering_1, type ='l', col = "black")
lines(data2$datetime, data2$Sub_metering_2, type ='l', col = "red")
lines(data2$datetime, data2$Sub_metering_3, type ='l', col = "blue")
legend("topright", lty = 1, lwd = 1, cex = 0.2, y.intersp = 0.2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"))
plot(data2$datetime, data2$Global_reactive_power, type ='l', ylab = "Global_reactive_power", xlab ="datetime")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
dev.off()
dev.copy(png, file="plot4.png")
dev.off()

