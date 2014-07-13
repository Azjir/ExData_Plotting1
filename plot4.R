data <- read.csv("household_power_consumption.txt",sep=";")
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")
names(data2) <- gsub("_"," ", names(data2))
myfun <- function(x) as.numeric(levels(x))[x]
data3 <- data2[,1:2]
data3[,3:8] <- sapply(data2[,3:8],myfun)
data3[,9] <- data2 [,9]
names(data3) <- names(data2)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#first plot
plot(data3[,3],type="l",xaxt="n",ylab="Global Active Power", xlab = "")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
#second plot
plot(data3[,5],type="l",xaxt="n",ylab="Voltage", xlab = "datetime")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
#third plot
plot(data3[,7],ylab="Energy Sub Metering",xaxt="n",xlab="",type="l")
lines(data3[,8],col=2)
lines(data3[,9],col=4)
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",legend=names(data3[,7:9]),col=c("black","red","blue"),lty=1)
#fourth plot
plot(data3[,4],type="l",xaxt="n",ylab="Global_Reactive_Power", xlab = "datetime")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()