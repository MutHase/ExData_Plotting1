if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method ="curl")
unzip("./data/household_power_consumption.zip")

#check file name of unzip
list.files(".")
#read file
DT<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

# check colomn names
names(DT)

# select 1/2/2007 and 2/2/2007
DTsubset<-DT[(DT$Date=="1/2/2007" | DT$Date=="2/2/2007" ),]

#plot1
hist(DTsubset$Global_active_power, col="red", main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab ="Frequency",ylim = c(0,1200))
#Copy my plot to PNG file
dev.copy(png,file="gplot1.png")
##close the PNG device
dev.off()
