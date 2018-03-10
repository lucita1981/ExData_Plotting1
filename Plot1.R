#Reading the Data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

#Plot function & Using PNG Device
GlobalActivePower <- as.numeric(subdata$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab = "Frecuency")
dev.off()