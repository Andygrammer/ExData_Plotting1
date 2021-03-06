# Loading the data

# Set working directory
#setwd("C:/Users/and_a/Documents/Projetos em R/Coursera Exploratory Data Analysis/Week 1/ExData_Plotting")

data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", na.strings="?")

data_date_prep <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_date_prep$Date <- as.Date(data_date_prep$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_date_prep$Date), data_date_prep$Time)
data_date_prep$Datetime <- as.POSIXct(datetime)

# Making the plot 4
dev.copy(png, file="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_date_prep, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="Red")
  lines(Sub_metering_3~Datetime, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",
     ylab="Global_reactive_power", xlab="datetime")
})
dev.off()