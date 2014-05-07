#Reading Data
hpc_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric","numeric"))
#Transforming Date/time data
hpc_data$Time <- paste(hpc_data$Date,hpc_data$Time, sep=" ")
hpc_data$Time <- strptime(hpc_data$Time,format="%d/%m/%Y %H:%M:%S")
hpc_data$Date <- as.Date(hpc_data$Date,format="%d/%m/%Y")
#Filtering the data by date
filtered_data <-hpc_data[hpc_data$Date == "2007-02-01"| hpc_data$Date == "2007-02-02",]
#configuring png output
png("plot1.png", width=480,height=480)
hist(filtered_data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()