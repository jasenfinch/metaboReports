#' @importFrom magrittr set_names

setMethod('generate',signature = 'Binalysis',
          function(x){
            
            list(
              title = sectionTitle(x),
              load = load(x),
              introduction = introduction(x),
              parameters = parameters(x),
              featureTable = featureTable(x),
              chromatograms = chromatograms(x),
              fingerprints = fingerprints(x),
              purityAndCentrality = purityAndCentrality(x),
              ticPlot = ticPlot(x),
              rsdPlot = rsdPlot(x)
            ) 
            
          })

setMethod('generate',signature = 'Assignment',
          function(x){
            
            list(
              title = sectionTitle(x),
              load = load(x),
              introduction = introduction(x),
              parameters = parameters(x),
              assignments = assignments(x)
            ) 
            
          })

#' Generate a report
#' @description Generate a report skeleton.
#' @param parameters S4 object of class ReportParameters
#' @param ... 
#' @importFrom magrittr %>%
#' @importFrom purrr map_chr
#' @importFrom rlang sym eval_tidy syms

setMethod('generateReport',signature = 'ReportParameters',
          function(parameters,...){
            
            r <- new('Report',parameters)
            
            argument_names <- as.character(match.call()) %>%
              .[-(1:2)] 
            
            report(r) <- argument_names %>%
              map(~{
                object_name <- sym(.x) 
                eval_tidy(expr(generate(!!object_name))) 
              }) %>%
              set_names(argument_names)

            reportData(r) <- argument_names %>%
              syms() %>%
              map(eval_tidy) %>%
              set_names(argument_names)
            
            return(r)
          })