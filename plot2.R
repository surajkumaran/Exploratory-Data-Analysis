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
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0),cex=0.75)
plot(data$Global_active_power~data$Datetime, xlab="",ylab="Global Active Power (kilowatts)", type="l")

#Save to file
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()