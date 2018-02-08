
analysisMethods <- function(method){
  method <- list(
    parameters = list(function(analysis){
      "
### Parameters

```{r analysisParamters,echo=FALSE}
analysis@parameters
```
"
    }),
    preTreatment = preTreatmentMethods(),
    classification = classificationMethods(),
    featureSelection = featureSelectionMethods(),
    correlations = correlationMethods()
  )
  return(method)
}