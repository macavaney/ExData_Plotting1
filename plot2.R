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
png(filename="plot2.png",width=480,height=480)
par(mar=c(2.1,4.1,2.1,1.1))
with(edc,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"))
dev.off()
