#Reading the Data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

#Plot function & Using PNG Device
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subdata$Global_active_power)
GlobalReactivePower <- as.numeric(subdata$Global_reactive_power)
Voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)
png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

