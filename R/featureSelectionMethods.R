#' @importFrom metabolyseR featureSelectionResults

featureSelectionMethods <- function(analysis){
  if ({analysis %>% featureSelectionResults() %>% nrow()} > 0) {
    "
### Feature selection

```{r featureSelectionPlot,echo = F}
plotFeatureSelection(analysis)
````

```{r explanatoryHeatMap,echo = F,fig.height = 10}
plotExplanatoryHeatmap(analysis)
````

"
  } else {
    ""
  }
}