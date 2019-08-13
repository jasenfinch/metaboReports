#' reportParameters
#' @description Initiate report parameters. 
#' @param title report title
#' @param investigator investigator name
#' @param sessionInfo TRUE/FALSE, should session info included?
#' @param toc TRUE/FALSE, should a table of contents be included
#' @param path report output path
#' @importFrom methods new
#' @export

reportParameters <- function(title, investigator, sessionInfo = TRUE, toc = TRUE, path = '.') {
  new('ReportParameters',
      path = path,
      title = title,
      investigator = investigator,
      sessionInfo = sessionInfo,
      toc = toc,
      date = Sys.Date(),
      output = 'html_document'
  )
}