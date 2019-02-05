

profileMethods <- function(analysis) {
  
  methods <- list(
    
    parameters = function(processed){
      "
      ### Parameters
      
      ```{r binParamters,echo=FALSE}
      binalysis@binParameters
      ```
      "
    },
    
    results = function(processed){
      "
      
      ### Results   
      
      The plots and tables below give an overview of the results of the spectral binning approach applied to this data set.
      
      "
    },
    
    chromatogams = function(processed){
      "
      
      ```{r chromatograms,warning = FALSE,echo=FALSE}
      plotChromatogram(binalysis)
      ```
      
      "
    },
    
    ticPlot = function(processed){
      "

```{r TICplot,echo=FALSE}
binneR::plotTIC(binalysis, by = 'injOrder', colour = 'block')
```   

"
    },
    featureTable = function(processed){
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
  )
  
  return(methods)
  
    }