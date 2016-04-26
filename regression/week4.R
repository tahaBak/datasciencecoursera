
library(MASS)
data("shuttle")
?shuttle


head(shuttle)

#question 1

# Consider the space shuttle data ?shuttle in the MASS library. Consider modeling 
# the use of the autolander as the outcome (variable name use). Fit a logistic 
# regression model with autolander (variable auto) use (labeled as “auto” 1) versus 
# not (0) as predicted by wind sign (variable wind). Give the estimated odds ratio
# for autolander use comparing head winds, labeled as “head” in the variable headwind
# (numerator) to tail winds (denominator).
shuttle$useBinary <- as.integer(shuttle$use == "auto")
fit12 <- glm(useBinary ~ wind-1, data = shuttle,family=binomial)

exp(coef(fit12))[1]/exp(coef(fit12))[2] #Estimated Odds ratio

## question 2

##Consider the previous problem. Give the estimated odds ratio for autolander use 
#comparing head winds (numerator) to tail winds (denominator) adjusting for wind 
#strength from the variable magn.

fit21 <- glm(useBinary ~ wind+magn-1, data = shuttle,family=binomial)
exp(summary(fit21)$coef)
exp(coef(fit21))[1]/exp(coef(fit21))[2]


## question 3

# If you fit a logistic regression model to a binary variable, 
# for example use of the autolander, then fit a logistic regression
# model for one minus the outcome (not using the autolander) what happens
#to the coefficients?
mdl31<-glm(useBinary~wind,family="binomial",shuttle)
coef(mdl31)
mdl32<-glm(I(1-useBinary)~wind,family="binomial",shuttle)
coef(mdl32)

## question 4
# Consider the insect spray data InsectSprays. Fit a Poisson model
# using spray as a factor level. Report the estimated relative rate 
# comparing spray A (numerator) to spray B (denominator).
?InsectSprays
head(InsectSprays)
mdl41<- glm(count ~ factor(spray), data = InsectSprays,family=poisson)
exp(-coef(mdl41)[2])


##question 6

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
#Consider the data x <- -5:5 
#y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97) 
#Using a knot point at 0, fit a linear model that looks like a hockey stick
#with two lines meeting at x=0. Include an intercept term, x and the knot
#point term. What is the estimated slope of the line after 0?

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
knots<-c(0)

splineTerms<-sapply(knots,function(knot) (x>knot)*(x-knot))

fit<-lm(y~x+splineTerms)
ybis<-predict(fit)
(ybis[9]-ybis[8])
### Exercising


library(swirl)

install.packages("car")

install.packages("pbkrtest")
R.version

install.packages("lme4")

packageurl <- "https://cran.r-project.org/src/contrib/Archive/pbkrtest/pbkrtest_0.4-4.tar.gz"

install.packages(packageurl, repos=NULL, type="source")

library(car)

swirl()