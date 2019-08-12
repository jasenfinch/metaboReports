
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
    modelling = modellingMethods,
    correlations = correlationMethods
  )
  return(method)
}