#' @importFrom metabolyseR modellingResults

modellingMethods <- function(analysis){
  if ({analysis %>% modellingResults() %>% length()} > 0) {
    "
### Modelling

```{r modellingOverview, cache = FALSE,results = 'asis'}
modellingRes <- analysis %>%
  modellingResults() %>%
  .[[1]] 
  
modellingRes %>%
  map(measures) %>%
  bind_rows() %>%
  mutate_if(is.numeric,round,digits = 3) %>%
  datatable(rownames = F,filter = 'top',caption = 'Table of model measures')
```

```{r explanatoryFeatureOverview,cache = FALSE}

```

```{r explanatoryFeatures,cache = FALSE}

```

```{r explanatoryHeatMap,fig.height = 10}

```
"
  } else {
    ""
  }
}