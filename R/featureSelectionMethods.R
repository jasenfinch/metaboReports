#' @importFrom metabolyseR featureSelectionResults

featureSelectionMethods <- function(analysis){
  if ({analysis %>% featureSelectionResults() %>% nrow()} > 0) {
    "
### Feature selection

```{r featureSelectionPlot,echo = F}
plotFeatureSelection(analysis)
````

```{r explanatoryHeatMap,echo = F,fig.height = 10}
feat <- analysis %>% featureSelectionResults()
if (T %in%(feat$Pvalue < 0.01)) {
 plotExplanatoryHeatmap(analysis)   
}
````

"
  } else {
    ""
  }
}