# plot4.R
# Draw four time series charts in one canvas.

# set locale
Sys.setlocale(locale="en_US.UTF-8")

# read whole data from file
data = read.table('household_power_consumption.txt',
                  sep=';', header=T, na.string='?')

# subset specific rows
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# open png device and write a chart into it.
png = png('plot4.png', width=480, height=480, bg="transparent")

# divide into 2x2 sub plots.
par(mfcol=c(2, 2))

# first plot
with(data,
     plot(DateTime, Global_active_power, type='l',
          ylab="Global Active Power (kilowatts)", xlab=""))

# second plot
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
       lwd=1, box.lwd=0,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c('black', 'red', 'blue'))

# third plot
with(data,
     plot(DateTime, Voltage, type='l', xlab="datetime"))

# fourth plot
with(data,
     plot(DateTime, Global_reactive_power, type='l', xlab="datetime"))

dev.off()