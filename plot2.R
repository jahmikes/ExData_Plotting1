data_set <- read.csv("household_power_consumption.txt", 
                     header= FALSE, sep = ";", skip = 66637, nrow = 2880)

names(data_set) <- c("Date", "Time", "Global_active_power","Global_reactive_power",
                     "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data_set$date_time <- strptime(paste(data_set$Date, data_set$Time), "%d/%m/%Y %H:%M:%S")


plot(data_set$date_time, data_set$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!