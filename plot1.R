## Exploratory Data Analysis - Week 1 - Course Project 1
## Plot 1

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
power <- subset(powerdt, Date >= "2007-02-01" & Date <= "2007-02-02")

## Create Plot 1
hist(power$Global_active_power, freq = TRUE, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

## Copy plot into png file 
dev.copy(png, file = "plot1.png")

## Close PNG device
dev.off()
