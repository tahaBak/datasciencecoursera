pollutantmean<-function(directory,pollutant,id){

  tab=vector();
  dataAllf=vector();
  for(i in id){
    i=70;
   print(paste("i : ",i));
    
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
    
    print(fileName);
  
    dataAllf=read.csv(fileName);
    selectedColumnf=z[,c(pollutant)];

    
    tab = selectedColumn;
  }
  d=read.csv("specdata/070.csv");
  tab=dataAllf[,c("nitrate")];
   x=selectedColumnf[!is.na(selectedColumnf)]
  res= mean(tab,na.rm=TRUE);
  
  return (x)
}
pollutantmean("specdata", "nitrate", 70:70);
##############################################
dataAll70=read.csv("specdata/070.csv");
selectedColumnBis70=dataAll70[,c("nitrate")];
r=mean(selectedColumnBis70,na.rm=TRUE);
dataAll71=read.csv("specdata/071.csv");
selectedColumnBis71=dataAll71[,c("nitrate")];
s=mean(selectedColumnBis71,na.rm=TRUE);
dataAll72=read.csv("specdata/072.csv");
selectedColumnBis72=dataAll72[,c("nitrate")];
t=mean(selectedColumnBis72,na.rm=TRUE);
(r+s+t)/3;
u=c(selectedColumnBis70,selectedColumnBis71,selectedColumnBis72)
mean(u,na.rm=TRUE);
selectedColumnBis70[!is.na(selectedColumnBis70)]

