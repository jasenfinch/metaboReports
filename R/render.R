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

#' @importFrom stringr str_replace_all
#' @importFrom rstudioapi initializeProject isAvailable
#' @importFrom readr write_file write_rds
#' @importFrom purrr walk

setMethod('reportDirectory',signature = 'Report',
          function(x){
            
            message('Creating report directory')
            
            report_title <-  x %>%
              title() %>%
              str_replace_all(' ','_')
            
            report_path <- glue("{path(x)}/{report_title}")
            
            glue("{report_path}/data") %>%
              dir.create(recursive = TRUE)
            
            message('Saving report data')
            
            if (isAvailable()) {
              initializeProject(report_path) 
            }
            
            report_rmd <- reportRMD(x)
            
            write_file(report_rmd,glue("{report_path}/{report_title}.Rmd"))
            
            report_data <- reportData(x)
            
            report_data %>%
              names() %>%
              walk(~{
                file_name <- sanitiseArgumentNames(.x)
                write_rds(report_data[[.x]],glue("{report_path}/data/{file_name$file_name}.rds"))
              })
          })