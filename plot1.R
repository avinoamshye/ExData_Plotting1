
#plot1.R creates plot1

#downloading data to data directory, extracting to working directory, and loading data to hpc variable
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilePath = "./data/household_power_consumption.zip"
txtFilePath = "./household_power_consumption.txt"
if(!file.exists(zipFilePath)){download.file(fileUrl, zipFilePath)}
if(!file.exists(txtFilePath)){unzip(zipFilePath)}
hpc <- read.table(txtFilePath,header = TRUE, sep = ";", na.strings = "?")

png("plot1.png")
hist(hpc$Global_active_power, col = "red", xlim = c(0,6), ylim = c(0,1200000),breaks = 24, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()






