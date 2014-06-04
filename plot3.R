# plot3.R
# Draw a time series chart of Sub meterings.

# set locale
lc = Sys.setlocale(locale="en_US.UTF-8")

# read whole data from file
data = read.table('household_power_consumption.txt',
                  sep=';', header=T, na.string='?')

# subset specific rows
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# set DateTime column
data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# open png device and write a chart into it.
png = png('plot3.png', width=480, height=480, bg="transparent")

with(data,
     plot(DateTime, Sub_metering_1, type='n',
          ylab="Energy sub metering", xlab=""))
with(data,
     lines(DateTime, Sub_metering_1, type='l', col='black'))
with(data,
     lines(DateTime, Sub_metering_2, type='l', col='red'))
with(data,
     lines(DateTime, Sub_metering_3, type='l', col='blue'))
legend("topright",
       lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c('black', 'red', 'blue'))

dev.off()