#plot3.R creates plot3.png

#downloading data to data directory and extracting to working directory, unless already done
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilePath = "./data/household_power_consumption.zip"
txtFilePath = "./household_power_consumption.txt"
if(!file.exists(zipFilePath)){download.file(fileUrl, zipFilePath)}
if(!file.exists(txtFilePath)){unzip(zipFilePath)}

#load data 40000 rows for lightness 
hpc <- read.table(txtFilePath,header = TRUE, sep = ";", na.strings = "?", nrows = 40000)
#include only relevant columns for lightness
hpc3 <- with(hpc[36000:39500,], data.frame(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3))
#add appropriate DateTime format column
hpc3["POSIXct"] <- as.POSIXct(with(hpc3, paste(Date,Time)), format = "%d/%m/%Y %H:%M:%OS")
#create png file
png("plot3.png")
with(hpc3, plot(POSIXct, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpc3, points(POSIXct,Sub_metering_2,type = "l", col = "red"))
with(hpc3, points(POSIXct,Sub_metering_3,type = "l", col = "blue"))
sub_meters <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
cols <- c("black", "red", "blue")
legend("topright",legend = sub_meters, col = cols, lty = 1)
dev.off()
