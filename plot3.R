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
png("plot3.png", width=480,height=480)
par(mar = c(3,4,2,1))
plot(filtered_data$Time,filtered_data$Sub_metering_1,ylab="Energy sub metering",type="n")
with(filtered_data, lines(Time, Sub_metering_1, col = "black"))
with(filtered_data, lines(Time, Sub_metering_2, col = "red"))
with(filtered_data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
