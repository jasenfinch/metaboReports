#' Get and set report parameters
#' @rdname parameters
#' @description Get and set report paramters.
#' @param x S4 object of class ReportParameters
#' @param value parameter value to set
#' @export

setMethod('sessionInformation',signature = 'ReportParameters',
          function(x){
            x@sessionInfo
          })

#' @rdname parameters
#' @export

setMethod('sessionInformation<-',signature = 'ReportParameters',
          function(x,value){
            x@sessionInfo <- value
            return(x)
          })