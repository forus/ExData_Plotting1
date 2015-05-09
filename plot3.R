source('get_data.R')
data <- get_data()
from_date = strptime('2007-02-01', '%Y-%m-%d')
to_date = strptime('2007-02-02', '%Y-%m-%d')
data <- subset(data, Date >= from_date & Date <= to_date)

png(filename='plot3.png', width=480, height=480)
with(data, 
     plot(Time, Sub_metering_1,
          type="l",
          xlab="",
          ylab="Energy sub metering")
)
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright",
       lty=1,
       col = c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
