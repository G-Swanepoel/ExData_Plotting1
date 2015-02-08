plot2 <- function(){
        rawdat <- read.table("household_power_consumption.txt", sep =";", skip = 66637, nrows = 2880, na.strings = "?", colClasses = c("character", "character", rep("numeric",7)))
        dummy <- read.table("household_power_consumption.txt", sep =";", nrows = 1, header = TRUE)
        names(rawdat) <- names(dummy)
        rawdat[,2] <- paste(rawdat[,1], rawdat[,2])
        rawdat[,1] <- as.Date(rawdat[,1], "%d/%m/%Y")
        dummy <- as.data.frame(strptime(rawdat[,2], "%d/%m/%Y %H:%M:%S"))
        rawdat[,2] <- dummy
        png(filename = "plot2.png", width = 480, height = 480 )
        plot(rawdat$Time, rawdat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        dev.off()
        
        
        
}