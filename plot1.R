# This function is used to create plot1 of Exploratory Data Analysis's course project No.1
# The goal is to create a png file with a single histogram plot.
# This function takes the input file path, used to read in data
# and the out put file path used to save the plots in a png file on disk.

createPlot1 <- function(input = "household_power_consumption.txt", output = "plot1.png") {
    # read in data
    data = read.csv(input, header = TRUE, sep=";",quote = "", na.strings = "?")
    
    # extract data measured on 2007-02-01 and 2007-02-02
    data$Date = as.Date(data$Date, "%d/%m/%Y")
    date1 = as.Date("2007-02-01", "%Y-%m-%d")
    date2 = as.Date("2007-02-02", "%Y-%m-%d")
    data = data[data$Date == date1 | data$Date == date2,]
    
    # open a new png file on disk
    png(filename = output, width = 480, height = 480)
    
    # draw the histogram plot
    hist(data$Global_active_power, col = "red", main = "Global Active Power", ylim = c(0,1200), xlab = "Global Active Power (kilowatts)")
    
    # save the plot
    dev.off()
} 