#' @importFrom metabolyseR preTreatedInfo

preTreatmentMethods <- function(analysis){
  if ({analysis %>% preTreatedInfo() %>% nrow()} > 0) {
    "
### Pre-treatment

```{r TICplot,echo = F}
plotTIC(analysis)
````

```{r RSDplot,echo = F}
plotRSD(analysis)
````

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