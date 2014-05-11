# tested under Win 7 - 32 bit

#set working directory
#setwd(#YOUR PATH HERE#)

#data selecting using sql
#require(sqldf)

#download and unzip the file

if (!file.exists('household_power_consumption.txt')) {
	url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(url, destfile = 'dataset.zip')
	unzip('dataset.zip')
}

#Load data
#query = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
#dataset = read.csv2.sql('household_power_consumption.txt',query)

#Load data v2 (due to performance issues and time constraints loading only selected rows is used)
dataset = read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
dataset_names = read.table(file = "household_power_consumption.txt", sep = ";", nrows = 1, header=TRUE)
names(dataset) = names(dataset_names)
rm(dataset_names)

#Plot 1
with(dataset, hist(Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

#Save plot
#transparent background is not used, because it looks worse than default white
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()