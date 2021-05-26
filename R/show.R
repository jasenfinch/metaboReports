#' ReportParameters class show method
#' @rdname show-ReportParameters
#' @description Show method for ReportParameters class
#' @param object S4 object of class ReportParameters
#' @importFrom crayon blue bold col_nchar
#' @importFrom purrr map
#' @export

setMethod('show',signature = 'ReportParameters',
          function(object){
            
            cat(bold(blue('\nReport parameters:\n')))
            
            slots <- slotNames(object)
            slots[8] <- 'creationDate'
            
            pars <- slots %>%
              map(do.call,args = list(x = object)) %>%
              set_names(slots)

            par_names <- glue("{names(pars)}:") %>%
              blue()
            
            pars <- str_c('\t',pars)
            
            pars[col_nchar(par_names) < 15] <- str_c('\t',pars[col_nchar(par_names) < 15])
            pars[col_nchar(par_names) < 7] <- str_c('\t',pars[col_nchar(par_names) < 7])

            pars <- pars %>%
              str_c(par_names,.,sep = ' ') %>%
              str_c(collapse = '\n')

              cat(pars)
          })

#' Report class show method
#' @rdname show-Report
#' @description Show method for Report class
#' @param object S4 object of class Report
#' @importFrom tibble as_tibble
#' @importFrom crayon red
#' @export

setMethod('show',signature = 'Report',
          function(object){
            
            objects <- object %>%
              reportObjects() %>%
              names() %>%
              table() %>%
              as_tibble() %>%
              set_names(c('class','frequency')) %>%
              split(seq_len(nrow(.))) %>%
              map_chr(~{
                
                if (.x$frequency[1] > 1) {
                  objects_form <- 'objects'
                } else {
                  objects_form <- 'object'
                }
                 
                glue("{.$frequency} {objects_form} of class {red(.$class)}")  
              }) %>%
              glue_collapse(', ') %>%
              {
                glue("{.}.")
              }
            
            glue('\n\nReport containing {objects}\n\n') %>%
              cat()
            
            object %>%
              as('ReportParameters') %>%
              print()
            
          })
