#setwd("./Coursera/Exploratory Data Analysis/")

#Load Data and subset for 1/2/2007 and 2/2/2007
datafile <- "./Data/household_power_consumption/household_power_consumption.txt"
powerData <- read.table(datafile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
powerData <- subset(powerData, Date== "1/2/2007" | Date == "2/2/2007")

# Add a column for Date time
powerData$datatime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

# Reset the graphics device
if (dev.cur() !=1) dev.off()

#Open the png graphics device
fileName <- "./ExData_Plotting1/plot3.png"
png(fileName, width = 480, height = 480, units = "px")

#Plot 3
with(powerData, plot(datatime,Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering"))
with(powerData, lines(datatime, Sub_metering_1, col = "black"))
with(powerData, lines(datatime, Sub_metering_2, col = "red"))
with(powerData, lines(datatime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"), lwd = c(1,1,1))

#close the png graphics device
dev.off()