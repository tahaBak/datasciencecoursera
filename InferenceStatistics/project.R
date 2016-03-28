

set.seed(100)
## Part I:
n<-40
lambda<- 0.2
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(rexp(n, lambda)))
averageOfMeans<-mean(mns)

png("DataExported/project/file2.png",height = 180,width = 260)
hist(mns,xlab="sample mean",main= "The histogram of sample means")
dev.off()

print(averageOfMeans)
print(1/lambda)


print("standard deviations")
sdMns<-sd(mns)
print(sdMns)

print((1/lambda)/sqrt(n))

hist(mns)

mns2 = NULL
for (i in 1 : 100000) mns2 = c(mns2, mean(rexp(n, lambda)))

png("DataExported/project/file2.png",height = 180,width = 260)
hist(mns2,xlab="sample mean",main= "The histogram of sample means")
dev.off()


##Part II:

library(dplyr)
library(ggplot2)
str(ToothGrowth)


summary(ToothGrowth)


groupedData<-group_by(ToothGrowth,supp)
myBoxPlots<-qplot(dose, len,data = groupedData,geom = c("boxplot"),facets = .~dose*supp, colour=supp) 

ggsave("DataExported/project/file4.png",myBoxPlots)

qplot(dose, len,data = groupedData,geom = c("point"),facets = .~supp, colour=supp) 




boxplot(len~supp*dose, data=ToothGrowth,
        col=(c("blue","red")),
        main="Tooth Growth", xlab="Suppliment et dose","length") 



##extracting data
ToothOneDose<-ToothGrowth[ToothGrowth$dose==0.5,]
Oj1<-ToothOneDose[ToothOneDose$supp=="OJ",]
Vc1<-ToothOneDose[ToothOneDose$supp=="VC",]

ToothTwoDose<-ToothGrowth[ToothGrowth$dose==1.0,]
Oj2<-ToothTwoDose[ToothTwoDose$supp=="OJ",]
Vc2<-ToothTwoDose[ToothTwoDose$supp=="VC",]

ToothTreeDose<-ToothGrowth[ToothGrowth$dose==2,]
Oj3<-ToothTreeDose[ToothTreeDose$supp=="OJ",]
Vc3<-ToothTreeDose[ToothTreeDose$supp=="VC",]

###testing the influance of the Dose on the length of tooth(same Sup) 

# checking that by increasing the dose , we got highier length , using OJ supplement
t.test(x=Oj1$len ,y= Oj2$len,paired = FALSE ,alternative = c("less"))$p.value

t.test(x=Oj2$len ,y= Oj3$len,paired = FALSE ,alternative = c("less"))$p.value

# checking that by increasing the dose , we got highier length , using VC supplement
t.test(x=Vc1$len ,y= Vc2$len,paired = FALSE ,alternative = c("less"))$p.value
t.test(x=Vc2$len ,y= Vc3$len,paired = FALSE ,alternative = c("less"))$p.value


## testing OJ is better than VC

## for 0.5 of dose

t.test(x=Oj1$len ,y= Vc1$len,paired = FALSE ,alternative = c("greater"))$p.value


## for 1 of dose

t.test(x=Oj2$len ,y= Vc2$len,paired = FALSE ,alternative = c("greater"))$p.value

## for 2 of dose

t.test(x=Oj3$len ,y= Vc3$len,paired = FALSE ,alternative = c("greater"))$p.value

##############################



