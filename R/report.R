#' report
#' @description generate a report from a Binalysis analysis. 
#' @param analysis object of class Binalysis from which to genrate a report
#' @param parameters object of class ReportParameters
#' @importFrom magrittr %>%
#' @importFrom readr write_file
#' @importFrom rmarkdown render
#' @examples 
#' \dontrun{
#' library(metaboWorkflows)
#' library(magrittr)
#' data("exampleFIEworkflowResults")
#' 
#' ## For just a Binalysis object
#' analysis <- exampleFIEworkflowResults %>%
#'  resultsProcessing()
#' p <- reportParameters('ExampleData','Steve French')
#' report(analysis,p)
#' 
#' ## For Analysis object
#' analysis <- exampleFIEworkflowResults %>%
#'  resultsAnalysis()
#' p <- reportParameters('ExampleData','Steve French')
#' report(analysis,p) 
#' 
#' ## For Assignment object
#' analysis <- exampleFIEworkflowResults %>%
#'  resultsAnnotation()
#' p <- reportParameters('ExampleData','Steve French')
#' report(analysis,p) 
#' 
#' ## For workflow object
#' p <- reportParameters('ExampleData','Steve French')
#' report(exampleFIEworkflowResults,p) 
#' 
#' }
#' @export

report <- function(analysis,parameters){
  
  directoryPrep(analysis,parameters)
  
  report <- c(reportHeader(analysis,parameters),
              loadData(analysis),
              overViewSection(analysis))
  
  methods <- reportMethods(class(analysis)) %>%
  {.(analysis)}
  
  if (class(analysis) == 'Workflow') {
    methods <- methods %>%
    {.(analysis)} %>%
      unlist(recursive = T)
    binalysis <- analysis %>%
      resultsProcessing()
    analysis <- analysis %>%
      resultsAnalysis()
  }
  
  
  methodSection <- map(methods,~{
    if (is.function(.)) {
      .(analysis)
    } else {
      .
    }
  })
  
  report <- c(report,
              methodSection,
              reportFooter()
  ) %>%
    str_c(collapse = '')
  
  title <- parameters@title %>%
    str_replace_all(' ','_')
  
  reportFile <- str_c(parameters@path,title,title,sep = '/')
  
  write_file(report,str_c(reportFile,'.Rmd'))
  
  render(str_c(reportFile,'.Rmd'))
}