library(sqldf)
df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'", header=TRUE, sep = ";")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Date <- paste(df$Date, df$Time)
df$Date <- strptime(df$Date, format="%Y-%m-%d %H:%M:%S")
df <- df[,c(1,3:9)]
df$Date <- as.POSIXct(df$Date)
par(mfrow=c(2,2))
plot(df$Date,df$Global_active_power, ylab = "Global Active Power", xlab = "", cex.lab=.75, cex.axis=.75, cex.main=1, cex.sub=.5, type="l")
plot(df$Date,df$Voltage, ylab = "Voltage", xlab = "datetime", cex.lab=.75, cex.axis=.75, cex.main=1, cex.sub=.5, type="l")
plot(df$Date, df$Sub_metering_1 , ylab = "Energy sub metering", xlab = "", cex.lab=.75, cex.axis=.75, cex.main=1, cex.sub=.5, pch=".", type="o")
lines(df$Date, df$Sub_metering_2, type="l", col="red")
lines(df$Date, df$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2, cex=.60, bty = "n")
plot(df$Date,df$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", cex.lab=.75, cex.axis=.75, cex.main=1, cex.sub=.5, pch=".", type="o")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()