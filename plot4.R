#Create column labels and load data
lbl = c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")
data = read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=lbl)
#Specify range of data
actData = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#Change data to date format
as.Date(actData$Date)
#Remove null values
actData = na.omit(actData)
#Create Datetime vector
actData$DateTime = paste(actData$Date, actData$Time)
actData$DateTime = as.POSIXct(actData$DateTime)

#Allow 4 plots
par(mfrow=c(2,2))
#Create plot 1
plot(actData$DateTime, actData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
#Create plot 2
plot(actData$DateTime, actData$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
#Create plot 3
plot(actData$DateTime, actData$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(actData$DateTime, actData$Sub_metering_2, col = 'Red')
lines(actData$DateTime, actData$Sub_metering_3, col = 'Blue')
#Create plot 4
plot(actData$DateTime, actData$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

#Create png file
png("plot4.png")
par(mfrow=c(2,2))
plot(actData$DateTime, actData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
plot(actData$DateTime, actData$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(actData$DateTime, actData$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(actData$DateTime, actData$Sub_metering_2, col = 'Red')
lines(actData$DateTime, actData$Sub_metering_3, col = 'Blue')
plot(actData$DateTime, actData$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()