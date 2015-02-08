data_set <- read.csv("household_power_consumption.txt", 
                     header= FALSE, sep = ";", skip = 66637, nrow = 2880)

names(data_set) <- c("Date", "Time", "Global_active_power","Global_reactive_power",
                     "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data_set$date_time <- strptime(paste(data_set$Date, data_set$Time), "%d/%m/%Y %H:%M:%S")


par(mfrow = c(2, 2))

# plot 1 (1, 1)
plot(data_set$date_time, data_set$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# plot 2 (1, 2)
plot(data_set$date_time, data_set$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (2, 1)
plot(data_set$date_time, data_set$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")

points(data_set$date_time, data_set$Sub_metering_2, type = "l", 
       ylab = "Sub_metering_2", col = "#ff0000")

points(data_set$date_time, data_set$Sub_metering_3, type = "l", 
       ylab = "Sub_metering_3", col = "#0000ff")

legend("topright", lty = 1, cex = 0.75,col = c("#000000", "#ff0000", "#0000ff"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (2, 2)
plot(data_set$date_time, data_set$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5), cex.axis = 0.8)

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

