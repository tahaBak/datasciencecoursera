
##question 1
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

fit<-lm(y~x)
##pvalue- 0.05
summary(fit)$coefficients

## question 2
n<-length(y)
e<-resid(fit)
##std error 0.223
sqrt(sum((e^2)/(n-2)))


## question 3
## In the mtcars data set, fit a linear regression model 
## of weight (predictor) on mpg (outcome). Get a 95% confidence 
## interval for the expected mpg at the average weight. What is the lower endpoint?
data("mtcars")
y<-mtcars$mpg
x<-mtcars$wt
fit<-lm(y~x)
sumCoeff<-summary(fit)$coefficients
lowConf<-data.frame(predict(fit,
              newdata=data.frame(x=c(mean(x))),interval = ("confidence")))
summary(lowConf)


##question 5
lowConf<-data.frame(predict(fit,
                            newdata=data.frame(x=c(3.0)),interval = ("prediction")))
lowConf

##question 6


r<-sumCoeff[2,1]+c(-1,1)*qt(.975,df=fit$df)*sumCoeff[2,2]
2*r

## question 9

y<-mtcars$mpg
x<-mtcars$wt
fit<-lm(y~x)
e<-resid(fit)


 mean(y)
  interErr<-y-mean(y)
  
  expVar<-sum(e^2)/sum(interErr^2)
  expVar

1/expVar
#################################################################
library(UsingR)

data(diamond)

summary(diamond)

head(diamond)

y<-diamond$price
x<-diamond$carat

fit<-lm(y~x)

summary(fit)$coefficients












