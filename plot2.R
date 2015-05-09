source('get_data.R')
data <- get_data()
from_date = strptime('2007-02-01', '%Y-%m-%d')
to_date = strptime('2007-02-02', '%Y-%m-%d')
data <- subset(data, Date >= from_date & Date <= to_date)

png(filename='plot2.png', width=480, height=480)
with(data, 
     plot(Time, Global_active_power,
          type="l",
          xlab="",
          ylab="Global Active Power (kilowatts)")
     )
dev.off()