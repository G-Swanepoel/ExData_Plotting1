plot4 <- function(){
        rawdat <- read.table("household_power_consumption.txt", sep =";", skip = 66637, nrows = 2880, na.strings = "?", colClasses = c("character", "character", rep("numeric",7)))
        dummy <- read.table("household_power_consumption.txt", sep =";", nrows = 1, header = TRUE)
        names(rawdat) <- names(dummy)
        rawdat[,2] <- paste(rawdat[,1], rawdat[,2])
        rawdat[,1] <- as.Date(rawdat[,1], "%d/%m/%Y")
        dummy <- as.data.frame(strptime(rawdat[,2], "%d/%m/%Y %H:%M:%S"))
        rawdat[,2] <- dummy
        png(filename = "plot4.png", width = 480, height = 480 )
        par(mfrow = c(2,2))
        plot(rawdat$Time, rawdat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(rawdat$Time, rawdat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(rawdat$Time, rawdat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        points(rawdat$Time, rawdat$Sub_metering_2, type = "l", col = "red")
        points(rawdat$Time, rawdat$Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(rawdat$Time, rawdat$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
        
        dev.off()
        
        
        
}