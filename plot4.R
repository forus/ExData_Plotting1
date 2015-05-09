source('get_data.R')
data <- get_data()
from_date = strptime('2007-02-01', '%Y-%m-%d')
to_date = strptime('2007-02-02', '%Y-%m-%d')
data <- subset(data, Date >= from_date & Date <= to_date)

png(filename='plot4.png', width=480, height=480)
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1))
with(data, 
     plot(Time, Global_active_power,
          type="l",
          ylab="Global Active Power (kilowatts)")
)

with(data, 
     plot(Time, Voltage,
          type="l")
)

with(data, 
     {
         plot(Time, Sub_metering_1,
            type="l",
            ylab="Energy sub metering");
         lines(Time, Sub_metering_2, col="red");
         lines(Time, Sub_metering_3, col="blue");
         legend("topright",
                lty=1,
                col = c("black", "red", "blue"),
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
     }
)

with(data, 
     plot(Time, Global_reactive_power,
          type="l",
          ylab="Global Reactive Power (kilowatts)")
)
dev.off()
