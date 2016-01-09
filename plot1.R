# Library call
library(dplyr)

# Download & unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="edc.zip")
unzip("edc.zip")

# Read, clean & filter data
edc<-tbl_df(read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?"))
edc$Date<-as.Date(edc$Date,"%d/%m/%Y")
edc<-filter(edc,Date>="2007-02-01",Date<"2007-02-03")

# Create plot & export to png
png(filename="plot1.png",width=480,height=480)
with(edc,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()