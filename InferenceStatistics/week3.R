
qnorm(0.975)
qnorm(0.68)
data(sleep)
summary(sleep)
head(sleep,20)


## In a population of interest, a sample of 9 men yielded a sample average
## brain volume of 1,100cc and a standard deviation of 30cc. What is a 
## 95% Student's T confidence interval for the mean brain volume in this new 
## population?

r<-qt(0.975,df=8,lower.tail = FALSE)

meanD<-1100
sdDi<-30/sqrt(9)
maxL<-meanD-sdDi*r
maxL
minL<-meanD+sdDi*r
minL
## result : [1077,1123]

## A diet pill is given to 9 subjects over six weeks. The average
## difference in weight (follow up - baseline) is -2 pounds. What 
## would the standard deviation of the difference in weight have 
## to be for the upper endpoint of the 95% T confidence interval to touch 0?


r<-qt(0.975,df=8,lower.tail = FALSE)
r
meanD<-0
maxL<- -2
sdDi<-(-meanD+maxL)/r
sdBis<-sdDi*3
sdBis
##result : 2.6


#question 3 : paired interval

#question 4: 
## In a study of emergency room waiting times, investigators
## consider a new and the standard triage systems. To test 
## the systems, administrators selected 20 nights and randomly 
## assigned the new triage system to be used on 10 nights and 
## the standard system on the remaining 10 nights. They calculated 
## the nightly median waiting time (MWT) to see a physician. The average MWT
## for the new system was 3 hours with a variance of 0.60 while the average MWT for 
## the old system was 5 hours with a variance of 0.68. Consider the 95% confidence
## interval estimate for the differences of the mean MWT associated with the new 
## system. Assume a constant variance. What is the interval? Subtract in this order
## (New System - Old System). 
yhat<- 3
xhat<- 5
Sy<-sqrt(0.6)
Sx<-sqrt(0.68)
n<-10
m<-10
computeSp2<-function(a,n,b,m){
  result<-(((n-1)*(a^2))+((m-1)*(b^2))) / (n+m-2)
  result
}

t1<-qt(0.975,df=n+m-2)
Sp<-sqrt(computeSp2(Sy,n,Sx,m))
lMin<-yhat-xhat-(t1*Sp*sqrt((1/n)+(1/m)))
lMax<-yhat-xhat+(t1*Sp*sqrt((1/n)+(1/m)))
myInterval<-c(lMin,lMax)
print(myInterval)
t.test()
## I choose : -2.751649 -1.248351

#question 5:  The interval will be narrower.

#question 6 :
## To further test the hospital triage system, administrators selected 200 nights and randomly
## assigned a new triage system to be used on 100 nights and a standard system on the remaining 100 nights. 
## They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system 
## was 4 hours with a standard deviation of 0.5 hours while the average MWT for the old system was 6 hours with
## a standard deviation of 2 hours. Consider the hypothesis of a decrease in the mean MWT associated with the new treatment.

## What does the 95% independent group confidence interval with unequal variances suggest vis a vis this hypothesis? 
## Because there's so many observations per group, just use the Z quantile instead of the T.) 

tdf<-qnorm(0.975)
yhat<-6.0
Sy<-2.0
xhat<-4.0
Sx<-.5
nx<-100
ny<-100
P1<-(Sx^2)/nx
P2<-(Sy^2)/ny
rMin<-yhat-xhat-(tdf*(sqrt(P1+P2)))
print(rMin)
## Result : When subtracting (old - new) the interval contains 0. The new system appears to be effective.




#question 7 :
## Answer : [-5.364, -2.636] correct


# False Answers : 6