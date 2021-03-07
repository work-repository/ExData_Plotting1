# Plot 4
if (!"data" %in% ls()) {
  source("./base/data.R")
}

png(filename = "./plot4.png") #480px x 480px are default
par(mfrow = c(2,2))
with(data, {
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Time, Voltage, type = "l", xlab = "datetime") #ylabel default
  plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(Time, Sub_metering_2, type = "l", col = "red")
  points(Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = c(1,1,1), bty = "n", col = c("black","red","blue"), legend = names(data)[grep("\\bSub", names(data))])
  plot(Time, Global_reactive_power, type = "l", xlab = "datetime") #ylabel default
})
dev.off()