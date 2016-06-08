

install.packages("AppliedPredictiveModeling")

#question 1
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

#adData = data.frame(diagnosis,predictors)
#testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
#training = adData[-testIndex,]
#testing = adData[testIndex,]

#adData = data.frame(diagnosis,predictors)
#trainIndex = createDataPartition(diagnosis,p=0.5,list=FALSE)
#training = adData[trainIndex,]
#testing = adData[-trainIndex,]


#question 2

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

library(Hmisc)
library(gridExtra)
head(training)

set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

index <- seq_along(1:nrow(training))
training$index<-1:nrow(training)
str(training)

length(training)
names(training)
breaks <-3
x1<-qplot(index, CompressiveStrength, data=training,color=cut2(training$FineAggregate, g=breaks))
x2<-qplot(index, CompressiveStrength, data=training,color=cut2(training$Cement, g=breaks))
x3<-qplot(index, CompressiveStrength, data=training,color=cut2(training$BlastFurnaceSlag, g=breaks))
x4<-qplot(index, CompressiveStrength, data=training,color=cut2(training$FlyAsh, g=breaks))

x5<-qplot(index, CompressiveStrength, data=training,color=cut2(training$Age, g=4))
x6<-qplot(index, CompressiveStrength, data=training,color=cut2(training$CoarseAggregate, g=breaks))
x7<-qplot(index, CompressiveStrength, data=training,color=cut2(training$Water, g=breaks))
x8<-qplot(index, CompressiveStrength, data=training,color=cut2(training$Superplasticizer, g=breaks))

grid.arrange(x1,x2,x3)

grid.arrange(x4,x5,x6)

grid.arrange(x7,x8)

qplot(index, CompressiveStrength, data=training)

#There is a non-random pattern in the plot of the outcome versus index
#that does not appear to be perfectly explained by any predictor suggesting
#a variable may be missing.

#question 3
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
hist(log(mixtures$Superplasticizer+1))
hist(log(mixtures$Superplasticizer))
hist(mixtures$Superplasticizer)
#The log transform produces negative values which can not be used by 
#some classifiers.

#question 4
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

indexIL<- grep("^IL", colnames(training), value = TRUE)

preProcess(training[, indexIL], method=c("pca"), thresh=0.9)


#question 5
#install.packages('e1071', dependencies=TRUE)
index1<-c(indexIL,"diagnosis")

training1<-training[,index1]

testing1<-testing[,index1]

#classical model
mdlClassy <- train(diagnosis ~ ., method = "glm", data = training1)
confusionMatrix(testing1[,13],predict(mdlClassy,testing1[,-13]))

#PCA model

coeffPca<-preProcess(training1[, -13], method=c('pca'), thresh=0.8)

pcacls1<- predict(coeffPca, training1[, -13])
pca_model <- train(training1$diagnosis ~ ., data=pcacls1, method="glm")

pcacls2 <- predict(coeffPca, testing1[, -13])
confusionMatrix(testing1[,13],predict(pca_model,pcacls2))
                                      



