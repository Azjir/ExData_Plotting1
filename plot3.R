data <- read.csv("household_power_consumption.txt",sep=";")
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")
names(data2) <- gsub("_"," ", names(data2))
myfun <- function(x) as.numeric(levels(x))[x]
data3 <- data2[,1:2]
data3[,3:8] <- sapply(data2[,3:8],myfun)
data3[,9] <- data2 [,9]
names(data3) <- names(data2)
png("plot3.png",width=480,height=480)
plot(data3[,7],ylab="Energy Sub Metering",xaxt="n",xlab="",type="l")
lines(data3[,8],col=2)
lines(data3[,9],col=4)
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",legend=names(data3[,7:9]),col=c("black","red","blue"),lty=1)
dev.off()