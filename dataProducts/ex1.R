#Q1
install.packages("manipulate")
library(manipulate)
myPlot <- function(s) {
  plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
  abline(0, s)
}

manipulate(myPlot(s), s = slider(0, 2, step = 0.1))

#Q2
install.packages("rCharts")
install.packages("devtools")
install.packages("Rcpp")

library(devtools)
library(Rcpp)
install_github('ramnathv/rCharts')

require(rCharts)
dTable(airquality, sPaginationType = "full_numbers")
  

#Q3
#A ui.R and server.R file or a A server.R file and 
#a directory called www containing the relevant html files.

#Q4
library(shiny)

#Missing comma in panel
data("mtcars")
myset<-mtcars
write.csv(file="mtcar/mtcars.csv",myset)

install.packages("leaflet")



