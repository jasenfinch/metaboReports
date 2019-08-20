
profilingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    peakPick = list(
      '
## Spectral Processing
      
      ',
      overViewSection(analysis %>% resultsProcessing(),type = 'sub'),
      XCMSmethods$parameters,
      XCMSmethods$results,
      XCMSmethods$chromatograms,
      XCMSmethods$ticPlot,
      XCMSmethods$featureTable
    ),
    deconvolve = list(
      '
## Spectral deconvolution

',
      overViewSection(analysis %>% resultsProcessing(),type = 'sub'),
      erahMethods$parameters,
      erahMethods$results,
      erahMethods$chromatograms,
      erahMethods$ticPlot,
      erahMethods$featureTable
    ),
    preTreat = list(
      '
## Analysis
      
',
      overViewSection(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$parameters(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$preTreatment(analysis %>% resultsAnalysis(),type = 'sub')
    ),
    modelling = analysisMethods()$modelling(analysis %>% resultsAnalysis(),type = 'sub'),
    correlations = analysisMethods()$correlations(analysis %>% resultsAnalysis(),type = 'sub'),
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