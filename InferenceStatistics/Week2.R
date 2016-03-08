##Suppose that diastolic blood pressures (DBPs) 
##  for men aged 35-44 are normally distributed with a 
##  mean of 80 (mm Hg) and a standard deviation of 10. About
##  what is the probability that a random 35-44 year old has a
##  DBP less than 70?
pnorm(70,mean=80,sd=10)


## Brain volume for adult women is normally distributed with a mean
## of about 1,100 cc for women with a standard deviation of 75 cc. 
## What brain volume represents the 95th percentile?
qnorm(0.95,mean=1100,sd=75)

## Consider the sample mean of 100 random adult women from this population.
## What is the 95th percentile of the distribution of that sample mean?
## n=100 , appliquons le theoreme centrale limite
qnorm(0.95,mean=1100,sd=(75.0/10))


## You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?
## Sn=sigma(Xi) ~ N(0.5*5 ,  0.5)
## lower.tail=FALSE pour recuperer la probabilite de la queue superieure
# Solution card(5,4)/(2^5) + 1/2^5
6/(2^5)


## The respiratory disturbance index (RDI), a measure of sleep disturbance, 
## for a specific population has a mean of 15 (sleep events per hour) and 
## a standard deviation of 10. They are not normally distributed. Give your
## best estimate of the probability that a sample mean RDI of 100 people is 
## between 14 and 16 events per hour? 
## mean sample follows normal distribution (15, 10/10)
r2<-pnorm(16,mean=15,sd=1)
r1<-pnorm(14,mean=15,sd=1)
r2-r1

## poisson T = sigma(Xi) ~ Poiss(mean=15)
ppois(10,lambda=15)


##
## r1==r2 presque vrai :
## rappelons que 1 est l'ecart type de rnorm
## donc r/sqrt(n) = ecart type de la distribution de la population des 
## moyennes des etanchillons de taille n 
## l'exemple ci-dessus demontre la veracite du theoreme
nosim<-1000
n<-10
r1<-sd(apply(matrix(rnorm(nosim*n),nosim),1,mean))
r2<-1/(sqrt(n))
r2
r1

## sommes cumulative et simulation des moyennes fair coin
n<-10000
means<-cumsum(sample(0:1,n,replace=TRUE))/(1:n)
plot(means)

install.packages("UsingR")
library(ggplot2)
library(UsingR)

data(father.son)
x<-father.son$sheight
str(x)
(mean(x))

n<-20
pvals<-seq(0.1,0.9,by=0.05)
nosim<-1000
coverage<-sapply(pvals,function(p){
  phats<-rbinom(nosim,prob=p,size=n)/n
  ll<-phats-qnorm(0.975)*sqrt(phats*(1-phats)/n)
  ul<-phats+qnorm(0.975)*sqrt(phats*(1-phats)/n)
  mean(ll<p & ul>p)
  })

str(coverage)
plot(coverage)

phats<-rbinom(nosim,prob=0.5,size=n)/n
str(phats)
ll<-phats-qnorm(0.975)*sqrt(phats*(1-phats)/n)
ul<-phats+qnorm(0.975)*sqrt(phats*(1-phats)/n)
mean(ll<0.5 & ul>0.5)