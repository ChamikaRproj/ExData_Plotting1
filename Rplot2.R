## Rplot 2
## set working directorty via set(wd)
datafull <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subdata1 <- subset(datafull, Date %in% c("1/2/2007","2/2/2007"))
subdata1$Date <- as.Date(subdata1$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(subdata1$Date), subdata1$Time)
subdata1$Datetime<-as.POSIXct(datetime)

with(subdata1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})