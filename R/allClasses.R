
setClass('Chunk',
         slots = list(
           label = 'character',
           knitr_options = 'list',
           code = 'list',
           text_above = 'character',
           text_below = 'character'
         ))

#' @importFrom knitr opts_chunk

setValidity('Chunk',function(object){
  knitr_options <- opts_chunk$get() %>%
    names()
  
  chunk_options <- object %>%
    chunkOptions() %>%
    names()
  
  options_matches <- chunk_options %in% knitr_options 
  
  if (FALSE %in% options_matches) {
    'knitr chunk option not found.'
  } else {
    return(TRUE)
  }
})

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
           creation_date = 'Date',
           output = 'character'
         ),
         prototype = list(
           creation_date = Sys.Date()
         )
)

setClass('Report',
         slots = list(
           data = 'list',
           report = 'list'
         ),
         contains = 'ReportParameters')
