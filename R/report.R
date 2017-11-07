#' @importFrom readr write_file
#' @importFrom rmarkdown render
#' @export

report <- function(analysis,parameters){
  
  directoryPrep(analysis,parameters)
  
  report <- reportHeader(analysis,parameters)
  
  reportFile <- str_c(parameters@path,parameters@title,parameters@title,sep = '/')
                      
  write_file(report,str_c(reportFile,'.Rmd'))
  
  render(str_c(reportFile,'.Rmd'))
}