download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",method="curl",
              destfile="myData")

myData<-read.table("myData",sep=",",header = TRUE)
head(myData)              

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
libs/rJava.so

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
library(XML)
install.packages("XML")

doc<-xmlTreeParse("importedXmlFile",useInternal=TRUE)

rootNode<-xmlRoot(doc)
xmlName(rootNode)
r<-xpathSApply(rootNode,"//zipCode",xmlValue)
