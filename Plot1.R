power_consump<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

power_consump_a<- power_consump[which(power_consump$Date=="1/2/2007"| power_consump$Date=="2/2/2007"),]

hist(as.numeric(power_consump_a$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.copy(png,"plot1.png")
dev.off()