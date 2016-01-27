


#dplyr 
#Create a logical vector that identifies the households on greater 
#than 10 acres who sold more than $10,000 worth of agriculture products. 
#Assign that logical vector to the variable agricultureLogical. 
#Apply the which() function like this to identify the rows of the 
#data frame where the logical vector is TRUE. 

#question 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",method="curl",
              destfile="myData4")

myData<-read.table("myData4",sep=",",header = TRUE)
names(myData)
agricultureLogical <- myData$ACR==3 & myData$AGS==6
head(myData[which(agricultureLogical),])


#question 2
#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
# raster is a grill model  of data
install.packages("jpeg")
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",
              method="curl",destfile="temp/myData4.jpg")

myImage<-readJPEG("temp/myData4.jpg",native=TRUE)
summary(myImage)
quantile(myImage,c(0.30,0.80))


#question 3
install.packages("data.table")
library(data.table)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",method="curl",
              destfile="temp/firstFile")


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              method="curl",destfile="temp/secondFile")

firstData<-read.csv("temp/firstFile",
                    skip = 4, nrows = 190)
secondData<-read.csv("temp/secondFile", nrows = 235)
mergedData<-merge(firstData,secondData,by.x="X",by.y = "CountryCode",all = FALSE)
nrow(mergedData)
resBis<-arrange(mergedData,desc(X.1))

orderedMergedData<-arrange(mergedData,X.4)

head(resBis[,1:6],15)

