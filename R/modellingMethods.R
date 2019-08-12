#' @importFrom metabolyseR modellingResults

modellingMethods <- function(analysis){
  if ({analysis %>% modellingResults() %>% length()} > 0) {
    "
### Modelling

```{r modellingOverview, cache = FALSE}
modellingRes <- analysis %>%
  modellingResults()
```

```{r explanatoryFeatureOverview,cache = FALSE}
threshold <- 0.05

analysis %>%
  featureSelectionResults() %>%
  filter(Pvalue < threshold) %>%
  group_by(Type,Method,Pairwise) %>%
  summarise(`# Explanatory` = n()) %>%
  datatable(rownames = F,filter = 'top',caption = str_c('Overview of numbers of explanatory features (p < ',threshold,')'))
```

```{r explanatoryFeatures,cache = FALSE}
ef <- analysis %>%
  featureSelectionResults() %>%
  filter(Pvalue < threshold) %>%
  mutate_if(is.numeric,round,digits = 3) %>%
  arrange(Pvalue)

if (nrow(ef) > 10000){
  ef %>%
    .[1:10000,] %>%
    datatable(rownames = F,filter = 'top',caption = str_c('Table of top 10000 explanatory features (p < ',threshold,')'))
} else {
  ef %>%
    datatable(rownames = F,filter = 'top',caption = str_c('Table of explanatory features (p < ',threshold,')'))
}
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