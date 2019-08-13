#' @importFrom metaboWorkflows resultsProcessing resultsAnalysis resultsAnnotation

FIEfingerprintingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    spectralBin = list(
      '
## Spectral Binning
      
',
      overViewSection(analysis %>% resultsProcessing(),type = 'sub'),
      binalysisMethods()
    ),
    preTreat = list(
      '
## Analysis
      
',
      overViewSection(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$parameters,
      analysisMethods()$preTreatment,
      "
```{r ptPurityCentrality,echo=FALSE}
histBins <- 30

preTreatedFeatures <- analysis %>%
  preTreatedData() %>%
  colnames()

purCent <- binalysis %>%
  accurateData() %>%
  mutate(Feature = str_c(Mode,mz)) %>%
  dplyr::select(Mode,Feature,Purity,Centrality) %>%
  gather('Measure','Value',-Mode,-Feature) %>%
  mutate(Mode = as.character(Mode)) %>%
  na.omit() %>%
  filter(Feature %in% preTreatedFeatures)
  
    
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
    ),
    modelling = analysisMethods()$modelling,
    correlations = analysisMethods()$correlations,
    MFassignment = list(
      '
## Annotation
      
',
      overViewSection(analysis %>% resultsAnnotation(),type = 'sub'),
      assignmentMethods()$parameters,
      assignmentMethods()$assignments,
      assignmentMethods()$network
    )
  )
  methods <- methods[names(methods) %in% flags]
  return(methods)
}