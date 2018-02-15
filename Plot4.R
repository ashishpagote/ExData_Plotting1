#Creating database

power_consump<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
power_consump_a<- power_consump[which((power_consump$Date=="1/2/2007"| power_consump$Date=="2/2/2007")& power_consump$Global_active_power != "?"),]
power_consump_a$Time<- as.character(power_consump_a$Time)
power_consump_a$Date<-as.character(power_consump_a$Date) 
power_consump_a$Datetime<- paste(power_consump_a$Date,power_consump_a$Time)
power_consump_a$Datetime<- strptime(power_consump_a$Datetime,format="%d/%m/%Y %H:%M:%S")

#creating space for plots
par(mfrow=c(2,2))
#creating plots

#1
plot(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Global_active_power)),xlab = " ",
     ylab="Global Active Power(Kilowatts)",type="l")
#2
plot(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Voltage)),xlab = "datetime",
     ylab="Voltage",type="l")

#3
plot(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Sub_metering_1)),xlab = " ",
     ylab="energy_sub_meter",type="l",col="black")
points(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Sub_metering_2)),col="red",type="l")
points(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Sub_metering_3)),col="blue",type="l")
legend("topright",pch = "-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4
plot(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Global_reactive_power)),xlab = "datetime",
     ylab="Global Reactive Power(Kilowatts)",type="l")

#creating png copy

dev.copy(png,"plot4.png")
dev.off()
