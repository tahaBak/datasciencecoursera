
best <- function(state, outcome) {

  ## Read outcome data
  data <- read.csv("usdata/outcome-of-care-measures.csv", colClasses = "character")
  states <- data$State
  
  theCauses=c("heart attack","heart failure","pneumonia")
  
  CapitalCauses=c("Heart.Attack","Heart.Failure","Pneumonia")
  nameOfCause=paste("Hospital.30.Day.Death..Mortality..Rates.from.",gsub(" ", ".", outcome, fixed = TRUE),sep="")
  
  
  if(outcome%in% theCauses == FALSE)
  {
    stop("invalid outcome")
  }
  
    
   if( (state %in% states) == FALSE)
   {
     stop("invalid state")
   }
  

  
  if(outcome=="heart attack")
  {
    usefulData=data[,c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","State","Hospital.Name")]    
    filterDatabyState=subset(usefulData,State==state)
    
    names(filterDatabyState)
    numbersDeath=as.numeric(filterDatabyState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    sortednumbers=sort(numbersDeath)
    
    
    filterDatabyState[,1]=as.numeric(filterDatabyState[,1])
    
    minFilteredByState=subset(filterDatabyState,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==sortednumbers[1])
    
  

    names(minFilteredByState)

    orderedResultAlpha=minFilteredByState[order(minFilteredByState$Hospital.Name),]
    
    orderedResultAlpha[1,"Hospital.Name"]
        
  }
  
  else if(outcome=="heart failure")
  {
    usefulData=data[,c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","State","Hospital.Name")]    
    filterDatabyState=subset(usefulData,State==state)
    
    names(filterDatabyState)
    numbersDeath=as.numeric(filterDatabyState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    sortednumbers=sort(numbersDeath)
    
    
    filterDatabyState[,1]=as.numeric(filterDatabyState[,1])
    
    minFilteredByState=subset(filterDatabyState,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==sortednumbers[1])
    
    
    
    names(minFilteredByState)
    
    orderedResultAlpha=minFilteredByState[order(minFilteredByState$Hospital.Name),]
    
    orderedResultAlpha[1,"Hospital.Name"]
    
  }
  else if(outcome=="pneumonia")
  {
    usefulData=data[,c("Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia","State","Hospital.Name")]    
    filterDatabyState=subset(usefulData,State==state)
    
    names(filterDatabyState)
    numbersDeath=as.numeric(filterDatabyState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    sortednumbers=sort(numbersDeath)
    
    
    filterDatabyState[,1]=as.numeric(filterDatabyState[,1])
    
    minFilteredByState=subset(filterDatabyState,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==sortednumbers[1])
    
    
    
    names(minFilteredByState)
    
    orderedResultAlpha=minFilteredByState[order(minFilteredByState$Hospital.Name),]
    
    orderedResultAlpha[1,"Hospital.Name"]
    
  }
  
}


best("BB", "heart attack")
best("MD", "pneumonia")

best("NY", "hert attack")
best("TX","heart attack")


best("MD", "heart attack")

z <- subset(data, State=="TX")


h <-subset(z,Hospital.Name=="ABILENE REGIONAL MEDICAL CENTER")
h[,c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]

h$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack

t <-subset(z,Hospital.Name=="CYPRESS FAIRBANKS MEDICAL CENTER")

t[,c(11,13)]
h[,c(11,13)]


ColumnCause="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
state="TX"
names(data)

usefulData=data[,c(ColumnCause,"State","Hospital.Name")]
filterState=subset(usefulData,State==state)
test=filterState[order(filterState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)]
numbers=as.numeric(filterState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
sortednumbers=sort(numbers)
minNumber=as.character(sortednumbers[1])

filterState[,1]=as.numeric(filterState[,1])
names(filterState)

subset(filterState,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==sortednumbers[1])


cols = c(1, , 4, 5)    
df[,cols] = apply(df[,cols], 2, function(x) as.numeric(as.character(x))

edit(filterState, factor.mode = c("numeric","character", "character"))
names(filterState)
subset(filterState,as.numeric(filterState[ColumnCause0])==sortednumbers[1])

