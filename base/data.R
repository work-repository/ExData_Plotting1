#Setup
library(datasets)

wk_dir <- "./base"
if(!dir.exists(wk_dir)) {
  dir.create(wk_dir)
}

#Download data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
comp_data_file <- paste(wk_dir, "dataset.zip", sep = "/")
if (!file.exists(comp_data_file)) {
  download.file(url, comp_data_file)
}
rm(url)

#Extract data
raw_data_file <- paste(wk_dir, "household_power_consumption.txt", sep = "/")
if (!file.exists(raw_data_file)) {
  unzip(comp_data_file, exdir = wk_dir)
}

#Load data - 66638:69517
headers <- read.csv2(raw_data_file, sep = ";", header = F, nrows = 1, as.is = T)
data <- read.csv2(raw_data_file, sep = ";", dec = ".", header = F, nrows = 2880, skip = 66637, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
colnames(data) <- headers
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
rm(headers, wk_dir)
rm(list = ls()[grep("file", ls())])
