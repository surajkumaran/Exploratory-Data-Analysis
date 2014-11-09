#Loading full raw data
raw_data <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)

#Formatting date
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

#Subsetting reqd data
data1 <- raw_data[raw_data$Date >= "2007-02-01",]
data <- data1[data1$Date <= "2007-02-02",]

#Creating plot on screen
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0),cex=0.75)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#Save to file
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()