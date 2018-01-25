#' report
#' @importFrom magrittr %>%
#' @importFrom readr write_file
#' @importFrom rmarkdown render
#' @examples 
#' \dontrun{
#' ## For just a Binalysis object
#' data("exampleFIEworkflowResults")
#' analysis <- analysis %>%
#'  resultsProcessing()
#' p <- reportParameters('test','Steve French')
#' report(analysis,p)
#' }
#' @export

report <- function(analysis,parameters){
  
  directoryPrep(analysis,parameters)
  
  report <- c(reportHeader(analysis,parameters),
              overViewSection(analysis))
  
  methods <- reportMethods(class(analysis)) %>%
    unlist(recursive = F)
  
  methodSection <- map(methods,~{
    .(analysis)
  })
  
  report <- c(report,
              methodSection,
              reportFooter()
              ) %>%
    str_c(collapse = '')
  
  reportFile <- str_c(parameters@path,parameters@title,parameters@title,sep = '/')
                      
  write_file(report,str_c(reportFile,'.Rmd'))
  
  render(str_c(reportFile,'.Rmd'))
}