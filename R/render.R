#' Render a report
#' @rdname renderReport
#' @description Render a report.
#' @param x S4 object of class Report
#' @param open open report when generated
#' @param ... arguments to pass to \code{rmarkdown::render}
#' @importFrom rmarkdown render
#' @export

setMethod('renderReport',signature = 'Report',
          function(x,open = TRUE,...){
            
            reportDirectory(x)
            
            report_title <-  x %>%
              title() %>%
              str_replace_all(' ','_')
            
            report_rmd <- glue("{path(x)}/{report_title}/{report_title}.Rmd")
            
            render(report_rmd,...)
            
            if (isTRUE(open)) {
              browseURL( glue("{path(x)}/{report_title}/{report_title}.html")) 
            }
          })