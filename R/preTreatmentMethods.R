#' @importFrom metabolyseR preTreatedInfo

preTreatmentMethods <- function(analysis){
  if ({analysis %>% preTreatedInfo() %>% nrow()} > 0) {
    "
### Pre-treatment

```{r unsupervisedPlots,echo = F}
{plotPCA(analysis) %>% .@plot} + {plotUnsupervisedRF(analysis) %>% .@plot}
````

```{r supervisedPlots,echo = F}
{plotLDA(analysis) %>% .@plot} + {plotSupervisedRF(analysis) %>% .@plot}
````
"
  } else {
    ""
  }

}