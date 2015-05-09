## This plot1.R function constructs the plot and saves it to a PNG file with a width of 480 pixels and
## a height of 480 pixels, then names it as plot1.png.

## The 'household_power_consumption.txt' file is located within the working directory.

plot1 <- function() {
        
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
        
        ## Create the plot1.png file with 'Global Active Power' histogram
        
        png("plot1.png", width = 480, height = 480)
        
        hist(DataToUse$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             col="red"
        )
        
        dev.off()
}