
## Loading Data
file1<-"DataImported/summarySCC_PM25.rds"
file2<- "DataImported/Source_Classification_Code.rds"
NEI <- readRDS(file1)
SCC <- readRDS(file2)



dev.off()

## Extracting motor vehicle sources data
dataMotorOnVhcls<-subset(NEI, type == "ON-ROAD")

## computing the sum of emissions by year
SommeMotor<-tapply(dataMotorOnVhcls$Emissions,dataMotorOnVhcls$year,sum,na.rm = TRUE)
dates<-strtoi(names(SommeMotor))

## plotting results

png("DataExported/plot5.png")
plot(dates,log10(SommeMotor) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale)" , xlab = "years" , col="gray")
title(main="PM2.5 - motor of vehicles in USA ", col.main="red", font.main=4)

dev.off()

