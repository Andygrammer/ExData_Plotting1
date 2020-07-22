# Loading the data

# Set working directory
#setwd("C:/Users/and_a/Documents/Projetos em R/Coursera Exploratory Data Analysis/Week 1/ExData_Plotting")

data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", na.strings="?")

data_date_prep <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_date_prep$Date <- as.Date(data_date_prep$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_date_prep$Date), data_date_prep$Time)
data_date_prep$Datetime <- as.POSIXct(datetime)

# Making the plot 2
dev.copy(png, file="plot2.png", width=480, height=480)
with(data_date_prep, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()