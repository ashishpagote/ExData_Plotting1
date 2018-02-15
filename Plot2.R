power_consump<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

power_consump_a<- power_consump[which((power_consump$Date=="1/2/2007"| power_consump$Date=="2/2/2007")& power_consump$Global_active_power != "?"),]
power_consump_a$Time<- as.character(power_consump_a$Time)
power_consump_a$Date<-as.character(power_consump_a$Date) 
power_consump_a$Datetime<- paste(power_consump_a$Date,power_consump_a$Time)
power_consump_a$Datetime<- strptime(power_consump_a$Datetime,format="%d/%m/%Y %H:%M:%S")
plot(power_consump_a$Datetime,as.numeric(as.character(power_consump_a$Global_active_power)),xlab = " ",
     ylab="Global Active Power(Kilowatts)",type="l")

dev.copy(png,"plot2.png")
dev.off()
