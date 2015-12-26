complete <- function(directory, id = 1:332) {
 ## 'directory' is a character vector of length 1 indicating
 ## the location of the CSV files
 
 dtFrame=data.frame(integer(0),integer(0));
 colnames(dtFrame)<-c("id","nobs");
 dtTemp=data.frame();
 fileName=vector();
 nComplete=integer(0);
 index=numeric(0);
 ids=vector();
 nobs=vector();
 for(i in id)
 {
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
     
     dtTemp=complete.cases(read.csv(fileName));
     
     nComplete=length(dtTemp[dtTemp==TRUE]);
   
     ids=c(ids,i);
     nobs=c(nobs,nComplete);

 }
 dtFrame=data.frame(ids,nobs);
 colnames(dtFrame)=c("id","nobs");
 return (dtFrame)
}
#complete("specdata", 1);
#complete("specdata", c(2, 4, 8, 10, 12));
#complete("specdata", 30:25);
#complete("specdata", 30:25);
