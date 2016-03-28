

## project 2 of Exploratory analysis course

## Analyzing (PM2.5) Data

getwd()

## Loading Data
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

r<-tapply(NEI$Emissions,NEI$year,sum,na.rm = TRUE)

dates<-strtoi(names(r))
plot(dates,log10(r) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale)" , xlab = "years" , col="blue")
title(main="PM2.5 in USA ", col.main="red", font.main=4)


##Question 2 

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 

baltimoreData<-subset(NEI,fips=="24510")

rbaltimoreData<-tapply(baltimoreData$Emissions,c(baltimoreData$year) ,sum,na.rm = TRUE)

dates<-strtoi(names(rbaltimoreData))
plot(dates,(rbaltimoreData) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale) in Baltimore" , xlab = "years" , col="blue")
title(main="PM2.5 in baltimore", col.main="gray", font.main=4)


## Question 3

library(dplyr)
library(ggplot2)

groupedData<-group_by(baltimoreData,year,type)
results<-summarise(groupedData, Somme=sum(Emissions))

##
qplot(year, log10(Somme),data = results,geom = c("point","line"),weight = Somme,facets = .~type, colour=type) 


qplot(year,data = results,geom = c("histogram"),weight = Somme,facets = .~type, colour=type) 

ggsave(filename = "image.png")
subset(results,type=="POINT")
subset(results,type=="NONPOINT")
subset(results,type=="ON-ROAD")

head(subset(NEI,type=="ON-ROAD"))


## Question 4
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

dev.off()
par(mfrow=c(1,2))

combCodes<-SCC[grepl("Coal",SCC$Short.Name)&grepl("Comb",SCC$Short.Name),]
dataCombCoal<-subset(NEI, SCC %in% combCodes$SCC)
dataCombCoal$year<- factor(dataCombCoal$year)
SommeCombCoal<-tapply(dataCombCoal$Emissions,dataCombCoal$year,sum,na.rm = TRUE)
dates<-strtoi(names(SommeCombCoal))
plot(dates,log10(SommeCombCoal) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale)" , xlab = "years" , col="blue")
title(main="PM2.5 Combustion using coal in USA ", col.main="red", font.main=4)
nrow(dataCombCoal)



## Question 5

dataMotorOnVhcls<-subset(NEI, type == "ON-ROAD")
SommeMotor<-tapply(dataMotorOnVhcls$Emissions,dataMotorOnVhcls$year,sum,na.rm = TRUE)
dates<-strtoi(names(SommeMotor))
plot(dates,log10(SommeMotor) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale)" , xlab = "years" , col="gray")
title(main="PM2.5 - motor of vehicles in USA ", col.main="red", font.main=4)
nrow(dataMotorOnVhcls)



## Question 6


dev.off()
par(mfrow=c(1,2))

baltimoreData<-subset(NEI, type == "ON-ROAD" & fips=="24510")
sommeBaltimoreData<-tapply(baltimoreData$Emissions,baltimoreData$year ,sum,na.rm = TRUE)

dates<-strtoi(names(sommeBaltimoreData))
plot(dates,log10(sommeBaltimoreData) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale) in Baltimore" , xlab = "years" , col="blue")
title(main="PM2.5 - motor of Vehicles in baltimore", col.main="gray", font.main=4)
nrow(baltimoreData)

losAngelesData<-subset(NEI, type == "ON-ROAD" & fips=="06037")
sommelosAngelesData<-tapply(losAngelesData$Emissions,losAngelesData$year ,sum,na.rm = TRUE)

dates<-strtoi(names(sommelosAngelesData))
plot(dates,log10(sommelosAngelesData) , type="o" ,ylab="total sum of PM2.5 (Log10 Scale) in los Angeles" , xlab = "years" , col="blue")
title(main="PM2.5 - motor of Vehicles in los Angeles", col.main="gray", font.main=4)
nrow(losAngelesData)


Sys.which("pdflatex")
library(knitr)
install.packages("pdflatex")
