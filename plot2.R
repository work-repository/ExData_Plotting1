# Plot 2
if (!"data" %in% ls()) {
  source("./base/data.R")
}

png(filename = "./plot2.png") #480px x 480px are default
with(data, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()