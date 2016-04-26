data(mtcars)

head(mtcars)
#question 1
fit1<-lm(mpg~factor(cyl)+wt,data = mtcars)
summary(fit1)$coefficients

#question 2
##Holding weight constant, cylinder appears to have less of an impact 
##on mpg than if weight is disregarded.
fit2<-lm(mpg~factor(cyl)+wt,data = mtcars)
fit2$coefficients

fit3<-lm(mpg~factor(cyl),data = mtcars)
fit3$coefficients

## question 3
install.packages("lmtest")
library(lmtest)
fit32<-lm(mpg~factor(cyl)+wt,data = mtcars)
fit31<-lm(mpg~factor(cyl)+wt+factor(cyl)*wt,data = mtcars)

anova(fit31,fit32) #  intereacion is not necessary


## question 4 The estimated expected change in MPG per half ton increase in weight.

lm(mpg ~ I(wt * 2) + factor(cyl), data = mtcars)
lm(mpg ~ I(wt) + factor(cyl), data = mtcars)

## question 5

## hatvalue: computing the influence of removing a point from a model
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

xi<-lm(y~x)
hatvalues(xi)


#question 5

dfbetas(xi)
library(swirl)


