#' @export

reportParameters <- function(title,investigator,path = '.') {
  new('ReportParameters',
      path = path,
      title = title,
      investigator = investigator,
      date = Sys.Date(),
      output = 'html_document'
  )
}