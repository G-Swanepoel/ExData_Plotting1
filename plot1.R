plot1 <- function(){
        rawdat <- read.table("household_power_consumption.txt", sep =";", skip = 66637, nrows = 2880, na.strings = "?", colClasses = c("character", "character", rep("numeric",7)))
        dummy <- read.table("household_power_consumption.txt", sep =";", nrows = 1, header = TRUE)
        names(rawdat) <- names(dummy)
        rawdat[,1] <- as.Date(rawdat[,1], "%d/%m/%Y")
        dummy <- as.data.frame(strptime(rawdat[,2], "%H:%M:%S"))
        rawdat[,2] <- dummy
        png(filename = "plot1.png", width = 480, height = 480 )
        hist(test$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")
        dev.off()
        #rawdat
        
        
}