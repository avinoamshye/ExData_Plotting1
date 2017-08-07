
#plot2.R creates plot2.png

#downloading data to data directory and extracting to working directory, unless already done
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilePath = "./data/household_power_consumption.zip"
txtFilePath = "./household_power_consumption.txt"
if(!file.exists(zipFilePath)){download.file(fileUrl, zipFilePath)}
if(!file.exists(txtFilePath)){unzip(zipFilePath)}

#load data
hpc2 <- read.table(txtFilePath,header = TRUE, sep = ";", na.strings = "?", nrows = 70000)
#subset data
hpc2 <- subset(hpc1, Date == "1/2/2007" | Date == "2/2/2007")
#add appropriate DateTime format column
hpc2["POSIXct"] <- as.POSIXct(with(hpc2, paste(Date,Time)), format = "%d/%m/%Y %H:%M:%OS")
#create png file
png("plot2.png",width = 480,height = 480,units = "px")
with(hpc2, plot(POSIXct,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()






