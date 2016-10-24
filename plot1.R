#Create column labels and load data
lbl = c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")
data = read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=lbl)
#Specify range of data
actData = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#Change data to date format
as.Date(actData$Date)
#Remove null values
actData = na.omit(actData)

#Create Histogram
hist(actData$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#Create PNG File
png("plot1.png")
hist(actData$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()