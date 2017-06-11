#reading the data only from 1/2/2007 and 2/2/2007 (total 2880 minutes)
filepath <- "./household_power_consumption.txt"
skipind <- grep("1/2/2007", readLines(filepath))[[1]]-1
data <- read.table(filepath,sep=";",skip=skipind,nrows=2880)

#plotting the graph in png device
png(file="plot1.png",width=480,height=480)
hist(data$V3,main="Globar Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")
dev.off()