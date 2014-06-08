#
# Read in the power consumption file and make a plot
#   Only read consumption for dates 2007-02-01 through 2007-02-02
#   To reduce memory usage, calculate how many rows to skip and then read
#

# Get the column names
DF.row1 <- read.table("household_power_consumption.txt", 
                      header = TRUE, nrow = 1, sep = ";")

# The formatting to read the date from the file, for later
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))

# Read the Date column and use the above conversion from string to myDate
DF.Date <- read.table("household_power_consumption.txt", 
                      header = TRUE, as.is = TRUE, sep = ";",
                      colClasses = c("myDate", rep("NULL", nc - 1)))

# Find the first and last line with the right date, calculate number of rows
start_i <- which.max(DF.Date$Date == as.Date("2007-02-01"))
end_i <- which.max(DF.Date$Date > as.Date("2007-02-02"))
nr <- end_i - start_i

# Read part of the file into memory
#   Only reads the date range specified above
energy <- read.table("household_power_consumption.txt", 
                     sep =";", as.is = TRUE, header = TRUE,
                     skip = (start_i - 1), nrows = nr, 
                     col.names = names(DF.row1))

png("plot1.png", width = 480, height = 480)
hist(energy$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")
dev.off()