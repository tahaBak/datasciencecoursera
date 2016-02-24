data<-data.frame(Stat11=rnorm(100,mean=3,sd=2),
                 Stat21=rnorm(100,mean=4,sd=1),
                 Stat31=rnorm(100,mean=6,sd=0.5),
                 Stat41=rnorm(100,mean=10,sd=0.5),
                 Stat12=rnorm(100,mean=4,sd=2),
                 Stat22=rnorm(100,mean=4.5,sd=2),
                 Stat32=rnorm(100,mean=7,sd=0.5),
                 Stat42=rnorm(100,mean=8,sd=3),
                 Stat13=rnorm(100,mean=6,sd=0.5),
                 Stat23=rnorm(100,mean=5,sd=3),
                 Stat33=rnorm(100,mean=8,sd=0.2),
                 Stat43=rnorm(100,mean=4,sd=4))

boxplot(data)

library(datasets)
  
hist(airquality$Ozone)
  
# Afficher un parametre
par("bg")

#exemple base plott
with(airquality,plot(Wind,Ozone))
title(main="Ozone and Wind in New York City")

#another way + subessting observation of month of May

with(airquality,plot(Wind,Ozone,main="Ozone and Wind in New York City"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="green"))
legend("topright",pch=1,col=c("blue","red"),legend=c("May","Other Months"))


#plotting linear regression line
#pch determine le symbole d'un point affiche
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in New York City",pch=20))
model<-lm(Ozone~Wind,airquality)
abline(model,lwd=2)


# exemple of showing multiple plots in the same System
# Remember : airquality is the data frame
#on decoupe la fenetre en 1 ligne 2 colonnes
par(mfrow=c(1,2))

with(airquality,{ 
      plot(Wind,Ozone,main="Ozone and Wind")
      plot(Solar.R,Ozone, main="Ozone and Solar Radiation")})

#another of example of multiple plotting
# ajout titre
par(mfrow=c(1,3),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(airquality,{
  plot(Wind,Ozone,main="Ozone and Wind")
  plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
  plot(Temp,Ozone,main="Ozone and Temperature")
  mtext("Ozone and Weather in New York City " ,outer=TRUE)
})

# En resume on peut parametrer afficher enfin ajouter des details ^^

library(datasets)
#exemple 

x<-rnorm(100,mean=3)
hist(x)
y<-rnorm(100,mean=0)
plot(x,y)

#modifying the margins
par(mar=c(2,2,2,2))
plot(x,y)

#back the margins
par(mar=c(4,4,2,2))
plot(x,y)
  
#for a demo  : example(points)
example(points)


#writing text
plot(x,y)
title("Scatter plot")

legend("topleft",legend = "Data")

#example of plotting on the same plot two levels
length(x)
g<-gl(2,50,labels=c("Male","Female"))
length(y)
plot(x,y,type="n")
points(x[g=="Male"],y[g=="Male"],col="green")
points(x[g=="Female"],y[g=="Female"],col="blue")
points(x[g=="Female"],y[g=="Female"],col="blue",pch=19)




