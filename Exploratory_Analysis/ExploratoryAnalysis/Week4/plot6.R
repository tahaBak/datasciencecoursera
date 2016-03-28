
## Loading Data
file1<-"DataImported/summarySCC_PM25.rds"
file2<- "DataImported/Source_Classification_Code.rds"
NEI <- readRDS(file1)
SCC <- readRDS(file2)

dev.off()
png("DataExported/plot6.png" , width = 1024 , height = 724)
par(mfrow=c(1,2))

## Extracting data of motor vehicles in baltimore city
baltimoreData<-subset(NEI, type == "ON-ROAD" & fips=="24510")
sommeBaltimoreData<-tapply(baltimoreData$Emissions,baltimoreData$year ,sum,na.rm = TRUE)

dates<-strtoi(names(sommeBaltimoreData))
plot(dates,log10(sommeBaltimoreData) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale) in Baltimore" , xlab = "years" , col="blue")
title(main="motor vehicles in baltimore city", col.main="gray", font.main=4)

## Extracting data of motor vehicles in Los angeles city
losAngelesData<-subset(NEI, type == "ON-ROAD" & fips=="06037")
sommelosAngelesData<-tapply(losAngelesData$Emissions,losAngelesData$year ,sum,na.rm = TRUE)

dates<-strtoi(names(sommelosAngelesData))
plot(dates,log10(sommelosAngelesData) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale) in los Angeles" , xlab = "years" , col="blue")
title(main="motor vehicles in Los angeles city ", col.main="gray", font.main=4)

dev.off()