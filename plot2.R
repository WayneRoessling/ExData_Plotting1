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
png(filename="plot2.png",width = 480, height = 480, units = "px")
plot(databydate$Datetime,databydate$Global_active_power,type="n",
     ylab="Global Active Power (kilowatts)",col="black",xlab="")
lines(databydate$Datetime,databydate$Global_active_power,col="black")
dev.off()