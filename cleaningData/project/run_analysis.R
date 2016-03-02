
dataTest <- data.frame()

workingDirectory<-getwd()
# Building the test Set
testSet <-read.table(paste(workingDirectory,"/test/X_test.txt",sep=""),
                     header = FALSE)

testSubjects <-read.table(paste(workingDirectory,"/test/subject_test.txt",sep=""),
                          header = FALSE)

testSet$Subjects<- testSubjects$V1

testActivities <-read.table(paste(workingDirectory,"/test/y_test.txt",sep=""),
                            header = FALSE)

testSet$Activities<-testActivities$V1


#Building the train Part
trainSet <-read.table(paste(workingDirectory,"/train/X_train.txt",sep=""),
                     header = FALSE)
trainSubjects <-read.table(paste(workingDirectory,"/train/subject_train.txt",sep=""),
                          header = FALSE)
trainSet$Subjects<- trainSubjects$V1

trainActivities <-read.table(paste(workingDirectory,"/train/y_train.txt",sep=""),
                            header = FALSE)
trainSet$Activities<-trainActivities$V1


# merging the two data sets

temp <-c(trainSet,testSet)

mergedData<- rbind(trainSet,testSet)


dimMergedData<-dim(mergedData)


#features reading

features<-read.table(paste(workingDirectory,"/features.txt",sep=""),
                     header = FALSE)


selectedColumns<- features[grepl("(mean\\(\\))|(std\\(\\))",features$V2),]
selectedColumnsIndex<- selectedColumns[,1]


selectedColumnsIndex <-c(selectedColumnsIndex,dimMergedData[2]-1, dimMergedData[2])


UsefulMergedData<- mergedData[,selectedColumnsIndex]


#naming Activities
activitiesLabelsFrame<-read.table(paste(workingDirectory,"/activity_labels.txt",sep=""),
                             header=FALSE)

setActivity<-function(number){
as.character(activitiesLabelsFrame[activitiesLabelsFrame$V1==number,c(2)])
}
tempActivities<-c(UsefulMergedData$Activities)
UsefulMergedData$Activities<-sapply(tempActivities,setActivity)

#Renaming Data Set Variables
library(data.table)

newNames<- as.character(selectedColumns[,2])
newNames<-c(newNames,"Subjects","Activities")


setnames(UsefulMergedData,old=names(UsefulMergedData),
         new=newNames)

#computing the average
dimU<-(dim(UsefulMergedData))[2] -2

m1 <- matrix(0, ncol = 30, nrow = 30)
m2 <- matrix(0, ncol = 30, nrow = 6)
averageTidy<-data.frame(m1)
averageTidyBis<-data.frame(m2)

for(i in 1:dimU){
  
  #AverageTidy contains the average by Subject
  averageTidy[,i]<-tapply(UsefulMergedData[,i],
                        UsefulMergedData$Subjects,mean)  
  
  #AverageTidy contains the average by Activity
  averageTidyBis[,i]<-tapply(UsefulMergedData[,i],
                        UsefulMergedData$Activities,mean)  
  
}


#merging the results in one data frame globalAverage
globalAverage<-rbind(averageTidy,averageTidyBis)

setnames(globalAverage,old=names(globalAverage),
         new=names(UsefulMergedData)[1:dimU])

write.table(globalAverage,file=paste(workingDirectory,"/outPutResults.csv",sep=""),row.name=FALSE)
globalAverage


