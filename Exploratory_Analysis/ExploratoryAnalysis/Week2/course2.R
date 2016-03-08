#using lattice plot
library(lattice)
library(datasets)

## Simple scatterplot
xyplot(Ozone~Wind|Month,data=airquality)

set.seed(10)
x<-rnorm(100)
f<-rep(0:1,each=50)
y<-x+f-f*x+rnorm(100,sd=0.5)

f<-factor(f,labels=c("groupe1","groupe2"))

xyplot(x~y|f,layout=c(2,1))

  
###############################################################
#using ggplot2
library(ggplot2)
  
str(mpg)

#color variable assign a color to the variable
qplot(displ,hwy,data=mpg,color=drv)

#displaying smoother (statistical thing) --> geom argument
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))

# making a histogram using qplot
qplot(hwy,data=mpg,fill=drv)

#using facets
qplot(displ,hwy,data=mpg,facets=.~drv)
         #or
qplot(hwy,data=mpg,facets=drv~. , binwidth=2)

library(nlme)
library(lattice)


lattice
Diet
Diet$weight
str(weight)

str(BodyWeight)

library(datasets)
data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

