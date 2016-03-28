
library(UsingR)

data(father.son)

x<-father.son$sheight
n<-length(x)

B<-10000

resamples<-matrix(sample(x,n*B,replace=TRUE),B,n)

resampledMedians <- apply(resamples,1,mean)

hist(resampledMedians)

library(swirl)
swirl()

x1<-c(140,138,150,148,135)
x2<-c(132,135,151,146,130)

res<-t.test(x=x1,y=x2,  paired = TRUE)

res$p.value

##question 2
mu<-1100
z0<-qt(0.975 ,df=8)
c(mu-z0*10, mu+z0*10)
# result [ 1076.94  ; 1123.06]


#question 3
res<-c(0,0,0,1)
tCockeVsPepsi<-t.test(res,mu=0)
tCockeVsPepsi$p.value

binom.test(3,4,p=0.5,alternative="g")


#question 4
#question 3*> 
poisson.test(10,T=1787,r=1/100,alternative="l")

  
#question 5
pooled.var = (1.5^2*8 + 1.8^2*8)/(9+9-2)
test_stat <- -3-1/sqrt(pooled.var/9)
pt(test_stat,8)
pt(test_stat,8) < .01



#question 7
  
power.t.test(n=100,delta=0.01,sd=0.04,type="one.sample",alternative = "one.sided")

#question 8

power.t.test(power=.9,delta=.01,sd=0.04,type="one.sample",alternative = "one.sided")

