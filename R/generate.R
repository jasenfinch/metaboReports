#' @importFrom magrittr set_names

setMethod('generate',signature = 'Binalysis',
          function(...){
            
            list(
              title = sectionTitle(...),
              load = load(...),
              parameters = parameters(...),
              featureTable = featureTable(...),
              chromatograms = chromatograms(...),
              fingerprints = fingerprints(...),
              purityAndCentrality = purityAndCentrality(...),
              ticPlot = ticPlot(...),
              rsdPlot = rsdPlot(...)
            ) 
            
          })

#' Generate a report
#' @description Generate a report skeleton.
#' @param parameters S4 object of class ReportParameters
#' @param ... 
#' @importFrom magrittr %>%

setMethod('generateReport',signature = 'ReportParameters',
          function(parameters,...){
            
            r <- new('Report',parameters)
            
            argument_names <- as.character(match.call()) %>%
              .[-(1:2)]
            
            reports <- argument_names %>%
              map(~{
                glue('generate({.x})') %>%
                  parse(text = .) %>%
                  eval()
              }) %>%
              set_names(argument_names)
            
            report(r) <- reports

            reportData(r) <- argument_names %>%
              map(~{
                .x %>%
                  parse(text = .) %>%
                  eval()
              }) %>%
              set_names(argument_names)
            
            return(r)
          })