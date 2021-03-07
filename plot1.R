# Plot 1
if (!"data" %in% ls()) {
  source("./base/data.R")
}

png(filename = "./plot1.png") #480px x 480px are default
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()