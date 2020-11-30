#' @importFrom magrittr set_names

setMethod('generate',signature = 'Binalysis',
          function(x){
            
            list(
              parameters = parameters(x),
              featureTable = featureTable(x),
              chromatograms = chromatograms(x),
              fingerprints = fingerprints(x),
              purityAndCentrality = purityAndCentrality(x),
              ticPlot = ticPlot(x),
              rsdPlot = rsdPlot(x)
            ) 
            
            
          })


setMethod('generateReport',signature = 'ReportParameters',
          function(parameters,...){
            # r <- new('Report')
            # 
            # report(r) <- 
            #   
            #   reportData(r) <- list(x) %>%
            #   set_names(deparse(substitute(x)))
            # 
            # return(r)
          })