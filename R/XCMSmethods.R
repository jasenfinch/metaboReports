
XCMSmethods <- list(
  
  parameters = function(processed){
    "

### Parameters
      
#### Peak Detection

```{r peakDetectionParamters,echo=FALSE}
processed@processingParameters@processingParameters$peakDetection
```

#### Retention Time Correction

```{r retentionTimeCorrectionParamters,echo=FALSE}
processed@processingParameters@processingParameters$retentionTimeCorrection
```

#### Grouping

```{r groupingParamters,echo=FALSE}
processed@processingParameters@processingParameters$grouping
```

#### Infilling

```{r infillingParamters,echo=FALSE}
processed@processingParameters@processingParameters$infilling
```

"
  },
  
  results = function(processed){
    "
      
### Results   
      
The plots and tables below give an overview of the results of the XCMS spectral processing applied to this data set.
      
"
  },
  
  chromatogams = function(processed){
"

```{r chromatograms,echo=FALSE}
processed %>%
  profilePro::plotChromatogram(cls = 'class',group = T)
```

"
  },
  
  ticPlot = function(processed){
"
```{r ticPlots,echo=FALSE}
processed %>%
  profilePro::plotTIC()
```
"
  },

  featureTable = function(processed){
"

```{r featureTable,echo=FALSE}
processed %>%
  peakInfo() %>%
  bind_rows(.id = 'Mode') %>%
  mutate_if(is.numeric,round,digits = 5) %>%
  datatable(rownames = F,filter = 'top')
```    
" 
  }
)
