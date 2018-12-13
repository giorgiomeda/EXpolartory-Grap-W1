dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
dataset[,1]<-as.Date(dataset[,1],"%d/%m/%Y")

sub<-subset(dataset,Date>="2007-02-01" & Date<="2007-02-02")
sub[,3]<-as.numeric(as.character(sub[,3]))
##sub[,4]<-as.numeric(as.character(sub[,4]))
##sub[,5]<-as.numeric(as.character(sub[,5]))
##sub[,6]<-as.numeric(as.character(sub[,6]))

hist(sub$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
