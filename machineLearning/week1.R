
install.packages("caret")
install.packages("kernlab")
library(caret)
library(kernlab)

data(spam)

inTrain<-createDataPartition(y=spam$type,p=0.75,list=FALSE)
training<-spam[inTrain,]
testing<-spam[-inTrain,]

head(training,1)
ncol(training)
M<- abs(cor(training[,-58]))
diag(M)<-0
dim(M)

which(M>0.8,arr.ind=T)

names(spam)[c(32,34)]


X<-0.71*training$num415+0.71*training$num857
Y<-0.71*training$num415-0.71*training$num857

plot(X,Y)



