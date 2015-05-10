if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method ="curl")
unzip("./data/household_power_consumption.zip")
list.files(".")
#file name is "household_power_consumption.txt"
DT<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

names(DT)
DTsubset<-DT[(DT$Date=="1/2/2007" | DT$Date=="2/2/2007" ),]


DTsubset$DateTime<-strptime(paste(DTsubset$Date,DTsubset$Time),"%d/%m/%Y %H:%M:%S")
#set language in English
Sys.setlocale("LC_TIME", "en_GB")
#paste Time and Date
DTsubset$DateTime<-strptime(paste(DTsubset$Date,DTsubset$Time),"%d/%m/%Y %H:%M:%S")

#plot4
par(mfrow = c(2, 2), mar=c(4,4,1,1),mai = c(2,2,2,2),plt = c(0.18, 0.9, 0.2, 0.9))
with(DTsubset, {
  plot(DateTime, Global_active_power,type = "l", ylab = "Global Active Power",cex.sub=0.8,xlab="")
  plot(DateTime, Voltage, type = "l", cex.sub=0.8,ylab = "Voltage", xlab="datetime")
  plot(DateTime,Sub_metering_1, type = "l", cex.sub=0.8,ylab = "Energy sub meeting",xlab="")
  points(DateTime,Sub_metering_2, type = "l",cex.sub=0.8,cex.sub=1, col="red")
  points(DateTime,Sub_metering_3, type = "l",cex.sub=0.8, col="blue")
  legend("topright", col = c("black","red","blue"),cex=0.7, lty=1,box.lwd=0,merge = TRUE,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime",ylim = c(0.0,0.5),font.axis=1)
  
})


dev.copy(png,file="plot4.png",width = 480, height = 480, units = "px", pointsize = 6)  #Copy my plot to PNG file
dev.off()   ##close the PNG device



