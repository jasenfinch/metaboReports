
binalysisMethods <- function(analysis) {
  
  methods <- list(
    
    parameters = function(binalysis){
      "
### Parameters

```{r binParamters,echo=FALSE}
binalysis@binParameters
```
"
    },
    
    results = function(binalysis){
      "

### Results   

The plots and tables below give an overview of the results of the spectral binning approach applied to this data set.

"
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
    
    chromatogams = function(binalysis){
      "

```{r chromatograms,warning = FALSE,echo=FALSE}
plotChromatogram(binalysis)
```

"
    },
    
    purityAndCentrality = function(binalysis){
      "

```{r PurityCentrality,echo=FALSE}
histBins <- 30
    
purCent <- binalysis %>%
  accurateData() %>%
  dplyr::select(Mode,Purity,Centrality) %>%
  gather('Measure','Value',-Mode) %>%
  mutate(Mode = as.character(Mode)) %>%
  na.omit()
    
purCent$Mode[purCent$Mode == 'n'] <- 'Negative'
purCent$Mode[purCent$Mode == 'p'] <- 'Positive'
    
purPlot <- purCent %>%
  filter(Measure == 'Purity') %>%
  ggplot(aes(x = Value)) +
  geom_histogram(fill = ptol_pal()(5)[2],colour = 'black',bins = histBins) +
  theme_bw() +
  facet_wrap(~Mode) +
  ggtitle('Bin Purity Distribution') +
  theme(plot.title = element_text(face = 'bold'),
        axis.title = element_text(face = 'bold')) +
  xlab('Purity Measure') +
  ylab('Frequency')
    
centPlot <- purCent %>%
filter(Measure == 'Centrality') %>%
ggplot(aes(x = Value)) +
  geom_histogram(fill = ptol_pal()(5)[2],colour = 'black',bins = histBins) +
  theme_bw() +
  facet_wrap(~Mode) +
  ggtitle('Bin Centrality Distribution') +
  theme(plot.title = element_text(face = 'bold'),
        axis.title = element_text(face = 'bold')) +
  xlab('Centrality Measure') +
  ylab('Frequency')
    
purPlot + centPlot + plot_layout(ncol = 1)
```

"
    },
    
    ticPlot = function(binalysis){
      "

```{r TICplot,echo=FALSE}
binneR::plotTIC(binalysis, by = 'injOrder', colour = 'block')
```   

"
    }
  )
  
  return(methods)
  
}