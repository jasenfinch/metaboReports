#' @importFrom metabolyseR classificationResults

classificationMethods <- function(analysis){
  if ({analysis %>% classificationResults() %>% nrow()} > 0) {
    "
### Classification

```{r classificationPlot,echo = F}
plotClassification(analysis)
````

```{r classificationDendrogram,echo = F}
plotClassificationDendrogram(analysis)
````

"
  } else {
    ""
  }
}