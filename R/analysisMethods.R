
analysisMethods <- function(method){
  method <- list(
    preTreatment = preTreatmentMethods(),
    classification = classificationMethods(),
    featureSelection = featureSelectionMethods(),
    correlations = correlationMethods()
  )
  return(method)
}