#reading the data only from 1/2/2007 and 2/2/2007 (total 2880 minutes)
filepath <- "./household_power_consumption.txt"
skipind <- grep("1/2/2007", readLines(filepath))[[1]]-1
data <- read.table(filepath,sep=";",skip=skipind,nrows=2880)

#construt the date and time in date format
library(plyr)
library(lubridate)
data <- mutate(data,DT = dmy_hms(paste(data$V1, data$V2)))


#plotting the graph in png device
png(file="plot2.png",width=480,height=480)
plot(data$DT,data$V3,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()