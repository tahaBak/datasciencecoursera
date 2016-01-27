library(datasets)
data(iris)
iris
x=iris[x]
mean(x)
rowMeans(iris[, 1:4])

library(datasets)
data(mtcars)

mtcars
tapply(mtcars$hp, mtcars$cyl, mean)
undebug(ls)
z= subset(iris,Species=="virginica")
r=z$Sepal.Length
mean(r)