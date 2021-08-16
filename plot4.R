## Exploratory Data Analysis - Week 1 - Course Project 1
## Plot 4

## Download and read data and format Date and Tome variables
power.file <- "~/Desktop/Gorkin\ Lab/Coursera/household_power_consumption.txt"
powerdt <- read_delim(power.file, delim = ";", escape_double = FALSE, 
                      col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                       Time = col_time(format = "%H:%M:%S"),
                                       Global_active_power = col_number(),
                                       Global_reactive_power = col_number(),
                                       Voltage = col_number(), Global_intensity = col_number()), 
                      trim_ws = TRUE)
head(powerdt)

##Subset data to dates 2007-02-01 and 2007-02-02
powersubset <- subset(powerdt, Date == "2007-02-01" | Date == "2007-02-02")

## Create dateTime variable 
dateTime <- paste(powersubset$Date, powersubset$Time)
powersubset$dateTime <-  dateTime
powersubset$dateTime <- as.POSIXct(powersubset$dateTime)

## Create Plot 4 sections
par(mfcol = c(2, 2))

## Create and add Plot 2 to top left of Plot 4
plot(powersubset$dateTime, powersubset$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Create and add Plot 3 to bottom left of Plot 4
plot(powersubset$dateTime, powersubset$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(powersubset$dateTime, powersubset$Sub_metering_2, col = "red")
lines(powersubset$dateTime, powersubset$Sub_metering_3, col = "blue")
legend("topright", pch = c(NA, NA, NA), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 2, cex = 1.2, bty = "n")

## Create and add plot to top right
plot(powersubset$dateTime, powersubset$Voltage, 
     type="l", xlab="dateTime", ylab="Voltage")

## Create and at plot to bottom right
plot(powersubset$dateTime, powersubset$Global_reactive_power, 
     type="l", xlab="dateTime", ylab="Global_reactive_power")

## Copy plot into png file 
dev.copy(png, file = "plot4.png")

## Close PNG device
dev.off()