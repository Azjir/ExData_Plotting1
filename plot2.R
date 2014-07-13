data <- read.csv("household_power_consumption.txt",sep=";")
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")
names(data2) <- gsub("_"," ", names(data2))
myfun <- function(x) as.numeric(levels(x))[x]
data3 <- data2[,1:2]
data3[,3:8] <- sapply(data2[,3:8],myfun)
data3[,9] <- data2 [,9]
names(data3) <- names(data2)
png("plot2.png",width=480,height=480)
plot(data3[,3],type="l",xaxt="n",ylab="Global Active Power (kilowatts)", xlab = "")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
