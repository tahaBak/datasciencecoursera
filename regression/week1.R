
##minimizes the least squares equation

y <- c(0.18, -1.54, 0.42, 0.95)

x <-c(1,1,1,1)

alpha<-1.077
z<-c(2,2,2,2)

w <- c(2, 1, 3, 1,1)

sum(w)

y<-c(1,2,3,2,4)
z<-c(1,2,3,2,4.001)
plot(y,z)

plot(lm(y~1,weights = w))

y <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
r<-lm(y~1,weights = w)
r

r<-lm(y~1,weights = w)
r
anova(r)

y1<- c(0.18,0.18, -1.54, 0.42, 0.42, 0.42, 0.95)
mean(y1)

y <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
x <- c(1,1,1,1)
r<-lsfit(x, y,w)
r

r$coefficients


## question 2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

xc<-x-mean(x)
yc<-y-mean(y)
r1<-lm(y~x-1)
r1$coefficients

r1<-lm(yc~xc-1)
r1$coefficients




## question 3
data(mtcars)
r2<-lm(mtcars$mpg~mtcars$wt)
r2$coeff


##question 4
sdY<-1
sdX<-0.5*sdY
corre<-0.5
slopeB<-corre*(sdY/sdX)
slopeB


##question 5
b1<-0.4
xt<-1.5
yt<-b1*xt
yt

##question 6

x <- c(8.58, 10.46, 9.01, 9.64, 8.86)

xn<-(1/sd(x))*(x-mean(x))
xn


## question 7

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
r1<-lm(y~x)
r1$coefficients


##question 9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

r<-lm(x~1)
r