#' Get and set report parameters
#' @rdname parameters
#' @description Get and set report paramters.
#' @param x S4 object of class ReportParameters
#' @param value parameter value to set
#' @export

setMethod('path',signature = 'ReportParameters',
          function(x){
            x@path
          })

#' @rdname parameters
#' @export

setMethod('path<-',signature = 'ReportParameters',
          function(x,value){
            x@path <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('title',signature = 'ReportParameters',
          function(x){
            x@title
          })

#' @rdname parameters
#' @export

setMethod('title<-',signature = 'ReportParameters',
          function(x,value){
            x@title <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('investigator',signature = 'ReportParameters',
          function(x){
            x@investigator
          })

#' @rdname parameters
#' @export

setMethod('investigator<-',signature = 'ReportParameters',
          function(x,value){
            x@investigator <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('sessionInformation',signature = 'ReportParameters',
          function(x){
            x@sessionInformation
          })

#' @rdname parameters
#' @export

setMethod('sessionInformation<-',signature = 'ReportParameters',
          function(x,value){
            x@sessionInformation <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('toc',signature = 'ReportParameters',
          function(x){
            x@toc
          })

#' @rdname parameters
#' @export

setMethod('toc<-',signature = 'ReportParameters',
          function(x,value){
            x@toc <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('echo',signature = 'ReportParameters',
          function(x){
            x@echo
          })

#' @rdname parameters
#' @export

setMethod('echo<-',signature = 'ReportParameters',
          function(x,value){
            x@echo <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('cache',signature = 'ReportParameters',
          function(x){
            x@cache
          })

#' @rdname parameters
#' @export

setMethod('cache<-',signature = 'ReportParameters',
          function(x,value){
            x@cache <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('time',signature = 'ReportParameters',
          function(x){
            x@time
          })

#' @rdname parameters
#' @export

setMethod('time<-',signature = 'ReportParameters',
          function(x,value){
            x@time <- value
            return(x)
          })

#' @rdname parameters
#' @export

setMethod('output',signature = 'ReportParameters',
          function(x){
            x@output
          })

#' @rdname parameters
#' @export

setMethod('output<-',signature = 'ReportParameters',
          function(x,value){
            x@output <- value
            return(x)
          })