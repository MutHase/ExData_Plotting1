if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method ="curl")
unzip("./data/household_power_consumption.zip")
list.files(".")
#file name is "household_power_consumption.txt"
DT<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

names(DT)
DTsubset<-DT[(DT$Date=="1/2/2007" | DT$Date=="2/2/2007" ),]

#plot2
#set language in English
Sys.setlocale("LC_TIME", "en_GB")
#paste Time and Date
DTsubset$DateTime<-strptime(paste(DTsubset$Date,DTsubset$Time),"%d/%m/%Y %H:%M:%S")
x<- DTsubset$DateTime
y<- DTsubset$Global_active_power

plot(x,y,type = "l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png")  #Copy my plot to PNG file
dev.off()   ##close the PNG device

