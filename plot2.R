# This function is used to create plot2 of Exploratory Data Analysis's course project No.1
# The goal is to create a png file with a single histogram plot.
# This function takes the input file path, used to read in data
# and the out put file path used to save the plots in a png file on disk.

createPlot2 <- function(input = "household_power_consumption.txt", output = "plot2.png") {
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
    
    # draw the olot
    plot(mydates, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    # save the plot
    dev.off()
} 