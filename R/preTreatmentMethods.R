#' @importFrom metabolyseR preTreatedInfo

preTreatmentMethods <- function(analysis){
  if ({analysis %>% preTreatedInfo() %>% nrow()} > 0) {
    "
### Pre-treatment

```{r RSDplot,echo = F}
plotRSD(analysis)
````

```{r unsupervisedPlots,echo = F,fig.width = 10}
{plotPCA(analysis) %>% .@plot} + {plotUnsupervisedRF(analysis) %>% .@plot}
````

```{r supervisedPlots,echo = F,fig.width = 10}
{plotLDA(analysis) %>% .@plot} + {plotSupervisedRF(analysis) %>% .@plot}
````
"
  } else {
    ""
  }

}