
data("mtcars")

head(mtcars)
View(mtcars)
str(mtcars)

part1<-subset(mtcars,am==0)
hist(part1$mpg)
mean(part1$mpg)
median(part1$mpg)
part2<-subset(mtcars,am==1)
hist(part2$mpg)
mean(part2$mpg)
hist(part2$mpg)

d <- dist(as.matrix(mtcars))


par(mfrow=c(2,6))

ggplot(mtcars, aes(.~factor(am))) + 
  geom_boxplot()


##part1
boxplot(part1$mpg)
boxplot(part1$cyl)
boxplot(part1$disp)
boxplot(part1$hp)
boxplot(part1$drat)
boxplot(part1$wt)
boxplot(part1$qsec)
boxplot(part1$vs)
boxplot(part1$gear)
boxplot(part1$carb)
##part2
boxplot(part1$mpg)
boxplot(part1$cyl)
boxplot(part1$disp)
boxplot(part1$hp)
boxplot(part1$drat)
boxplot(part1$wt)
boxplot(part1$qsec)
boxplot(part1$vs)
boxplot(part1$gear)
boxplot(part1$carb)


boxplot(part2$wt)

library(ggplot2)
install.packages("cowplot")
library(cowplot)

library(gridExtra)
library(grid)
library(lattice)

