# Download the file household_power_consumption.txt if necesary
if(!file.exists('household_power_consumption.txt')){
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                destfile = 'household_power_consumption.zip')
  unzip('household_power_consumption.zip')
}

data = read.table('household_power_consumption.txt', sep = ';', stringsAsFactors = T, header = T, na.strings = '?')
data$datetime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

d = subset(data, Date == '1/2/2007' | Date == '2/2/2007')

Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename = 'plot2.png', width = 480, height = 480)

plot(d$datetime, d$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.off()