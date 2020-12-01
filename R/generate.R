#' @importFrom magrittr set_names

setMethod('generate',signature = 'Binalysis',
          function(...){
            
            list(
              title = sectionTitle(...),
              load = load(...),
              introduction = introduction(...),
              parameters = parameters(...),
              featureTable = featureTable(...),
              chromatograms = chromatograms(...),
              fingerprints = fingerprints(...),
              purityAndCentrality = purityAndCentrality(...),
              ticPlot = ticPlot(...),
              rsdPlot = rsdPlot(...)
            ) 
            
          })

setMethod('generate',signature = 'Assignment',
          function(...){
            
            list(
              title = sectionTitle(...),
              load = load(...),
              introduction = introduction(...),
              parameters = parameters(...),
              assignments = assignments(...)
            ) 
            
          })

#' Generate a report
#' @description Generate a report skeleton.
#' @param parameters S4 object of class ReportParameters
#' @param ... 
#' @importFrom magrittr %>%
#' @importFrom purrr map_chr

setMethod('generateReport',signature = 'ReportParameters',
          function(parameters,...){
            
            r <- new('Report',parameters)
            
            argument_names <- as.character(match.call()) %>%
              .[-(1:2)] 
            
            argument_names <- argument_names %>%
              map(sanitiseArgumentNames) %>%
              {
                names(.) <- map_chr(.,~{.$name}) 
                .
              }
            
            report(r) <- argument_names %>%
              map(~{
                glue('generate({.x$variable})') %>%
                  parse(text = .) %>%
                  eval()
              }) %>%
              set_names(names(argument_names))

            reportData(r) <- argument_names %>%
              map(~{
                .x$variable %>%
                  parse(text = .) %>%
                  eval()
              }) %>%
              set_names(names(argument_names))
            
            return(r)
          })