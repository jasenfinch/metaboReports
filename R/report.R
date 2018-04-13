#' report
#' @description generate a report from a Binalysis analysis. 
#' @param analysis object of class Binalysis from which to genrate a report
#' @param parameters object of class ReportParameters
#' @importFrom magrittr %>%
#' @importFrom readr write_file
#' @importFrom rmarkdown render
#' @examples 
#' \dontrun{
#' ## For just a Binalysis object
#' data("exampleFIEworkflowResults")
#' analysis <- exampleFIEworkflowResults %>%
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
  
  methods <- methods[!(map(methods,is.null) %>% unlist())]
  
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