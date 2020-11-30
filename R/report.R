#' # 
#' # hash <- function(type){
#' #   if (type == 'head') {
#' #     headHash <- '##'
#' #   }
#' #   
#' #   if (type == 'sub') {
#' #     headHash <- '###'
#' #   }
#' #   return(headHash)
#' # }
#' # 
#' # doReport <- function(analysis,parameters){
#' #   directoryPrep(analysis,parameters)
#' #   
#' #   report <- c(reportHeader(analysis,parameters),
#' #               loadData(analysis),
#' #               overViewSection(analysis))
#' #   
#' #   methods <- reportMethods(class(analysis)) %>%
#' #     {.(analysis)}
#' #   
#' #   methodSection <- map(methods,~{
#' #     if (is.function(.)) {
#' #       .(analysis)
#' #     } else {
#' #       .
#' #     }
#' #   })
#' #   
#' #   report <- c(report,
#' #               methodSection,
#' #               reportFooter(sessionInfo = parameters@sessionInfo)
#' #   ) %>%
#' #     str_c(collapse = '')
#' #   
#' #   title <- parameters@title %>%
#' #     str_replace_all(' ','_')
#' #   
#' #   reportFile <- str_c(parameters@path,title,title,sep = '/')
#' #   
#' #   write_file(report,str_c(reportFile,'.Rmd'))
#' #   
#' #   render(str_c(reportFile,'.Rmd'))
#' # }
#' 
#' #' Report generation
#' #' @rdname report
#' #' @description Automated, dynamic report generation for a metabolomic analysis.
#' #' @param analysis S4 object of class Binalysis, MetaboProfile, Analysis, Assignment or Workflow from which to genrate a report
#' #' @param parameters object of class ReportParameters
#' #' @seealso \code{\link{reportParameters}}
#' #' @importFrom magrittr %>%
#' #' @importFrom readr write_file
#' #' @importFrom rmarkdown render
#' #' @examples
#' #' \dontrun{
#' #' library(metaboWorkflows)
#' #' 
#' #' fp <- metaboData::filePaths('FIE-HRMS','BdistachyonEcotypes')
#' #' si <- metaboData::runinfo('FIE-HRMS','BdistachyonEcotypes')
#' #' 
#' #' wp <- workflowParameters('FIE-HRMS fingerprinting',fp,si,breaks = FALSE)
#' #' 
#' #' analysis <- workflow(wp)
#' #' 
#' #' ## For a Binalysis object
#' #' bd <- analysis %>%
#' #'  resultsProcessing()
#' #' p <- reportParameters('ExampleData','Steve French')
#' #' report(bd,p)
#' #' 
#' #' ## For an Analysis object
#' #' ad <- analysis %>%
#' #'  resultsAnalysis()
#' #' p <- reportParameters('ExampleData','Steve French')
#' #' report(ad,p)
#' #' 
#' #' ## For an Assignment object
#' #' as <- analysis %>%
#' #'  resultsAnnotation()
#' #' p <- reportParameters('ExampleData','Steve French')
#' #' report(as,p)
#' #' 
#' #' }
#' #' @export
#' 
#' #' setMethod('report',signature = 'Binalysis',function(analysis,parameters){
#' #'   doReport(analysis,parameters)
#' #' })
#' #' 
#' #' #' @rdname report
#' #' #' @export
#' #' 
#' #' setMethod('report',signature = 'MetaboProfile',function(analysis,parameters){
#' #'   doReport(analysis,parameters)
#' #' })
#' #' 
#' #' #' @rdname report
#' #' #' @export
#' #' 
#' #' setMethod('report',signature = 'Analysis',function(analysis,parameters){
#' #'   doReport(analysis,parameters)
#' #' })
#' #' 
#' #' #' @rdname report
#' #' #' @export
#' #' 
#' #' setMethod('report',signature = 'Assignment',function(analysis,parameters){
#' #'   doReport(analysis,parameters)
#' #' })
