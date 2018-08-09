#' @importFrom metabolyseR featureSelectionResults

featureSelectionMethods <- function(analysis){
  if ({analysis %>% featureSelectionResults() %>% nrow()} > 0) {
    "
### Feature selection

```{r featureSelectionPlot,echo = F}
plotFeatureSelection(analysis)
```

```{r explanatoryHeatMap,echo = F,fig.height = 10}
feat <- analysis %>% featureSelectionResults()
methods <- feat$Method %>%
  unique()

if (T %in% (feat$Pvalue < 0.05)) {
  if (('fs.rf' %in% methods) & {feat %>% filter(Method == 'fs.rf',Pvalue < 0.01) %>% nrow()} > 0) {
    method <- 'fs.rf'
  } else {
    method <- feat %>%
      filter(Pvalue < 0.01) %>%
      .$Method %>%
      table() %>%
      sort(decreasing = T) %>%
      .[1] %>%
      names()
  }
  plotExplanatoryHeatmap(analysis,method = method)   
}
```

"
  } else {
    ""
  }
}