grid.arrange(x1, x2, x3, x4, ncol=4)
x1<-ggplot(aes(y = mpg, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x2<-ggplot(aes(y = cyl, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x3<-ggplot(aes(y = disp, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x4<-ggplot(aes(y = hp, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x5<-ggplot(aes(y = drat, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x6<-ggplot(aes(y = wt, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x7<-ggplot(aes(y = qsec, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x8<-ggplot(aes(y = gear, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x9<-ggplot(aes(y = carb, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()

plot_grid(x1,x2,x3,x4,x5,x6,x7,x8,x9,ncol=4,nrow=6,labels=c("mpg","cyl","disp","hp","drat","wt","qsec","gear","carb"))

boxplot(part1$mpg)
boxplot(part1$cyl)
boxplot(part1$disp)
boxplot(part1$hp)
boxplot(part1$drat)
boxplot(part1$wt)
boxplot(part1$qsec)
boxplot(part1$vs)
boxplot(part1$gear)
boxplot(part1$carb)
plot_grid(x,y,ncol=2,labels=c("A","B"))
boxplot(part1$mpg)
boxplot(part1$cyl)
boxplot(part1$disp)
boxplot(part1$hp)
boxplot(part1$drat)
boxplot(part1$wt)
boxplot(part1$qsec)
boxplot(part1$vs)
boxplot(part1$gear)
boxplot(part1$carb)

boxplot(mtcars[,-c(factor(mtcars$am))])

ggplot(mtcars)+geom_boxplot(aes(x=factor(am), y=mpg))  + 
  geom_boxplot(aes(x=factor(am), y=wt)) 
+facet_grid(.~factor(am))
        
head(mtcars)

library(ggplot2)
multiplot(x,y,cols=2)
x
ggplot(aes(y =  cyl , x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()

ggplot(aes(y = gear, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()

ggplot(aes(y =  hp , x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()


facet_wrap(~factor(am),data=mtcars)

hist(part2$wt)







sapply(part2, function(x) sum(is.na(x)))
mtcars[!complete.cases(mtcars),]

is.na(mtcars)

r<-kmeans(mtcars,2)
r


hclust(mtcars)



x1<-ggplot(aes(y = mpg, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x2<-ggplot(aes(y = cyl, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x3<-ggplot(aes(y = disp, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x4<-ggplot(aes(y = hp, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x5<-ggplot(aes(y = drat, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x6<-ggplot(aes(y = wt, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x7<-ggplot(aes(y = qsec, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x8<-ggplot(aes(y = gear, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()
x9<-ggplot(aes(y = carb, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()+ theme_bw()

grid.arrange(x1, x2, x3, x4,x5,x6,x7,x8,x9, ncol=5)




library(ggplot2)

ggplot(aes(y = mpg, x = factor(am),fill=factor(am)), data = mtcars) + geom_boxplot()



## modeling mpg~am

mdlN<-lm(mpg~factor(am)-1,data=mtcars)
mdlG<-glm(mpg~factor(am)-1,data=mtcars,family=Gamma)

residG<-resid(mdlG)
residN<-resid(mdlN)

indexI<-c(rep("modelN",length(resid((mdlG)))),rep("modelGamma",length(resid((mdlG)))))

resValues<-c(residN,residG)

df<-data.frame(resValues,indexI)
ggplot(aes(y = resValues, x = factor(indexI),fill=factor(indexI)), data = df) + geom_boxplot()+ theme_bw()


names(mtcars)
mdlG2<-glm(mpg~factor(am)+wt,data=mtcars,family=Gamma)
anova(mdlG2,mdlG,test="Chisq")

mdlG2<-glm(mpg~factor(am)+wt -1,data=mtcars,family=Gamma)
mdlG2$coefficients

mdlG3<-glm(mpg~factor(am)+wt + factor(am)*wt -1,data=mtcars,family=Gamma)
mdlG3$coefficients

mdlG4<-glm(mpg~factor(am)+wt + cyl -1,data=mtcars,family=Gamma)
mdlG4$coefficients

mdlG$coefficients
summary(mdlG)
mdlN$coefficients


anova(mdlG,mdlG2,mdlG4, test="Chisq")
anova(mdlG2,mdlG4, test="Chisq")

plot( function(x) pgamma(x,shape=20,rate=2),0 , 30, xlab="x", ylab="y",
      main="Fig.2.5 2. Densités Gamma.",col="yellow")

plot( function(x) pgamma(x,shape=5,rate=1),0 , 30, xlab="x", ylab="y",
      main="Fig. 1. Densités Gamma.",col="blue")
curve( dgamma(x,shape=2,rate=.3), add=TRUE, col="red");


res<-ggplot()+geom_point(aes(y = fittedP, x = mtcars$mpg),color="blue")+theme_bw()+scale_x_discrete("helleo",limits=0:32)
res<-res+scale_y_discrete("fitted",limits=0:32)
res<-res+geom_point(aes(y = fittedG, x = mtcars$mpg),color="red")
res


par(mfrow=c(2,2))

boxplot(resid(mdlG))
boxplot(resid(mdlP))
boxplot(resid(mdlN))


length(mtcars$mpg)

warnings()


par(mfrow=c(2,2))
mdl1<-lm(mpg~factor(am)-1,data=mtcars)
summary(mdl1)$coef
hist(resid(mdl1))
mdl2<-glm(mpg~factor(am)-1,data=mtcars,family=poisson)
summary(mdl2)$coef
hist(resid(mdl2))
fitted(mdl2)
plot(mtcars$mpg,fitted(mdl2))
plot(mtcars$mpg,fitted(mdl1))


boxplot(resid(mdl2))
boxplot(resid(mdl1))

quantile(resid(mdl2))
quantile(resid(mdl1))

mdl2<-glm(mpg~factor(am),data=mtcars,family=poisson)
mdl21<-glm(mpg~factor(am)+carb,data=mtcars,family=poisson)

mdl22<-glm(mpg~factor(am)+carb+wt,data=mtcars,family=poisson)

mdl24<-glm(mpg~factor(am)+wt+wt*factor(am),data=mtcars,family=poisson)

mtcars$mpgBis<-1/mtcars$mpg

mdl2b<-glm(mpg~factor(am),data=mtcars,family=Gamma)

resid(mdl2b)

summary(mdl2b)$coef



ze<-1/fitted(mdl2b)
head(fitted(mdl2b))
hist(resid(mdl2b))



quantile(resid(mdl2b))

cor(mtcars$wt,factor(mtcars$am))

str(mtcars)

anova(mdl23 ,mdl22, test="Chisq")


summary(mdl2)$coef
summary(mdl21)$coef
    
str(mtcars)


################################
