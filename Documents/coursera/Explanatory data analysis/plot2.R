mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors = FALSE)
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mydata_sub<-mydata[which(mydata$Date>="2007-02-01" & mydata$Date<="2007-02-02"),]
mydata_sub$Timestamp <-paste(mydata_sub$Date, mydata_sub$Time)
mydata_sub$Global_active_power<-as.numeric(as.character(mydata_sub$Global_active_power))
png(file="plot2.png",width=480,height=480)
plot(strptime(mydata_sub$Timestamp,"%Y-%m-%d %H:%M:%S"), mydata_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()