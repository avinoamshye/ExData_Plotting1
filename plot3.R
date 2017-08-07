#plot3.R creates plot3.png

#downloading data to data directory and extracting to working directory, unless already done
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilePath = "./data/household_power_consumption.zip"
txtFilePath = "./household_power_consumption.txt"
if(!file.exists(zipFilePath)){download.file(fileUrl, zipFilePath)}
if(!file.exists(txtFilePath)){unzip(zipFilePath)}
#load data
hpc3 <- read.table(txtFilePath,header = TRUE, sep = ";", na.strings = "?", nrows = 70000)
#subset data
hpc3 <- subset(hpc1, Date == "1/2/2007" | Date == "2/2/2007")
#add appropriate DateTime format column
hpc3["POSIXct"] <- as.POSIXct(with(hpc2, paste(Date,Time)), format = "%d/%m/%Y %H:%M:%OS")
#create png file
png("plot3.png",width = 480,height = 480,units = "px")
with(hpc3, plot(POSIXct, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpc3, points(POSIXct,Sub_metering_2,type = "l", col = "red"))
with(hpc3, points(POSIXct,Sub_metering_3,type = "l", col = "blue"))
sub_meters <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
cols <- c("black", "red", "blue")
legend("topright",legend = sub_meters, col = cols, lty = 1)
dev.off()
