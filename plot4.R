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
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0),cex=0.75)
with(data,{
        plot(data$Global_active_power~data$Datetime, type="l",xlab="",ylab="Global Active Power",cex.lab=1)
        plot(data$Voltage~data$Datetime,type="l",xlab="datetime",ylab="Voltage",cex.lab=1)
        plot(data$Sub_metering_1~data$Datetime,type="l",xlab="",ylab="Energy sub metering",cex.lab=1)
        lines(data$Sub_metering_2~data$Datetime,col="red")
        lines(data$Sub_metering_3~data$Datetime,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"),cex=0.86,bty="n")
        plot(data$Global_reactive_power~data$Datetime,type="l",xlab="datetime",ylab="Global_reactive_power",cex.lab=1)
})

#Save to file
dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()