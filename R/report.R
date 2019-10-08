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
#' 
#' files <- metaboData::filePaths('FIE-HRMS','BdistachyonEcotypes') 
#' info <- metaboData::runinfo('FIE-HRMS','BdistachyonEcotypes')
#' 
#' wp <- workflowParameters('FIE-HRMS fingerprinting',files = files)
#' flags(wp) <- flags(wp)[-c(5,7)]
#' analysis <- workflow(files, info, wp)
#'
#' ## For just a Binalysis object
#' bd <- analysis %>%
#'  resultsProcessing()
#' p <- reportParameters('ExampleData','Steve French')
#' report(bd,p)
#' 
#' ## For Analysis object
#' ad <- analysis %>%
#'  resultsAnalysis()
#' p <- reportParameters('ExampleData','Steve French')
#' report(ad,p) 
#' 
#' ## For Assignment object
#' as <- analysis %>%
#'  resultsAnnotation()
#' p <- reportParameters('ExampleData','Steve French')
#' report(as,p) 
#' 
#' ## For workflow object
#' p <- reportParameters('ExampleData','Steve French')
#' report(analysis,p) 
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
    if (analysis %>%
        resultsProcessing() %>%
        class() == 'Binalysis') {
      binalysis <- analysis %>%
        resultsProcessing()
    }
    if (analysis %>%
        resultsProcessing() %>%
        class() == 'MetaboProfile') {
      processed <- analysis %>%
        resultsProcessing()
    }
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
              reportFooter(sessionInfo = parameters@sessionInfo)
  ) %>%
    str_c(collapse = '')
  
  title <- parameters@title %>%
    str_replace_all(' ','_')
  
  reportFile <- str_c(parameters@path,title,title,sep = '/')
  
  write_file(report,str_c(reportFile,'.Rmd'))
  
  render(str_c(reportFile,'.Rmd'))
}