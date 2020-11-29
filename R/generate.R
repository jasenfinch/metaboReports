
setMethod('generate',signature = 'Binalysis',
          function(x){
            c(
              parameters(x),
              results(x),
              featureTable(x),
              chromatograms(x),
              fingerprints(x),
              purityAndCentrality(x),
              ticPlot(x),
              rsdPlot(x)
            ) %>%
              str_c(collapse = '\n')
          })