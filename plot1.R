# plot1.R
# Draw a histgram of Global active power.

# set locale
lc = Sys.setlocale(locale="en_US.UTF-8")

# read whole data from file
data = read.table('household_power_consumption.txt',
                  sep=';', header=T, na.string='?')

# subset specific rows
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# open png device and write a histgram into it.
png = png('plot1.png', width=480, height=480, bg="transparent")

with(data,
     hist(data$Global_active_power, col='red',
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)")
)

dev.off()