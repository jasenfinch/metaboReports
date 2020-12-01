#' Report parameters
#' @description Initiate report parameters. 
#' @param title report title
#' @param investigator investigator name
#' @param sessionInfo TRUE/FALSE, include session info
#' @param toc TRUE/FALSE, include a table of contents
#' @param echo TRUE/FALSE, echo code chunks
#' @param cache TRUE/FALSE, cache report code chunk data
#' @param path report output path
#' @seealso \code{\link{report}}
#' @importFrom methods new
#' @export

reportParameters <- function(title, 
                             investigator, 
                             sessionInfo = TRUE, 
                             toc = TRUE,
                             echo = FALSE,
                             cache = FALSE,
                             path = '.') {
  new('ReportParameters',
      path = normalizePath(path),
      title = title,
      investigator = investigator,
      sessionInformation = sessionInfo,
      toc = toc,
      echo = echo,
      cache = cache,
      output = 'html_document'
  )
}