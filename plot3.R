# Library call
library(dplyr)

# Download & unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="edc.zip")
unzip("edc.zip")

# Read, clean & filter data
edc<-tbl_df(read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?"))
edc$Date<-as.Date(edc$Date,"%d/%m/%Y")
edc<-filter(edc,Date>="2007-02-01",Date<"2007-02-03")
edc$DateTime<-paste(edc$Date,edc$Time,sep=" ")
edc$DateTime<-strptime(edc$DateTime,format="%Y-%m-%d %H:%M:%S")

# Create plot & export to png
png(filename="plot3.png",width=480,height=480)
par(mar=c(2.1,4.1,2.1,1.1))
with(edc,{
        plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
})
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
