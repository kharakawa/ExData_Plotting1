# plot2.R
# Draw a time series chart of Global active power.

# set locale
Sys.setlocale(locale="en_US.UTF-8")

# read whole data from file
data = read.table('household_power_consumption.txt',
                  sep=';', header=T, na.string='?')

# subset specific rows
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# open png device and write a chart into it.
png = png('plot2.png', width=480, height=480, bg="transparent")

with(data,
     plot(DateTime, Global_active_power, type='l',
          ylab="Global Active Power (kilowatts)", xlab="")
)

dev.off()