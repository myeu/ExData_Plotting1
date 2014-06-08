
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

with(energy, {plot(timestamp, Global_active_power, 
                   type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
              
              plot(timestamp, Voltage, type = "l", xlab = "datetime")
              
              {plot(timestamp, Sub_metering_1, 
                     type="l", xlab = "", ylab = "Energy sub metering")
               lines(timestamp, energy$Sub_metering_2, 
                      col = "red")
               lines(timestamp, energy$Sub_metering_3, 
                      col = "blue")
               legend("topright", col = c("black", "red", "blue"), 
                       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                       lty = c(1,1,1), bty="n")
              }
              
              plot(timestamp, Global_reactive_power, 
                   type="l", xlab = "datetime", ylab = "Global_reactive_power")
              })

dev.off()