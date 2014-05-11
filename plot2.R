## Note: The following steps assume that the data has been downloaded from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## and unzipped in the user's current working directory

## Read in data
filename="household_power_consumption.txt"
data<-read.table(filename,header=TRUE,sep=";",na.strings="?",
                 stringsAsFactors=FALSE)

## Convert dates to date type
## Subset data based on specified dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")
sub<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")

## Combine date and time columns
## Convert date/time to POSIXlt format
sub$Date<-paste(sub$Date, sub$Time, sep=" ")
sub$Date<-as.POSIXlt(strptime(sub$Date, "%Y-%m-%d %H:%M:%S"))


## Select png plot device and plot graph
png(filename="plot2.png",width=480,height=480)
plot(sub$Date,sub$Global_active_power,type='l',xlab="",
     ylab="Global Active Power (kilowatts)")

## Turn off plotting device
dev.off()
