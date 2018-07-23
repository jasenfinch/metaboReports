
analysisMethods <- function(analysis){
  method <- list(
    parameters = function(analysis){
      "
### Parameters

```{r analysisParamters,echo=FALSE}
analysis@parameters
```
"
    },
    preTreatment = preTreatmentMethods,
    classification = classificationMethods,
    featureSelection = featureSelectionMethods,
    correlations = correlationMethods
  )
  return(method)
}