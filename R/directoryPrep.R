#' @importFrom stringr str_c

directoryPrep <- function(analysis,title,path = '.'){
  reportPath <- str_c(path,title,sep = '/')
  
  dirCmd <- str_c('mkdir',reportPath,sep = ' ')
  system(dirCmd)
  
  save(analysis,file = str_c(reportPath,'reportData.RData',sep = '/'))
  
  reportCmd <- str_c('touch',str_c(reportPath,str_c(title,'.Rmd'),sep = '/'),sep = ' ')
  system(reportCmd)
}