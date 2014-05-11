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


## Select png plot device 
png(filename="plot4.png",width=480,height=480)

## Set paramater for two rows and two columns of plots
par(mfrow=c(2,2))


## Plot all plots


with(sub, {

        ## Plot graph 1: Global Active Power
        plot(Date,Global_active_power,type='l',xlab="",
             ylab="Global Active Power")

        ## Plot graph 2: Voltage
        plot(Date,Voltage, type='l', xlab="datetime", ylab="Voltage")

        ## Plot graph 3: Energy sub metering
        plot(Date,Sub_metering_1,type='l',xlab="",
             ylab="Energy sub metering")

        lines(Date,Sub_metering_2,col="red")

        lines(Date,Sub_metering_3,col="blue")

        legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", 
             "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), 
             cex=0.85,bty='n')
        
        ## Plot graph 4: Global_reactive_power
        plot(Date,Global_reactive_power, type='l',xlab="datetime",
             ylab="Global_reactive_power")

})

## Turn off plotting device
dev.off()
