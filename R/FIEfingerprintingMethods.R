
FIEfingerprintingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    spectralBin = list(
      '
## Spectral Binning
      
',
      overViewSection(analysis %>% resultsProcessing(),type = 'sub'),
      binalysisMethods()
    ),
    preTreat = list(
      '
## Analysis
      
',
      overViewSection(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$preTreatment
    ),
    classification = analysisMethods()$classification,
    featureSelection = analysisMethods()$featureSelection,
    correlations = analysisMethods()$correlations
    
  )
  methods <- methods[names(methods) %in% flags]
  return(methods)
}