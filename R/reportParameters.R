#' @export

reportParameters <- function(title,path = '.') {
  new('ReportParameters',
      path = path,
      title = title,
      date = Sys.Date(),
      output = 'html_document'
  )
}