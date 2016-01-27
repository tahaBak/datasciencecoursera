##https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en

con=url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")

install.packages("httr")
library(httr)

oauth_endpoints("github")

library(httr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",method="curl",
              destfile="myData")

acs<-read.csv.sql("myData",sep=",",header = TRUE)
install.packages("sqldf")
library(sqldf)

head(acs)
test <- sqldf("select pwgtp1 from acs where AGEP < 50")

#question 4
con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
myDoc<-readLines(con)
close(con )

temp=c(myDoc[10],myDoc[20],myDoc[30],myDoc[100])
lapply(temp,nchar)

#question 5   use html parse 
urlTest<-url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
myDataFor<-readLines(urlTest)
close(urlTest)
0892476211
length(myDataFor)
extractLines<-myDataFor[5:length(myDataFor)]
length(extractLines)

myMethod<-function(myString){
  
  myString<-"The quick-111 brown fox jumps over"
  resFirst<-strsplit(myString," ")
  resFirst
  resSecond<-strsplit(resFirst[1],"-")
  resSecond[1]
}

