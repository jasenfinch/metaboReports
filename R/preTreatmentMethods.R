#' @importFrom metabolyseR preTreatedInfo

preTreatmentMethods <- function(analysis){
  if ({analysis %>% preTreatedInfo() %>% nrow()} > 0) {
    "
### Pre-treatment

```{r RSDplot,echo = F}
if (T %in% str_detect(analysis@parameters@preTreat %>% names(),'QC')) {
    plotRSD(analysis)
}
```

```{r unsupervisedPlots,echo = F,fig.width = 10}
{plotPCA(analysis) %>% .@plot} + {plotUnsupervisedRF(analysis) %>% .@plot}
```

```{r supervisedPlots,echo = F,fig.width = 10}
classes <- analysis %>% preTreatedInfo() %>% .$class
if (1 %in% (classes %>% table())){
  plotSupervisedRF(analysis,label = NULL) %>% .@plot
} else {
  {plotLDA(analysis) %>% .@plot} + {plotSupervisedRF(analysis,label = NULL) %>% .@plot}
}
```
"
  } else {
    ""
  }

}