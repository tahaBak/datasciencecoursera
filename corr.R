corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  id=1:332;
  result=vector();
  corp=numeric(0);
  mydtFrame=data.frame();
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
    
    mydtFrame=read.csv(fileName);
    
    dtTemp=complete.cases(mydtFrame);    
    nComplete=length(dtTemp[dtTemp==TRUE]);
    if(nComplete>threshold)
    {
      corp=cor(mydtFrame$sulfate,mydtFrame$nitrate,use="complete.obs",method=c("pearson"));
      result=c(result,corp);
    }
  }
  
  return (result)
  
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}
