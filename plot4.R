## Coursera Exploritory Data Project 1
##
#
#download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),
                   sep= ";", header=TRUE, na.strings="?")
unlink(temp)

# convert text to Date format
pwrusagedata$Date <- as.Date(pwrusagedata$Date, "%d/%m/%Y")

#filter date
databydate <- pwrusagedata[pwrusagedata$Date >= "2007-02-01",]
databydate <- databydate[databydate$Date <= "2007-02-02",]

#combine data and time
databydate$Datetime <- as.POSIXct(paste(databydate$Date, databydate$Time))

#Plot to PNG
png(filename="plot4.png",width = 480, height = 480, units = "px")

#Set up plot
par(mfrow=c(2,2))

# start plotting
plot(databydate$Datetime,databydate$Global_active_power,type="n",
     ylab="Global Active Power",col="black",xlab="")
lines(databydate$Datetime,databydate$Global_active_power,col="black")

plot(databydate$Datetime,databydate$Voltage,type="n",
     xlab="datetime",ylab="Voltage", col="black")
lines(databydate$Datetime,databydate$Voltage,col="black")

plot(databydate$Datetime,databydate$Sub_metering_1,type="n",
     ylab="Energy sub metering",col="black",xlab="")
lines(databydate$Datetime,databydate$Sub_metering_1,col="black")
lines(databydate$Datetime,databydate$Sub_metering_2,col="red")
lines(databydate$Datetime,databydate$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                                lty = c(1, 1, 1), col=c("black","red","blue"))

plot(databydate$Datetime,databydate$Global_reactive_power,type="n",
     xlab="datetime",ylab="Global_reactive_power", col="black")
lines(databydate$Datetime,databydate$Global_reactive_power,col="black")

dev.off()