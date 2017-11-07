#' @importFrom stringr str_c

directoryPrep <- function(analysis,parameters){
  title <- parameters@title
  path <- parameters@path
  
  reportPath <- str_c(path,title,sep = '/')
  
  dir.create(reportPath)
  
  save(analysis,file = str_c(reportPath,'reportData.RData',sep = '/'))
}