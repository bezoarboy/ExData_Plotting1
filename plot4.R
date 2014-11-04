data <- read.table("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, colClasses = c( "character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ) )
data <- within( data, datetime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") ) # add a datetime column
data <- subset( data, datetime >= as.POSIXlt("2007-02-01") & datetime < as.POSIXlt("2007-02-03")) # select the time period of interest
data <- subset( data, !is.na(datetime)) # remove the NA's

# Plot 4
par(mfrow = c(2, 2))
    with(data, {
        plot(datetime, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
        plot(datetime, Voltage, type = "l", ylab = "Voltage")
        with(data,plot(datetime, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "" ))
        with(data,lines(datetime, Sub_metering_1 ))
        with(data,lines(datetime, Sub_metering_2, col = "red" ))
        with(data,lines(datetime, Sub_metering_3, col = "blue" ))
        legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
        plot(datetime, Global_reactive_power, type="l")
    })
dev.copy(png, file = "plot4.png")
dev.off()
