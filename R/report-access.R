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

#' Get and set a report
#' @rdname report
#' @description Get and set a report in an S4 object of class Report.
#' @param x S4 object of class Report
#' @param value list containing report sections to set
#' @export

setMethod('report',signature = 'Report',
          function(x){
            x@report
          })

#' @rdname report
#' @export

setMethod('report<-',signature = 'Report',
          function(x,value){
            x@report <- value
            return(x)
          })

#' Return a report .Rmd
#' @rdname reportRMD
#' @description  Return a report markdown as a character string
#' @param x S4 object of class Report
#' @importFrom purrr flatten
#' @importFrom glue glue_collapse
#' @export

setMethod('reportRMD',signature = 'Report',
          function(x){
            r <- report(x) %>%
              map(~{
                map_chr(.x,rmd)
              }) %>%
              flatten()
            
            c(reportHeader(x) %>%
                rmd(),
              reportOptions(x) %>% 
                rmd(),
              r,
              sessionInformationSection(x) %>%
                rmd(),
              reportFooter(x) %>%
                rmd()) %>%
              glue_collapse(sep = '\n\n')
          })

#' Object classes included in a report
#' @rdname reportObjects
#' @description Return object calsses in a report.
#' @param x S4 object of class Report
#' @export

setMethod('reportObjects',signature = 'Report',
          function(x){
            report_data <- reportData(x)
            
            classes <- map_chr(report_data,class)
            
            objects <- names(report_data)
            names(objects) <- classes
            
            return(objects)
          })