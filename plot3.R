png("plot3.png", width = 480, height = 480)

with(energy, {
  plot(timestamp, energy$Sub_metering_1, 
       type="l", xlab = "", ylab = "Energy sub metering")
  
  lines(timestamp, energy$Sub_metering_2, 
       col = "red")
  
  lines(timestamp, energy$Sub_metering_3, 
       col = "blue")
  
  legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), bty="n")
})

dev.off()