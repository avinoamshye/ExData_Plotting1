
#plot1.R creates plot1

#downloading data to data directory, extracting to working directory, and loading data to hpc variable
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilePath = "./data/household_power_consumption.zip"
txtFilePath = "./household_power_consumption.txt"
if(!file.exists(zipFilePath)){download.file(fileUrl, zipFilePath)}
if(!file.exists(txtFilePath)){unzip(zipFilePath)}
hpc1 <- read.table(txtFilePath,header = TRUE, sep = ";", na.strings = "?", nrows = 70000)
#subset data
hpc1 <- subset(hpc1, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png",width = 480,height = 480,units = "px")
hist(hpc1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()






