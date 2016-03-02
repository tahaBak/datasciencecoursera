download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",method="curl",
              destfile="myData")

myData<-read.table("myData",sep=",",header = TRUE)
head(myData)              

#53
#36534720
#127
#
summary(myData)
colnames(myData)

head(myData)

head(myData,1)
install.packages("rJava")


J("java.lang.System","getProperty","java.version")


dataBis<-myData[myData[,"VAL"]=="",]
#question 1 
x<-myData$VAL>23
sum(x, na.rm=TRUE)


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,dest="importedSpread",method="curl")

#export LD_LIBRARY_PATH="/usr/lib/jvm/java-8-openjdk-amd64/jre/
#/usr/lib/jvm/java-8-openjdk-amd64/jre
install.packages("rJava")
install.packages("xlsxjars")
library(rJava)
library(xlsxjars)
  install.packages("xlsx")
colIndex<-7:15
rowIndex<-18:23

dat<-read.xlsx("importedSpread",sheetIndex = 1,colIndex = colIndex,
               rowIndex = rowIndex)

sum(dat$Zip*dat$Ext,na.rm=T)
library(xlsx)
library(xlsxjars)
library(readxl)
read_excel()

install.packages("rJava")
library(rJava)

dat<-read_excel("importedSpread. ")
read.xlsx("importedSpread",1)


fileUrlXml<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrlXml,dest="importedXmlFile",method="curl")

install.packages("XML")
library(XML)
doc<-xmlTreeParse("importedXmlFile",useInternal=TRUE)

rootNode<-xmlRoot(doc)
xmlName(rootNode)
r<-xpathSApply(rootNode,"//zipcode",xmlValue)
r[r=="21231"]


#comparing performances
fileUrlCommunities<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrlCommunities,dest="importedCommunities",method="curl")

library(data.table)
fileName<-"importedCommunities"
DT<-fread(fileName)
names(myCommunities)


start.time <- Sys.time()
mean(DT$pwgtp15,by=DT$SEX)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken # 0.001831293 
           # 0.002776146


start.time <- Sys.time()
mean(DT$pwgtp15,by=DT$SEX)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken


start.time <- Sys.time()
class(DT$x)
DT$SEX
DTBIS<-DT[ ,c("pwgtp15","SEX")]
rowMeans(DTBIS)[DTBIS$SEX==1];
rowMeans(DT)[DT$SEX==2]
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

start.time <- Sys.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken #0.002981424 


start.time <- Sys.time()
tapply(DT$pwgtp15,DT$SEX,mean)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken #0.002981424 

start.time <- Sys.time()
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken #0.034446 secs

start.time <- Sys.time()
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken #0.003111124 

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(DT[,mean(pwgtp15),by=SEX])
##sapply(split(DT$pwgtp15,DT$SEX),mean)  Pas sur 

#mean(DT$pwgtp15,by=DT$SEX)
#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
#spply ne marche pas
#DT[,mean(pwgtp15),by=SEX]
#0,0004910



