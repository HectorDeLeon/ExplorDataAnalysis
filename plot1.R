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

## Code to generate plot1 (Global Active Power)
png(filename = "plot1.png", width = 480, height = 480)
hist(dat_c$Global_active_power, freq = TRUE, col = "red", 
     main = "Global Acive Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
