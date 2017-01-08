
powerConsumption <- read.table(unzip("exdata_data_household_power_consumption.zip"), header=TRUE, sep=';')

febPowerConsumption <- subset(powerConsumption, powerConsumption$Date=="1/2/2007" | powerConsumption$Date=="2/2/2007")

globalActivePower <- as.numeric(as.character(febPowerConsumption$Global_active_power))

datetime <- strptime(paste(as.Date(febPowerConsumption$Date, "%d/%m/%Y"), febPowerConsumption$Time), "%Y-%m-%d %H:%M:%S")

png(filename="Plot2.png", width=480, height=480)

    par(mfrow=c(1,1))

    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
