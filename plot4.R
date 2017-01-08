
powerConsumption <- read.table(unzip("exdata_data_household_power_consumption.zip"), header=TRUE, sep=';')

febPowerConsumption <- subset(powerConsumption, powerConsumption$Date=="1/2/2007" | powerConsumption$Date=="2/2/2007")

globalActivePower <- as.numeric(as.character(febPowerConsumption$Global_active_power))

globalReactivePower <- as.numeric(as.character(febPowerConsumption$Global_reactive_power))

voltage <- as.numeric(as.character(febPowerConsumption$Voltage))

submetering <- data.frame(as.numeric(as.character(febPowerConsumption$Sub_metering_1)),
                          as.numeric(as.character(febPowerConsumption$Sub_metering_2)),
                          as.numeric(as.character(febPowerConsumption$Sub_metering_3)))

datetime <- strptime(paste(as.Date(febPowerConsumption$Date, "%d/%m/%Y"), febPowerConsumption$Time), "%Y-%m-%d %H:%M:%S")

png(filename="Plot4.png", width=480, height=480)

    par(mfrow=c(2,2))

    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

    plot(datetime, voltage, type="l", ylab="Voltage")

    plot(datetimes, submetering[,1], type="n", ylab="Energy sub metering", xlab="")
    points(datetimes, submetering[,1], col="black", type="l")
    points(datetimes, submetering[,2], col="red", type="l")
    points(datetimes, submetering[,3], col="blue", type="l")
    legend("topright",
           col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd=2,
           bty="n")

    plot(datetime, globalReactivePower, type="l", ylab="Global_reactive_power")

dev.off()
