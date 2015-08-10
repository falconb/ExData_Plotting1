# Read the file 
# Subset the data of interest (1/2/2007 and 2/2/2007)

dat <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880)

col_names <- c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

`colnames<-`(dat, col_names)

# Save the plot as a png file

png(filename = "plot2.png")

# PLOT HERE TO PNG DEVICE
plot(
  1:2880, dat$Global_active_power, 
  type = "l", 
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  xaxt = 'n'
)

axis(
  1, 
  at = c(1, 1440, 2880), 
  labels = c('Thu', 'Fri', 'Sat')
)

dev.off()