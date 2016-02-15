mydata<-read.table("household_power_consumption.txt",sep=";",na.string="?",header=TRUE)
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mydata_sub<-mydata[which(mydata$Date>="2007-02-01" & mydata$Date<="2007-02-02"),]
active_power<-as.numeric(as.character(mydata_sub$Global_active_power))
png(file="plot1.png",width=480,height=480)
hist(active_power,col="red",xlab="Global Active Power (kilowats)",main="Global Active Power")
dev.off()