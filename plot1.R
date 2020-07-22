# Loading the data

# Set working directory
#setwd("C:/Users/and_a/Documents/Projetos em R/Coursera Exploratory Data Analysis/Week 1/ExData_Plotting")

data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", na.strings="?")

data_date_prep <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data_date_prep$Date <- as.Date(data_date_prep$Date, format="%d/%m/%Y")

# Making the histogram plot
png("plot1.png", width=480, height=480)
hist(data_date_prep$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()