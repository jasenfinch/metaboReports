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
{plotPCA(analysis) %>% .@plot %>% .[[1]]} + {plotUnsupervisedRF(analysis) %>% .@plot %>% .[[1]]}
```

```{r LDAplot,echo = F,fig.width = 10}
classes <- analysis %>% preTreatedInfo() %>% .$class
if (length(unique(classes)) > 1) {
  if (!(1 %in% (classes %>% table()))){
    plotLDA(analysis) %>% .@plot %>% .[[1]]
  } 
}
```

```{r supervisedRFplots,echo = F,fig.width = 10}
classes <- analysis %>% preTreatedInfo() %>% .$class
if (length(unique(classes)) > 1) {
  plotSupervisedRF(analysis,label = NULL) %>% .@plot %>% .[[1]]
}
```
"
  } else {
    ""
  }

}