
# question 1

library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test) 

head(vowel.test)
head(vowel.train)
summary(vowel.test)
str(vowel.test)
colnames(vowel.test)

vowel.test$y <- factor(vowel.test$y)
vowel.train$y <- factor(vowel.train$y)

set.seed(33833)

rfFit <- train(y~. ,data=vowel.train,method="rf",prox=TRUE)
rfFit

vowel.train$y <- as.numeric(vowel.train$y)
vowel.train$y <- factor(vowel.train$y)
gbmFit <-  train(y~. ,data=vowel.train,method="gbm") 
gbmFit

predictRf<- predict(rfFit,vowel.test)
predictGbmt<- predict(gbmFit,vowel.test)
confusionMatrix(predictRf,predictGbmt)
confusionMatrix(predictRf,vowel.test$y)
confusionMatrix(predictGbmt,vowel.test$y)

#### the correct answer seems to be :
##RF Accuradcy = 0.6082
##GBM Accuracy = 0.5152
##Agreement Accuracy = 0.6361

##question 2
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

head(training,1)
str(training)

set.seed(62433)
mdl21<-train(diagnosis~. ,data=training,method="rf",prox=TRUE)
mdl22<-train(diagnosis~. ,data=training,method="gbm")
mdl23<-train(diagnosis~. ,data=training,method="lda")


pred21<-predict(mdl21,testing)
pred22<-predict(mdl22,testing)
pred23<-predict(mdl23,testing)

str(pred23)
predDF <- data.frame(pred21,pred22,pred23,diagnosis=testing$diagnosis)
mdlComb<-train(diagnosis~. ,data=predDF,method="rf",prox=TRUE)

predComb<-predict(mdlComb,predDF)

(confusionMatrix(pred21,testing$diagnosis)$overall)[1]
(confusionMatrix(pred22,testing$diagnosis)$overall)[1]
(confusionMatrix(pred23,testing$diagnosis)$overall)[1]
(confusionMatrix(predComb,testing$diagnosis)$overall)[1]

confusionMatrix(pred22,testing$diagnosis)
confusionMatrix(pred23,testing$diagnosis)
confusionMatrix(predComb,testing$diagnosis)

##question 3

set.seed(3523)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)
str(training)

install.packages("elasticnet")
library(elasticnet)
modLasso <- train(CompressiveStrength ~ ., data = training, method = "lasso")


plot.enet(modLasso$finalModel, xvar = "penalty", use.color = TRUE)
str(modLasso)
??plot.enet

##question 4
URL <- "https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv"
download.file(dest="myFile.csv",url = URL)
install.packages("lubridate")
library(lubridate) # For year() function below
install.packages("forecast")  
library(forecast)


dat = read.csv("myFile.csv")
str(dat)
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

#exploring data structures
str(modelTime)
str(training$visitsTumblr)


##creating a model , then extrapoling
modelTime <- bats(tstrain)
##forecasting
estimageValues <- forecast(modelTime, level = 95, h = nrow(testing))

res1<- (estimageValues$lower < testing$visitsTumblr) & (testing$visitsTumblr < estimageValues$upper)

sum(res1)/ nrow(testing)


#question  5
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]  

set.seed(325)  
library(e1071)
modelSvm <- svm(CompressiveStrength ~ ., data = training)
predictedValues <- predict(modelSvm, testing)

accuracy(predictedValues, testing$CompressiveStrength)
