
powerConsumption <- read.table(unzip("exdata_data_household_power_consumption.zip"), header=TRUE, sep=';')

febPowerConsumption <- subset(powerConsumption, powerConsumption$Date=="1/2/2007" | powerConsumption$Date=="2/2/2007")

globalActivePower <- as.numeric(as.character(febPowerConsumption$Global_active_power))

png(filename="Plot1.png", width=480, height=480)
par(mfrow=c(1,1))

hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()
