data <- read.table("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, colClasses = c( "character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ) )
data <- within( data, datetime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") ) # add a datetime column
data <- subset( data, datetime >= as.POSIXlt("2007-02-01") & datetime < as.POSIXlt("2007-02-03")) # select the time period of interest
data <- subset( data, !is.na(datetime)) # remove the NA's

par(mfrow = c(1,1)) # initialize to 1 plot

# Plot 2
plot(data$datetime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
