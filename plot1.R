data_set <- read.csv("household_power_consumption.txt", 
                     header= FALSE, sep = ";", skip = 66637, nrow = 2880)
names(data_set) <- c("Date", "Time", "Global_active_power","Global_reactive_power",
                                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

hist(data_set$Global_active_power,col="#ff0000", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!