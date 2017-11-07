#' @export

reportParameters <- function(analysis,title,path = '.') {
  new('ReportParameters',
      path = path,
      title = title,
      date = Sys.Date(),
      workflow = analysis@workflowParameters@workflow
  )
}