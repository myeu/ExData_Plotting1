

DF.row1 <- read.table("household_power_consumption.txt", 
                      header = TRUE, nrow = 1, sep = ";")

setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))

DF.Date <- read.table("household_power_consumption.txt", 
                      header = TRUE, as.is = TRUE, sep = ";",
                      colClasses = c("myDate", rep("NULL", nc - 1)))

start_i <- which.max(DF.Date$Date == as.Date("2007-02-01"))
end_i <- which.max(DF.Date$Date > as.Date("2007-02-02"))
nr <- end_i - start_i

energy <- read.table("household_power_consumption.txt", 
                     sep =";", as.is = TRUE, header = TRUE,
                     skip = (start_i - 1), nrows = nr, 
                     col.names = names(DF.row1), 
                     colClasses = c("myDate", "factor", rep("numeric", nc - 2)))