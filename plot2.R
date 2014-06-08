
png("plot2.png", width = 480, height = 480)

plot(energy$timestamp, energy$Global_active_power, 
     type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()