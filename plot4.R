## This plot4.R function constructs the plot and saves it to a PNG file with a width of 480 pixels and
## a height of 480 pixels, then names it as plot4.png.

## The 'household_power_consumption.txt' file is located within the working directory.

plot4 <- function() {
        
        ## Load the data set into R
        
        File.Name <- "household_power_consumption.txt"
        Data <- read.csv2(File.Name, colClasses = "character", na = "?")
        
        ## Subset data to only contains rows for 2007-02-01 and 2007-02-02 
        
        Data$Date <- strptime(Data$Date, "%d/%m/%Y")
        DataToUse <- subset(Data, Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02")
        DataToUse$Time <- strptime(paste(DataToUse$Date, DataToUse$Time), "%Y-%m-%d %H:%M:%S")
        
        ## Set the numeric data to correct type 
        
        for(i in 3:9){
                DataToUse[, i] <- as.numeric(DataToUse[, i])
        }
        
        ## Create the plot4.png file with 4 diagrams
        
        png("plot4.png", width = 480, height = 480)
        
        par(mfcol = c(2, 2))
        
        ## 1st diagram
        
        plot(DataToUse$Time, DataToUse$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power (kilowatts)"
             )
        
        ## 2nd diagram
        
        plot(DataToUse$Time,
             DataToUse$Sub_metering_1,
             type = "l",
             col = "black",
             xlab = "",
             ylab = "Energy sub metering"
             )
        lines(DataToUse$Time,
              DataToUse$Sub_metering_2,
              type = "l", 
              col = "red"
              )
        lines(DataToUse$Time,
              DataToUse$Sub_metering_3,
              type = "l",
              col = "blue"
              )
        legend("topright",
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1,
               bty = "n"
               )
        
        ## 3rd diagram
        
        plot(DataToUse$Time, DataToUse$Voltage,
             type="l",
             xlab="datetime",
             ylab="Voltage"
             )
        
        ## 4th diagram
        
        plot(DataToUse$Time, DataToUse$Global_reactive_power,
             type="l",
             xlab="datetime",
             ylab="Global_reactive_power"
             )
        
        dev.off()
}