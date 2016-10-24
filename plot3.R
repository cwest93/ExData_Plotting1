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

#Create Plot
plot(actData$DateTime, actData$Sub_metering_1, type="l", xlab= "", ylab="Energy sub metering")
#Add line for Sub_metering_2 in red
lines(actData$DateTime, actData$Sub_metering_2, col = 'Red')
#Add line for Sub_metering_3 in blue
lines(actData$DateTime, actData$Sub_metering_3, col = 'Blue')
#Create labels for legend
legend("topright", lty=1, lwd =3, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create png file
png("plot3.png")
plot(actData$DateTime, actData$Sub_metering_1, type="l", xlab= "", ylab="Energy sub metering")
lines(actData$DateTime, actData$Sub_metering_2, col = 'Red')
lines(actData$DateTime, actData$Sub_metering_3, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
