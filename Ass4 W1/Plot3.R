dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
dataset[,1]<-as.Date(dataset[,1],"%d/%m/%Y")
sub<-subset(dataset,Date>="2007-02-01" & Date<="2007-02-02")
sub[,3]<-as.numeric(as.character(sub[,3]))


datetime<-as.POSIXct(paste(sub$Date,sub$Time),format="%Y-%m-%d %H:%M:%S")
sub<-cbind(sub,datetime)
Sys.setenv(LANG = 'en')
Sys.setlocale("LC_TIME", "English")

sub[,7]<-as.numeric(as.character(sub[,7]))
sub[,8]<-as.numeric(as.character(sub[,8]))
sub[,9]<-as.numeric(as.character(sub[,9]))

plot(sub$datetime,sub$Sub_metering_1,type="l",col="black",xlab=" ",ylab = "Energy sub metering")
points(sub$datetime,sub$Sub_metering_2,type="l",col="red")
points(sub$datetime,sub$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()
