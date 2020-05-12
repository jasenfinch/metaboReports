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

if (is.list(modellingRes %>% .[[1]])) {
  explanFeat <- modellingRes %>%
    .[[1]] %>%
    map(explanatoryFeatures,threshold = threshold) %>%
    bind_rows() 
} else {
  explanFeat <- modellingRes %>%
    .[[1]] %>%
    explanatoryFeatures(threshold = threshold)
}

explanFeat %>%
  group_by(Response,Comparison) %>%
  summarise(`# Explanatory` = n()) %>%
  datatable(rownames = F,filter = 'top',caption = str_c('Overview of numbers of explanatory features (p < ',threshold,')'))
```

```{r explanatoryFeatures,cache = FALSE}
ef <- explanFeat %>%
  tbl_df() %>%
  mutate_if(is.numeric,round,digits = 3)

names(ef)[names(ef) == 'adjusted.p.value'] <- 'adjustedPvalue' 

if ('adjustedPvalue' %in% names(ef)) {
 ef <- ef  %>%
    arrange(adjustedPvalue) 
} else {
  ef <- ef %>%
    arrange(Value)
}

if (nrow(ef) > 10000) {
  ef %>%
    .[1:10000,] %>%
    datatable(rownames = F,filter = 'top',caption = str_c('Table of top 10000 explanatory features (p < ',threshold,')'))
} else {
  ef %>%
    datatable(rownames = F,filter = 'top',caption = str_c('Table of explanatory features (p < ',threshold,')'))
}
```

```{r explanatoryHeatMap,fig.height = 10}
if (nrow(ef) > 2) {
  if (length(unique(ef$Feature)) > 150) {
    featNames <- F
  } else {
    featNames <- T
  }
  
  if (is.list(modellingRes[[1]])) {
    mod <- modellingRes[[1]][[1]]
  } else {
    mod <- modellingRes[[1]] 
  }
  
  plotExplanatoryHeatmap(mod,featureNames = featNames)
}
```
")
  } else {
    ""
  }
}