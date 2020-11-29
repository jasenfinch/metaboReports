#' Report parameters class
#' @description An S4 class to store report parameters.
#' @slot path report directory output path
#' @slot title report title
#' @slot investigator investigator name
#' @slot sessionInfo logical, inclusion of session info
#' @slot toc logical, inclusion of table of contents
#' @slot date creation date
#' @slot output output type
#' @export

setClass('ReportParameters',
         slots = list(
           path = 'character',
           title = 'character',
           investigator = 'character',
           sessionInfo = 'logical',
           toc = 'logical',
           date = 'Date',
           output = 'character'
         )
)

setClass('Report',
         slots = list(
           data = 'list',
           report = 'list',
         ),
         contains = 'ReportParameters')