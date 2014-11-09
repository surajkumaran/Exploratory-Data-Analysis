#Loading full raw data
raw_data <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)

#Formatting date
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

#Subsetting reqd data
data1 <- raw_data[raw_data$Date >= "2007-02-01",]
data <- data1[data1$Date <= "2007-02-02",]

#Combining and inserting Datetime in data
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

#Creating plot on screen
par(mfrow=c(1,1),mar=c(4,4,2,2),oma=c(0,0,2,0.5),cex=0.75)
plot(data$Sub_metering_1~data$Datetime, xlab="",ylab="Energy sub metering", type="l")
lines(data$Sub_metering_2~data$Datetime, type="l",col="red")
lines(data$Sub_metering_3~data$Datetime, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1,lwd=1)

#Save to file
dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()