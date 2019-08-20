
erahMethods <- list(
  
  parameters = function(processed){
    '
    
### Parameters
    
#### Deconvolution
    
```{r deconvolutionParameters}
processed@processingParameters@processingParameters$deconvolution
```
    
#### Alignment
    
```{r alignmentParameters}
processed@processingParameters@processingParameters$alignment
```
    
#### Compound recovery
    
```{r compoundRecoveryParameters}
processed@processingParameters@processingParameters$compoundRecovery
```
    
#### Compound Identification
    
```{r identificationParameters}
processed@processingParameters@processingParameters$identification
```
    
'
  },
  
  results = function(processed){
    "
      
### Results   
      
The plots and tables below give an overview of the results of the eRah spectral deconvolution applied to this data set.
      
"
  },
  
  chromatograms = function(processed){
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
  mutate_if(is.numeric,round,digits = 5) %>%
  datatable(rownames = F,filter = 'top')
```    
" 
  }
)