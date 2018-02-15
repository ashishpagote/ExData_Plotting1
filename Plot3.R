power_consump<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

power_consump_a<- power_consump[which((power_consump$Date=="1/2/2007"| power_consump$Date=="2/2/2007")& power_consump$Global_active_power != "?"),]
power_consump_a$Time<- as.character(power_consump_a$Time)
power_consump_a$Date<-as.character(power_consump_a$Date) 
power_consump_a$Datetime<- paste(power_consump_a$Date,power_consump_a$Time)
power_consump_a$Datetime<- strptime(power_consump_a$Datetime,format="%d/%m/%Y %H:%M:%S")

plot(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Sub_metering_1)),xlab = " ",
     ylab="energy_sub_meter",type="l",col="black")
points(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Sub_metering_2)),col="red",type="l")
points(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Sub_metering_3)),col="blue",type="l")
legend("topright",pch = "-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"plot3.png")
dev.off()
