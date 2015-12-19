### Coursera Course 2

X=2;
class(X);
T = c(4, "a", TRUE);
class(T);
z=1:10;
y=z/5;
class(y);
g=lm(y-z);
class(g);
x <- list(2, "a", "b", TRUE);
class(x[[1]]);

x <- 1:4;
y <- 2:3;
x + y;

x <- c(3, 5, 1, 10, 12, 6);
x[x <= 5] <- 0;
x;

data<-read.csv("data.csv");
data[1:2,]
nrow(data)
data[152:153,]
data[47,]

Ozone<-data[,c("Ozone")];
bad<-is.na(Ozone);
mean(Ozone[!bad])

r<-subset(data,Temp>90 & Ozone>31);
s<-mean(r[,c("Solar.R")])
names(data)
s

t<-subset(data,Month==6)
mean(t[,c("Temp")])

m<-subset(data,Month==5)
max(m[,c("Ozone")],na.rm = TRUE)

x <- c(4, "a", TRUE);
class(x)

x <- list(2, "a", "b", TRUE);