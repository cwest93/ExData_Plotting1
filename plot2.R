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

#Create plot
plot(actData$DateTime, actData$Global_active_power, type = "l", xlab = "", ylab = "Gloabal Active Power (kilowatts)")

#Create png file
png("plot2.png")
plot(actData$DateTime, actData$Global_active_power, type = "l", xlab = "", ylab = "Gloabal Active Power (kilowatts)")
dev.off()