#' @importFrom metabolyseR modellingResults

modellingMethods <- function(analysis,type = 'head'){
  
  headHash <- '##'
  
  if (type == 'sub') {
    headHash <- '###'
  }
  
  if ({analysis %>% modellingResults() %>% length()} > 0) {
    str_c("
",headHash," Modelling

```{r modellingOverview, cache = FALSE,results = 'asis'}
modellingRes <- analysis %>%
  modellingResults()

if (names(modellingRes)[1] == 'randomForest') {
modellingRes %>%
  .[[1]] %>%
  map(measures) %>%
  bind_rows() %>%
  mutate_if(is.numeric,round,digits = 3) %>%
  datatable(rownames = F,filter = 'top',caption = 'Table of model measures')
}
```

```{r explanatoryFeatureOverview,cache = FALSE}
threshold <- 0.05

explanFeat <- modellingRes %>%
  .[[1]] %>%
  map(explanatoryFeatures,threshold = threshold) %>%
  bind_rows()

explanFeat %>%
  group_by(Predictor,Comparison) %>%
  summarise(`# Explanatory` = n()) %>%
  datatable(rownames = F,filter = 'top',caption = str_c('Overview of numbers of explanatory features (p < ',threshold,')'))
```

```{r explanatoryFeatures,cache = FALSE}
ef <- explanFeat %>%
  tbl_df() %>%
  mutate_if(is.numeric,round,digits = 3) %>%
  arrange(adjustedPvalue)
  
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
if (nrow(ef) > 0) {
  if (length(unique(ef$Feature)) > 150) {
  featNames <- F
  } else {
  featNames <- T
  }
  
  plotExplanatoryHeatmap(modellingRes[[1]][[1]],featureNames = featNames)
}
```
")
  } else {
    ""
  }
}