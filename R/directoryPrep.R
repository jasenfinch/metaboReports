#' @importFrom stringr str_c
#' @importFrom readr write_rds

directoryPrep <- function(analysis,parameters){
  title <- parameters@title
  path <- parameters@path
  
  reportPath <- str_c(path,title,sep = '/')
  
  dir.create(reportPath)
  
  write_rds(analysis,str_c(reportPath,'reportData.rds',sep = '/'))
}