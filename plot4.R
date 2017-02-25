setwd("C://Users/Hector/Desktop/Coursera/Course4_Exploratory_Data_Analysis")
if(!file.exists("./data")){dir.create("./data")}
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url, destfile = "./data/household_power_consumption.zip")
unzip("./data/household_power_consumption.zip")

dat <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep = ";", na.strings = "?")
dat_a <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

# dat_b below contains dates and times only
dat_b <- strptime(paste(dat_a$Date, dat_a$Time, sep = " "), 
                  "%d/%m/%Y %H:%M:%S")
dat_c <- cbind(dat_b, dat_a)

# Change directory to CourseraRepos folder to save R and PNG files 
setwd("C://Users/Hector/Desktop/Coursera/CourseraRepos/ExplorDataAnalysis")

## Code to generate plot4 (multiple plots)
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 5, 2, 2))
# Top left graph
plot(x = dat_b, y = dat_c$Global_active_power, type = "l", col = "black", 
     xlab = "", ylab = "Global Active Power")
# Top right graph
plot(x = dat_b, y = dat_c$Voltage, type = "l", col = "black", 
     xlab = "datetime", ylab = "Voltage")
# Low left graph
with(dat_c, {
      plot(Sub_metering_1 ~ dat_b, type = "l", col = "black", 
           xlab = "", ylab = "Energy sub-metering")
      lines(Sub_metering_2 ~ dat_b, col = "red")
      lines(Sub_metering_3 ~ dat_b, col = "blue")
})
# Low right graph
plot(x = dat_b, y = dat_c$Global_reactive_power, type = "l", col = "black", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
