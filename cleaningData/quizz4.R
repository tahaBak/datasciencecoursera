
#quizz 4 cleaning data

#question 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",method="curl",
              destfile="temp/file4-1.csv")

firstData<-read.csv("temp/file4-1.csv")

summary(firstData)

nrow(firstData)

resultNames<-strsplit(names(firstData),"wgtp")

resultNames[[123]]


#question 2

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",method="curl",
              destfile="temp/file4-2.csv")

secondData<-read.csv("temp/file4-2.csv" ,skip = 4, nrows = 190)
secondData$X.4<-as.character(secondData$X.4)
secondData$X.4<-gsub(",|\\s","",secondData$X.4)
secondData$X.4<-as.numeric(secondData$X.4)
mean(secondData$X.4)

#question 3
names(secondData)
countryNames<-as.character(secondData$X.3)
grep("^United",countryNames)

#question 4

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              method="curl",destfile="temp/file4-3.csv")

thirdData<-read.csv("temp/file4-3.csv")

mergedData<-merge(secondData,thirdData,by.x="X",by.y = "CountryCode",all = FALSE)
Criteria<-grepl("June 30",mergedData$Special.Notes)
table(Criteria)
mergedData$Special.Notes[Criteria]

mergedData[,c(1,3)]



