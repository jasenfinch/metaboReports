#' reportParameters
#' @description Initiate report parameters. 
#' @param title report title
#' @param investigator investigator name
#' @param path report output path
#' @importFrom methods new
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