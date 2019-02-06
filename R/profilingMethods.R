
profilingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    spectralProcessing = list(
      '
      ## Spectral Processing
      
      ',
      overViewSection(analysis %>% resultsProcessing(),type = 'sub'),
      XCMSmethods()
    ),
    preTreat = list(
      '
      ## Analysis
      
      ',
      overViewSection(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$parameters,
      analysisMethods()$preTreatment
    ),
    classification = analysisMethods()$classification,
    featureSelection = analysisMethods()$featureSelection,
    correlations = analysisMethods()$correlations,
    annotation = list(
      '
## Annotation
      
',
      overViewSection(analysis %>% resultsAnnotation(),type = 'sub'),
      assignmentMethods()
    )
  )
  methods <- methods[names(methods) %in% flags]
  return(methods)
}