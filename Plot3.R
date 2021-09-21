library(readr)
dataset <- read_delim(file="./household_power_consumption.txt", ";", escape_double = FALSE, 
                      trim_ws = TRUE)
dataset$complete_date <- paste(dataset$Date,dataset$Time,sep = " ")
dataset$complete_date <- strptime(dataset$complete_date,"%d/%m/%Y %H:%M:%S")
dataset <- subset(dataset, dataset$complete_date>=as.POSIXlt("2007-02-01 00:00:00")&
                    dataset$complete_date<=as.POSIXlt("2007-02-02 23:59:59"))
plot(dataset$complete_date,dataset$Sub_metering_1, type="line", xlab = "", ylab= "Energy sub metering")
lines(dataset$complete_date,dataset$Sub_metering_2, col="red")
lines(dataset$complete_date,dataset$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lwd = 1, col = c("black", "red", "blue"))
dev.copy(png,"Plot3.png", width=480, height=480)
dev.off()
