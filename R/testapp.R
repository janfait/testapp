
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
wd <- function(type) {

  if(type==1){
    r<-sessionInfo(package=NULL)
  }else{
    r<-getwd()
  }
 
 return(r)
  
} 