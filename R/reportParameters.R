#' @export

reportParameters <- function(analysis,title,path = '.') {
  new('ReportParameters',
      path = path,
      title = title,
      date = Sys.Date(),
      output = 'html_document',
      workflow = analysis@workflowParameters@workflow,
      processing = list(),
      QC = list(),
      classification = list(),
      featureSelection = list()
  )
}