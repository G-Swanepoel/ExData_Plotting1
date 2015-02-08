plot3 <- function(){
        rawdat <- read.table("household_power_consumption.txt", sep =";", skip = 66637, nrows = 2880, na.strings = "?", colClasses = c("character", "character", rep("numeric",7)))
        dummy <- read.table("household_power_consumption.txt", sep =";", nrows = 1, header = TRUE)
        names(rawdat) <- names(dummy)
        rawdat[,2] <- paste(rawdat[,1], rawdat[,2])
        rawdat[,1] <- as.Date(rawdat[,1], "%d/%m/%Y")
        dummy <- as.data.frame(strptime(rawdat[,2], "%d/%m/%Y %H:%M:%S"))
        rawdat[,2] <- dummy
        png(filename = "plot3.png", width = 480, height = 480 )
        plot(rawdat$Time, rawdat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        points(rawdat$Time, rawdat$Sub_metering_2, type = "l", col = "red")
        points(rawdat$Time, rawdat$Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        
        
        
}