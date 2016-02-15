mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors = FALSE)
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mydata_sub<-mydata[which(mydata$Date>="2007-02-01" & mydata$Date<="2007-02-02"),]
mydata_sub$Timestamp <-paste(mydata_sub$Date, mydata_sub$Time)
mydata_sub$Global_active_power<-as.numeric(as.character(mydata_sub$Global_active_power))
mydata_sub$Global_reactive_power<-as.numeric(as.character(mydata_sub$Global_reactive_power))
mydata_sub$Voltage<-as.numeric(as.character(mydata_sub$Voltage))
mydata_sub$Sub_metering_1<-as.numeric(as.character(mydata_sub$Sub_metering_1))
mydata_sub$Sub_metering_2<-as.numeric(as.character(mydata_sub$Sub_metering_2))
mydata_sub$Sub_metering_3<-as.numeric(as.character(mydata_sub$Sub_metering_3))
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Sub_metering_1, type = "l", col="black", ylab="Energy sub metering", xlab=" ")
lines(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Sub_metering_2,col="red")
lines(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",col=c("black","red","blue"),lty=c(1,1))
plot(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

























