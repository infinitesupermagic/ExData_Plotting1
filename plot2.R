
library(sqldf)
df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'", header=TRUE, sep = ";")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Date <- paste(df$Date, df$Time)
df$Date <- strptime(df$Date, format="%Y-%m-%d %H:%M:%S")
df <- df[,c(1,3:9)]
df$Date <- as.POSIXct(df$Date)
plot(df$Date,df$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab=.75, cex.axis=.75, cex.main=1, cex.sub=.5, pch=".", type="o")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()