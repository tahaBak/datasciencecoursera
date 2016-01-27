
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