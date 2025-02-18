library(data.table)

# Set working directory 
setwd("C:/Users/Admin/Desktop/my shit/Data Science Coursera/ExData_Plotting1/exdata_data_household_power_consumption")

# Read in data
powerDT <- fread(input = "household_power_consumption.txt", na.strings="?", showProgress=FALSE)

# Convert Global_active_power to numeric
powerDT[, Global_active_power := as.numeric(Global_active_power)]

# Convert Date column to Date format
powerDT[, Date := as.Date(Date, format="%d/%m/%Y")]

# Filter data for specified dates
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Create plot
png("plot1.png", width=480, height=480)
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

