library(readr)
dataset <- read_delim(file="./household_power_consumption.txt", ";", escape_double = FALSE, 
                      trim_ws = TRUE)
class(dataset$Time)
dataset$complete_date <- paste(dataset$Date,dataset$Time,sep = " ")
dataset$complete_date <- strptime(dataset$complete_date,"%d/%m/%Y %H:%M:%S")
class(dataset$complete_date)
Sys.setlocale("LC_TIME", "English")
dataset <- subset(dataset, dataset$complete_date>=as.POSIXlt("2007-02-01 00:00:00")&
                    dataset$complete_date<=as.POSIXlt("2007-02-02 23:59:59"))
plot(dataset$complete_date,dataset$Global_active_power, type="line", ylab="Global Active Power(kilowatts)", xlab = "")
dev.copy(png,"Plot2.png", width=480, height=480)
dev.off()
