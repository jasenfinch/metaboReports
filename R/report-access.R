#' Get and set report data
#' @rdname reportData
#' @description Get and set data in an S4 object of class Report.
#' @param x S4 object of class Report
#' @param value list containing data objects to set
#' @export

setMethod('reportData',signature = 'Report',
          function(x){
            x@data
          })

#' @rdname reportData
#' @export

setMethod('reportData<-',signature = 'Report',
          function(x,value){
            x@data <- value
            return(x)
          })