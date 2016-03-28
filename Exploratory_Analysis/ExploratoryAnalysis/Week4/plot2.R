## Loading Data
file1<-"DataImported/summarySCC_PM25.rds"
file2<- "DataImported/Source_Classification_Code.rds"
NEI <- readRDS(file1)
SCC <- readRDS(file2)


##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 

## extracting baltimore city data
baltimoreData<-subset(NEI,fips=="24510")

## computing the sum of emissions by year
baltimoreSommeEmission<-tapply(baltimoreData$Emissions,c(baltimoreData$year) ,sum,na.rm = TRUE)
dates<-strtoi(names(baltimoreSommeEmission))

## plotting the result in file DataExported/plot2.png
png("DataExported/plot2.png")
plot(dates,(baltimoreSommeEmission) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale) in Baltimore" , xlab = "years" , col="blue")
title(main="evolution of PM2.5 in baltimore city", col.main="gray", font.main=4)
dev.off()