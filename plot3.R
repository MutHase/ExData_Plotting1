if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method ="curl")
unzip("./data/household_power_consumption.zip")

#Plot3
DT<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
DTsubset<-DT[(DT$Date=="1/2/2007" | DT$Date=="2/2/2007" ),]
DTsubset$DateTime<-strptime(paste(DTsubset$Date,DTsubset$Time),"%d/%m/%Y %H:%M:%S")
#set language in English
Sys.setlocale("LC_TIME", "en_GB")
#paste Time and Date
DTsubset$DateTime<-strptime(paste(DTsubset$Date,DTsubset$Time),"%d/%m/%Y %H:%M:%S")

with(DTsubset,{plot(DateTime,Sub_metering_1,type="l", ylab ="Energy sub metering",xlab="")
 points(DateTime,Sub_metering_2,type="l", col = "red")
points(DateTime,Sub_metering_3, type="l",col="blue")
legend("topright", lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})


dev.copy(png,file="plot3.png")  #Copy my plot to PNG file
dev.off()   ##close the PNG device
