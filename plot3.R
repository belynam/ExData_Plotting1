
powerConsumption <- read.table(unzip("exdata_data_household_power_consumption.zip"), header=TRUE, sep=';')

febPowerConsumption <- subset(powerConsumption, powerConsumption$Date=="1/2/2007" | powerConsumption$Date=="2/2/2007")

submetering <- data.frame(as.numeric(as.character(febPowerConsumption$Sub_metering_1)),
                          as.numeric(as.character(febPowerConsumption$Sub_metering_2)),
                          as.numeric(as.character(febPowerConsumption$Sub_metering_3)))

datetime <- strptime(paste(as.Date(febPowerConsumption$Date, "%d/%m/%Y"), febPowerConsumption$Time), "%Y-%m-%d %H:%M:%S")

png(filename="Plot3.png", width=480, height=480)

    par(mfrow=c(1,1))

    plot(datetimes, submetering[,1], type="n", ylab="Energy sub metering", xlab="")
    points(datetimes, submetering[,1], col="black", type="l")
    points(datetimes, submetering[,2], col="red", type="l")
    points(datetimes, submetering[,3], col="blue", type="l")
    legend("topright",
           col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd=2)

dev.off()
