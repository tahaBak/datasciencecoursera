pollutantmean<-function(directory,pollutant,id = 1:332){

  tab=vector();
  dataAllf=vector();
  selectedColumnfIn=vector();
   x=vector();
  for(i in id){
   
    if(i<10)
    {
      fileName=paste(directory,"/00",toString(i),".csv",sep="");
    }
    else if(i<100 && i>9)
    {
      fileName=paste(directory,"/0",toString(i),".csv",sep="");
    }
    
    else {
      fileName=paste(directory,"/",toString(i),".csv",sep="");
    }
    
    dataAllf=read.csv(fileName);
     selectedColumnfIn=dataAllf[,c(pollutant)];
    x=selectedColumnfIn[!is.na(selectedColumnfIn)]
    
    tab = c(tab,x);
  }
  res= mean(tab,na.rm=TRUE);
  
  return (res)
}
pollutantmean("specdata", "nitrate", 70:72);
pollutantmean("specdata", "sulfate", 1:10);
pollutantmean("specdata", "nitrate", 23)

