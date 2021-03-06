mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors = FALSE)
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mydata_sub<-mydata[which(mydata$Date>="2007-02-01" & mydata$Date<="2007-02-02"),]
mydata_sub$Timestamp <-paste(mydata_sub$Date, mydata_sub$Time)
mydata_sub$Sub_metering_1<-as.numeric(as.character(mydata_sub$Sub_metering_1))
mydata_sub$Sub_metering_2<-as.numeric(as.character(mydata_sub$Sub_metering_2))
mydata_sub$Sub_metering_3<-as.numeric(as.character(mydata_sub$Sub_metering_3))
png(file="plot3.png",width=480,height=480)
plot(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Sub_metering_1, type = "l", col="black", ylab="Energy sub metering", xlab=" ")
lines(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Sub_metering_2,col="red")
lines(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Sub_metering_3,col="blue")
legend(strptime("2007-02-02 07:10:00","%Y-%m-%d %H:%M:%S"),39.5,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),border="black",lty=c(1,1))
dev.off()