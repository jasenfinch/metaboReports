#' report
#' @importFrom magrittr %>%
#' @importFrom readr write_file
#' @importFrom rmarkdown render
#' @examples 
#' data("exampleFIEworkflowResults")
#' p <- reportParameters('test')
#' report(analysis,p)
#' @export

report <- function(analysis,parameters){
  
  directoryPrep(analysis,parameters)
  
  report <- c(reportHeader(analysis,parameters),
              overViewSection(analysis),
              reportFooter()
              ) %>%
    str_c(collapse = '')
  
  reportFile <- str_c(parameters@path,parameters@title,parameters@title,sep = '/')
                      
  write_file(report,str_c(reportFile,'.Rmd'))
  
  render(str_c(reportFile,'.Rmd'))
}