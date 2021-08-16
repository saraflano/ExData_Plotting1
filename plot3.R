## Exploratory Data Analysis - Week 1 - Course Project 1
## Plot 3

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

## Create Plot 3
plot(powersubset$dateTime, powersubset$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(powersubset$dateTime, powersubset$Sub_metering_2, col = "red")
lines(powersubset$dateTime, powersubset$Sub_metering_3, col = "blue")
legend("topright", pch = c(NA, NA, NA), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 2, cex = 1.2)

## Copy plot into png file 
dev.copy(png, file = "plot3.png")

## Close PNG device
dev.off()