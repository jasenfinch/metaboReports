
analysisMethods <- function(analysis){
  method <- list(
    parameters = function(analysis,type = 'head'){
      headHash <- '##'
      
      if (type == 'sub') {
        headHash <- '###'
      }
      str_c("
",headHash," Parameters

```{r analysisParamters,echo=FALSE}
analysis@parameters
```
")
    },
    preTreatment = preTreatmentMethods,
    modelling = modellingMethods,
    correlations = correlationMethods
  )
  return(method)
}