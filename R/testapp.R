
require(RCurl)
require(XML)

#define the function
get_url <- function(site) {
  
  html <- try(htmlParse(site))
  
  fail <- function(x) inherits(x, "try-error")
  
  if(!fail(html)) {
    
    xpath <- paste("//*[@class='product-container']/h2",sep="")
    data <- xpathSApply(html,xpath,xmlValue)
    
    return(data)
    
  } else {
    
    return(print("Jejda.Chyba.Pokračujte na další strán"))    
  }
  
} 

#define the function
wd <- function(type=0) {

  if(type==1){
    r<-sessionInfo(package=NULL)
  }else{
    r<-getwd()
  }
 
 return(r)
  
} 

#define the function
readwrite <- function(dir=NULL,type=1) {
  
  if(is.null(dir)){
    return(FALSE)
  }
  fail <- function(x) inherits(x, "try-error")
  
  d<- data.frame(a=c(1,2,3),b=c(3,5,6))
  
  if(type==1){
    try(write.csv(d,dir),silent=T)
    Sys.sleep(3)
    csv<-try(read.csv(dir),silent=T)
    if(!fail(csv)){
      a<-file.exists(dir)
      b<- csv
    }else{
      a<-file.exists(dir)
      b<-FALSE
    }
  }
  if(type==2){
    try(save(d,file=dir),silent=T)
    Sys.sleep(3)
    rda<-try(load(dir),silent=T)
    if(!fail(rda)){
      a<-file.exists(dir)
      b<-rda
    }else{
      a<-file.exists(dir)
      b<-FALSE
    }
  }

  r <- list(exists=a,data=b)
  
  return(r)
  
} 

