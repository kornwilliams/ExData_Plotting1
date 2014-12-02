# This function is used to create plot4 of Exploratory Data Analysis's course project No.1
# The goal is to create a png file with 4 plots in one canvas.
# This function takes the input file path, used to read in data
# and the out put file path used to save the plots in a png file on disk.

createPlot4 <- function(input = "household_power_consumption.txt", output = "plot4.png") {
    # read in data
    data = read.csv(input, header = TRUE, sep=";",quote = "", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    # extract data measured on 2007-02-01 and 2007-02-02
    mydates = as.Date(data$Date, "%d/%m/%Y")
    date1 = as.Date("2007-02-01", "%Y-%m-%d")
    date2 = as.Date("2007-02-02", "%Y-%m-%d")
    data = data[mydates == date1 | mydates == date2,]
    
    # prepare timeline data to serve as x axe
    mydates = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    # open a new png file on disk
    png(filename = output, width = 480, height = 480)
    
    # set the layout to be 2X2
    old.par <- par(mfrow=c(2, 2))
    
    # Plot 1
    plot(mydates, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    # Plot 2
    plot(mydates, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    # Plot 3
    plot(mydates, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
    lines(x = mydates, y = data$Sub_metering_2, col = "red")
    lines(x = mydates, y = data$Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
    
    # Plot 4
    plot(mydates, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    # apply the layout and save the plots
    par(old.par)
    dev.off()
} 