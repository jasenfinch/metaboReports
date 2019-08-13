#' @importFrom metabolyseR preTreatedInfo

preTreatmentMethods <- function(analysis,type = 'head'){
  headHash <- '##'
  
  if (type == 'sub') {
    headHash <- '###'
  }
  
  if ({analysis %>% preTreatedInfo() %>% nrow()} > 0) {
    str_c("
",headHash," Pre-treatment

```{r RSDplot,echo = F}
if (T %in% str_detect(analysis@parameters@preTreat %>% names(),'QC')) {
    plotRSD(analysis)
}
```

```{r ellipses}
classes <- analysis %>% preTreatedInfo() %>% .$class
if (length(unique(classes)) > 10){
  ellipses <- FALSE
} else {
  ellipses <- TRUE
}
```

```{r unsupervisedPlots,echo = F,fig.width = 10}
metabolyseR::plotPCA(analysis,ellipses = ellipses) + plotUnsupervisedRF(analysis,ellipses = ellipses,title = 'Multidimensional scaling (MDS) -\nunsupervised Random Forest')
```

```{r LDAplot,echo = F,fig.width = 10}
if (length(unique(classes)) > 1) {
  if (!(1 %in% (classes %>% table()))){
    plotLDA(analysis,ellipses = ellipses)
  } 
}
```

```{r supervisedRFplots,echo = F,fig.width = 10}
classes <- analysis %>% preTreatedInfo() %>% .$class
if (length(unique(classes)) > 1) {
  plotSupervisedRF(analysis,label = NULL,ellipses = ellipses,title = 'Multidimensional scaling (MDS) -\nsupervised Random Forest')
}
```
")
  } else {
    ""
  }

}