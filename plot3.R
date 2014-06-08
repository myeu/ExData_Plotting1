plot(energy$timestamp, energy$Sub_metering_1, 
     type="l", xlab = "", ylab = "Energy sub metering")

lines(energy$timestamp, energy$Sub_metering_2, 
       col = "red")

lines(energy$timestamp, energy$Sub_metering_3, 
       col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1))