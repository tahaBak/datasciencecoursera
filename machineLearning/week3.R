
help(package="AppliedPredictiveModeling")

help(package="caret")

library(AppliedPredictiveModeling)
data(segmentationOriginal)

library(rpart.plot)
library(rattle)
library(caret)
#question 1
training<-segmentationOriginal[segmentationOriginal$Case=="Train",]
testing<-segmentationOriginal[segmentationOriginal$Case=="Test",]
set.seed(125)
mdl<-train(Class ~ ., data=training, method="rpart")
fancyRpartPlot(mdl$finalModel)

#a. TotalIntench2 = 23,000; FiberWidthCh1 = 10; PerimStatusCh1=2
#b. TotalIntench2 = 50,000; FiberWidthCh1 = 10;VarIntenCh4 = 100
#c. TotalIntench2 = 57,000; FiberWidthCh1 = 8;VarIntenCh4 = 100
#d. FiberWidthCh1 = 8;VarIntenCh4 = 100; PerimStatusCh1=2 
  # PS - WS - PS - not predictable

#question 2

#question 3

install.packages("pgmm")
library(pgmm)

data(olive)
head(olive,1)
olive = olive[,-1]

mdl<-train(Area ~ ., data=olive, method="rf")
fancyRpartPlot(mdl$finalModel)

newdata = as.data.frame(t(colMeans(olive)))
head(newdata,3)


res<-predict(mdl,newdata = newdata)
res # quantitative : it should be qualitative


#question 4

install.packages("ElemStatLearn")
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)

missClass = function(values, prediction){sum(((prediction > 0.5) * 1) != values) / length(values)}

mdl4 <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, 
                 data = trainSA, method = "glm", family = "binomial")

predicted4<-predict(mdl4, newdata = testSA)
missClass(testSA$chd, predicted4)

predicted4b<-predict(mdl4, newdata = trainSA)
missClass(trainSA$chd,predicted4b)


#question 5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)
set.seed(33833)
modvowel <- randomForest(y ~ ., data = vowel.train)
order(varImp(modvowel), decreasing = T)


