# Read the file 
# Subset the data of interest (2007-02-01 and 2007-02-02)

dat <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880)

col_names <- c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

`colnames<-`(dat, col_names)


# Save the plot as a png file

png(filename = "plot1.png")
# PLOT HERE TO PNG DEVICE
hist(
    dat$Global_active_power, 
    xlab = 'Global Active Power (kilowatts)', 
    ylab = 'Frequency', 
    main = 'Global Active Power', 
    col = 'red'
    )
dev.off()