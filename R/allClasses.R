#' Report parameters class
#' @description An S4 class to store report parameters.
#' @slot path report directory output path
#' @slot title report title
#' @slot investigator investigator name
#' @slot sessionInformation logical, inclusion of session information
#' @slot toc logical, inclusion of table of contents
#' @slot echo logical, inclusion of code chunks
#' @slot cache logical, cache data
#' @slot time creation time
#' @slot output output type
#' @export

setClass('ReportParameters',
         slots = list(
           path = 'character',
           title = 'character',
           investigator = 'character',
           sessionInformation = 'logical',
           toc = 'logical',
           echo = 'logical',
           cache = 'logical',
           time = 'Date',
           output = 'character'
         ),
         prototype = list(
           time = Sys.Date()
         )
)

setClass('Report',
         slots = list(
           data = 'list',
           report = 'list'
         ),
         contains = 'ReportParameters')