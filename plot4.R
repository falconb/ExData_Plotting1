# Read the file 
# Subset the data of interest (1/2/2007 and 2/2/2007)

dat <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880)

col_names <- c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

`colnames<-`(dat, col_names)

# Save the plot as a png file

png(filename = "plot4.png")

# PLOT HERE TO PNG DEVICE

par(mar = c(5,4,2,2))
par(mfcol = c(2,2))

# Plot the Global Active Power

plot(
  1:2880, dat$Global_active_power, 
  type = "l", 
  ylab = "Global Active Power",
  xlab = "",
  xaxt = 'n'
)

axis(
  1, 
  at = c(1, 1440, 2880), 
  labels = c('Thu', 'Fri', 'Sat')
)

# Plot Sub Metering

plot(
  1:2880, dat$Sub_metering_1, 
  type = "l", 
  ylab = "Energy sub metering",
  xlab = "",
  xaxt = 'n',
  ylim = range(c(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3))
)

points(1:2880, dat$Sub_metering_2, type = 'l', col = 'red')

points(1:2880, dat$Sub_metering_3, type = 'l', col = 'blue')

axis(
  1, 
  at = c(1, 1440, 2880), 
  labels = c('Thu', 'Fri', 'Sat')
)

legend(
  'topright', 
  c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
  lty = 1, col = c('black', 'red', 'blue'),
  bty = 'n', cex = 0.75
)

# Plot the Voltage

plot(
  1:2880, dat$Voltage, 
  type = "l", 
  ylab = "Voltage",
  xlab = "",
  xaxt = 'n'
)

axis(
  1, 
  at = c(1, 1440, 2880), 
  labels = c('Thu', 'Fri', 'Sat')
)

mtext("datetime", side = 1, line = 3, cex = 0.75)


# Plot the Global Reactive Power
plot(
  1:2880, dat$Global_reactive_power, 
  type = "l", 
  ylab = "Global_reactive_power",
  xlab = "",
  xaxt = 'n'
)

axis(
  1, 
  at = c(1, 1440, 2880), 
  labels = c('Thu', 'Fri', 'Sat')
)

mtext("datetime", side = 1, line = 3, cex = 0.75)

dev.off()