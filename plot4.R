#reading the data only from 1/2/2007 and 2/2/2007 (total 2880 minutes)
filepath <- "./household_power_consumption.txt"
skipind <- grep("1/2/2007", readLines(filepath))[[1]]-1
data <- read.table(filepath,sep=";",skip=skipind,nrows=2880)

#construt the date and time in date format
library(plyr)
library(lubridate)
data <- mutate(data,DT = dmy_hms(paste(data$V1, data$V2)))

##################################

#plotting the graph in png device
png(file="plot4.png",width=480,height=480)

#4x4, filling the left column first
par(mfcol=c(2,2))

#1st graph
plot(data$DT,data$V3,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#2nd graph
plot(data$DT,data$V7,type="l",xlab="",ylab="Energy sub metering")
points(data$DT,data$V8,type="l",col="red")
points(data$DT,data$V9,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1, lty=1)

#3rd graph
plot(data$DT,data$V5,type="l",xlab="datetime",ylab="Voltage")

#4th graph
plot(data$DT,data$V4,type="l",xlab="datetime",ylab="Global_reactive_power")

#close the device
dev.off()
