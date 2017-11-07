#' @importFrom stringr str_c

directoryPrep <- function(analysis,parameters){
  title <- parameters@title
  path <- parameters@path
  
  reportPath <- str_c(path,title,sep = '/')
  
  dirCmd <- str_c('mkdir',reportPath,sep = ' ')
  system(dirCmd)
  
  save(analysis,file = str_c(reportPath,'reportData.RData',sep = '/'))
}