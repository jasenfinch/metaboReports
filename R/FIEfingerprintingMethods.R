
FIEfingerprintingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    spectralBin = list(
      '
## Spectral Binning
      
',
      overViewSection(analysis %>% resultsProcessing()),
      binalysisMethods()
    ),
    preTreat = list(
      '
## Analysis
      
',
      overViewSection(analysis %>% resultsAnalysis()),
      analysisMethods()$preTreatment
    ),
    classification = analysisMethods()$classification,
    featureSelection = analysisMethods()$featureSelection,
    correlations = analysisMethods()$correlations
    
  )
  methods <- methods[names(methods) %in% flags]
  return(methods)
}