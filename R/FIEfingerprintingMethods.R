#' @importFrom metaboWorkflows resultsProcessing resultsAnalysis resultsAnnotation

FIEfingerprintingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    spectralBin = list(
      '
## Spectral Binning
      
',
      overViewSection(analysis %>% resultsProcessing(),type = 'sub'),
      binalysisMethods()$parameters(analysis %>% resultsProcessing(),type = 'sub'),
      binalysisMethods()$results(analysis %>% resultsProcessing(),type = 'sub'),
      binalysisMethods()$featureTable(analysis %>% resultsProcessing()),
      binalysisMethods()$chromatograms(analysis %>% resultsProcessing()),
      binalysisMethods()$fingerprint(analysis %>% resultsProcessing()),
      binalysisMethods()$purityAndCentrality(analysis %>% resultsProcessing()),
      binalysisMethods()$ticPlot(analysis %>% resultsProcessing()),
      binalysisMethods()$rsdPlot(analysis %>% resultsProcessing())
    ),
    preTreat = list(
      '
## Analysis
      
',
      overViewSection(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$parameters(analysis %>% resultsAnalysis(),type = 'sub'),
      analysisMethods()$preTreatment(analysis %>% resultsAnalysis(),type = 'sub',chunks = c('lda','supervisedRF')),
      "
      
```{r ptPurityCentrality,echo=FALSE}
histBins <- 30

preTreatedFeatures <- analysis %>%
  preTreatedData() %>%
  colnames()

purCent <- binalysis %>%
  accurateData() %>%
  mutate(Feature = str_c(polarity,mz)) %>%
  dplyr::select(polarity,Feature,purity,centrality) %>%
  gather('Measure','Value',-polarity,-Feature) %>%
  mutate(polarity = as.character(polarity)) %>%
  na.omit() %>%
  filter(Feature %in% preTreatedFeatures)
  
    
purCent$polarity[purCent$polarity == 'n'] <- 'Negative'
purCent$polarity[purCent$polarity == 'p'] <- 'Positive'
    
purPlot <- purCent %>%
  filter(Measure == 'purity') %>%
  ggplot(aes(x = Value)) +
  geom_histogram(fill = ptol_pal()(5)[2],colour = 'black',bins = histBins) +
  theme_bw() +
  facet_wrap(~polarity) +
  ggtitle('Bin Purity Distribution') +
  theme(plot.title = element_text(face = 'bold'),
        axis.title = element_text(face = 'bold')) +
  xlab('Purity Measure') +
  ylab('Frequency')
    
centPlot <- purCent %>%
filter(Measure == 'centrality') %>%
ggplot(aes(x = Value)) +
  geom_histogram(fill = ptol_pal()(5)[2],colour = 'black',bins = histBins) +
  theme_bw() +
  facet_wrap(~polarity) +
  ggtitle('Bin Centrality Distribution') +
  theme(plot.title = element_text(face = 'bold'),
        axis.title = element_text(face = 'bold')) +
  xlab('Centrality Measure') +
  ylab('Frequency')
    
purPlot + centPlot + plot_layout(ncol = 1)
```

"
    ),
    modelling = analysisMethods()$modelling(analysis %>% resultsAnalysis(),type = 'sub'),
    correlations = analysisMethods()$correlations(analysis %>% resultsAnalysis(),type = 'sub'),
    MFassignment = list(
      '
## Annotation
      
',
      overViewSection(analysis %>% resultsAnnotation(),type = 'sub'),
      assignmentMethods()$parameters(analysis %>% resultsAnnotation(),type = 'sub'),
      assignmentMethods()$assignments(analysis %>% resultsAnnotation(),type = 'sub')
    )
  )
  methods <- methods[names(methods) %in% flags]
  return(methods)
}