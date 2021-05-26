
binalysisMethods <- function(analysis) {
  
  methods <- list(
    
    parameters = function(binalysis,type = 'head'){
      headHash <- '##'
      
      if (type == 'sub') {
        headHash <- '###'
      }
      
      str_c("
",headHash," Parameters

```{r binParamters,echo=FALSE}
binningParameters(binalysis)
```
")
    },
    
    results = function(binalysis,type = 'head'){
      headHash <- '##'
      
      if (type == 'sub') {
        headHash <- '###'
      }
      
      str_c("

",headHash," Results   

The plots and tables below give an overview of the results of the spectral binning approach applied to this data set.

")
    },
    
    featureTable = function(binalysis){
      "

```{r rawFeaturesTable,echo=FALSE}
library(knitr)
rawFeat <- binalysis %>%
  binnedData() %>%
  map(~{
    d <- .
    d %>%
      rowid_to_column(var = 'Sample') %>%
      gather('Feature','Intensity',-Sample)
    }) %>%
  bind_rows() %>%
  mutate(Mode = str_sub(Feature,1,1)) %>%
  group_by(Mode) %>%
  summarise(`Number of bins` = n_distinct(Feature),`Missing Data (%)` = round(length(which(Intensity == 0))/length(Intensity) * 100,2))

rawFeat$Mode[rawFeat$Mode == 'n'] = 'Negative'
rawFeat$Mode[rawFeat$Mode == 'p'] = 'Positive'

kable(rawFeat,caption = 'Table overview of spectral bins returned for each acqusition mode')
```

"
    },
    
    chromatograms = function(binalysis){
      "

```{r chromatograms,warning = FALSE,echo=FALSE}
binneR::plotChromatogram(binalysis)
```

"
    },
    
    fingerprint = function(binalysis){
      "

```{r fingerprint,warning = FALSE,echo=FALSE}
plotFingerprint(binalysis)
```

"
    },
    
    purityAndCentrality = function(binalysis){
      "

```{r PurityCentrality,echo=FALSE}
plotPurity(binalysis) + plotCentrality(binalysis)
```

"
    },
    
    ticPlot = function(binalysis){
      "

```{r TICplot,echo=FALSE}
binneR::plotTIC(binalysis, by = 'injOrder', colour = 'block')
```   

"
    },
    rsdPlot = function(binalysis){
      "
```{r RSDplot,echo=FALSE}
metaboMisc::plotRSD(binalysis) %>%
  walk(print)
```   

      "
    }
  )
  
  return(methods)
  
}