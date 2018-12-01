#' @importFrom stringr str_c str_replace_all
#' @importFrom readr write_rds
#' @importFrom rstudioapi initializeProject isAvailable

directoryPrep <- function(analysis,parameters){
  title <- parameters@title %>%
    str_replace_all(' ','_')
  path <- parameters@path
  
  reportPath <- str_c(path,title,sep = '/')
  
  dir.create(reportPath)
  
  if (isAvailable()) {
    initializeProject(reportPath) 
  }
  
  write_rds(analysis,str_c(reportPath,'reportData.rds',sep = '/'))
}