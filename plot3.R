# Plot 3
if (!"data" %in% ls()) {
  source("./base/data.R")
}

png(filename = "./plot3.png") #480px x 480px are default
with(data, {
  plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(Time, Sub_metering_2, type = "l", col = "red")
  points(Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = names(data)[grep("\\bSub", names(data))])
})
dev.off()