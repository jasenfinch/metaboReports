#' @importFrom metabolyseR featureSelectionResults

featureSelectionMethods <- function(analysis){
  if ({analysis %>% featureSelectionResults() %>% length()} > 0) {
    "
### Feature selection

```{r explanatoryFeatureOverview}
threshold <- 0.01

analysis %>%
  featureSelectionResults() %>%
  filter(Pvalue < threshold) %>%
  group_by(Type,Method,Pairwise) %>%
  summarise(`# Explanatory` = n()) %>%
  datatable(rownames = F,filter = 'top',caption = str_c('Overview of numbers of explanatory features (p < ',threshold,')'))
```

```{r explanatoryFeatures}
analysis %>%
  featureSelectionResults() %>%
  filter(Pvalue < threshold) %>%
  mutate_if(is.numeric,round,digits = 3) %>%
  datatable(rownames = F,filter = 'top',caption = str_c('Table of explanatory features (p < ',threshold,')'))
```

```{r explanatoryHeatMap,fig.height = 10}
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

  explan <- feat %>%
    filter(Pvalue < 0.01 & Method == method) %>%
    .$Feature %>%
    unique()

  if (length(explan) > 100){
    featNames <- F
  } else {
    featNames <- T
  }

  plotExplanatoryHeatmap(analysis,method = method,featureNames = featNames)   
}
```

"
  } else {
    ""
  }
}