#' @importFrom metabolyseR classificationResults

classificationMethods <- function(analysis){
  if ({analysis %>% classificationResults() %>% length()} > 0) {
    "
### Classification

```{r classificationOverview}
pairwises <- analysis %>%
  classificationResults() %>%
  .$Pairwise %>%
  unique()

if (length(pairwises) < 10) {
  plotClassification(analysis)
} else {
  analysis %>%
    classificationResults() %>%
    group_by(Pairwise,Method,Measure) %>%
    summarise(Value = mean(Value)) %>%
    spread(Measure,Value) %>%
    tbl_df() %>%
    mutate_if(is.numeric,round,digits = 3) %>%
    datatable(rownames = F,filter = 'top',caption = 'Overview of classification results')
}

```

```{r classificationDendrogram}
plotClassificationDendrogram(analysis)
```

"
  } else {
    ""
  }
}