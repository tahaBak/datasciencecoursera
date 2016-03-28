## Loading Data
file1<-"DataImported/summarySCC_PM25.rds"
file2<- "DataImported/Source_Classification_Code.rds"
NEI <- readRDS(file1)
SCC <- readRDS(file2)

library(dplyr)
library(ggplot2)

## extracting baltimore data
baltimoreData<-subset(NEI,fips=="24510")

## grouping data by year and type
groupedData<-group_by(baltimoreData,year,type)

## computing by (year,type)
results<-summarise(groupedData, Somme=sum(Emissions))

## plotting by type in different facets, the sum of emissions by year
qplot(year, log10(Somme),data = results,geom = c("point","line"),weight = Somme,facets = .~type, colour=type) 

ggsave(filename = "DataExported/plot3.png")

