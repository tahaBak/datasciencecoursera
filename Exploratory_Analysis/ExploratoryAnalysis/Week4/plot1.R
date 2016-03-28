

file1<-"DataImported/summarySCC_PM25.rds"
file2<- "DataImported/Source_Classification_Code.rds"
NEI <- readRDS(file1)
SCC <- readRDS(file2)


# what up data ?
head(SCC)
head(NEI)

## First question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

str(NEI)

NEI$year<- factor(NEI$year)

# computing the sum by year
r<-tapply(NEI$Emissions,NEI$year,sum,na.rm = TRUE)

dates<-strtoi(names(r))

png("DataExported/plot1.png")
plot(dates,log10(r) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale)" , xlab = "years" , col="blue")
title(main="PM2.5 in USA ", col.main="red", font.main=4)
dev.off()
