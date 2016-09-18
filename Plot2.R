#setwd("./Coursera/Exploratory Data Analysis/")

#Load Data and subset for 1/2/2007 and 2/2/2007
datafile <- "./Data/household_power_consumption/household_power_consumption.txt"
powerData <- read.table(datafile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
powerData <- subset(powerData, Date== "1/2/2007" | Date == "2/2/2007")

# Add a column for Date time
powerData$datetime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

# Reset the graphics device
if (dev.cur() !=1) dev.off()

#Open the png graphics device
fileName <- "./ExData_Plotting1/plot2.png"
png(fileName, width = 480, height = 480, units = "px")


#Create the second Plot 
with(powerData, plot(datetime, Global_active_power, type = "n", xlab="", ylab = "Global Active Power (kilowatts)"))
with(powerData, lines(datetime, Global_active_power))

#Close the png graphics device
dev.off()