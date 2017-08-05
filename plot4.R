#plot4.R creates plot4.png

#downloading data to data directory and extracting to working directory, unless already done
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilePath = "./data/household_power_consumption.zip"
txtFilePath = "./household_power_consumption.txt"
if(!file.exists(zipFilePath)){download.file(fileUrl, zipFilePath)}
if(!file.exists(txtFilePath)){unzip(zipFilePath)}

#load data 40000 rows for lightness 
hpc <- read.table(txtFilePath,header = TRUE, sep = ";", na.strings = "?", nrows = 40000)
#include only relevant columns and rows for lightness
hpc4 <- hpc[36000:39500,]
#add appropriate DateTime format column
hpc4["POSIXct"] <- as.POSIXct(with(hpc4, paste(Date,Time)), format = "%d/%m/%Y %H:%M:%OS")

#create png file
png("plot4.png")
par(mfrow = c(2,2))

#plot1:
with(hpc4, plot(POSIXct,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
#plot2:
with(hpc4, plot(POSIXct,Voltage, type = "l", xlab = "datetime"))
#plot3:
with(hpc4, plot(POSIXct, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpc4, points(POSIXct,Sub_metering_2,type = "l", col = "red"))
with(hpc4, points(POSIXct,Sub_metering_3,type = "l", col = "blue"))
sub_meters <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
cols <- c("black", "red", "blue")
legend("topright",legend = sub_meters, col = cols, lty = 1, cex = 0.75)

#plot4:
with(hpc4, plot(POSIXct,Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()


