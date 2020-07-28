## Rplot 2
## set working directorty via set(wd)
datafull <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subdata1 <- subset(datafull, Date %in% c("1/2/2007","2/2/2007"))
subdata1$Date <- as.Date(subdata1$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(subdata1$Date), subdata1$Time)
subdata1$Datetime<-as.POSIXct(datetime)

#plotting

with(subdata1, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(subdata1, lines(Datetime, Sub_metering_2, type = "l", col="red"))
with(subdata1, lines(Datetime, Sub_metering_3, type = "l", col="blue"))

legend("topright", col = c("black","red","blue"), lty=1, lwd=2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#file finishing
dev.copy(png, file="Rplot3.png", height=480, width=480)
dev.off()