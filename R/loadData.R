
loadData <- function(analysis){
  if (class(analysis) == 'Binalysis') {
    ld <- '

```{r loadData,echo=FALSE}
binalysis <- read_rds("reportData.rds")
```

'
  }
  if (class(analysis) == 'Analysis') {
    ld <- '

```{r loadData,echo=FALSE}
analysis <- read_rds("reportData.rds")
```

'
  }
  if (class(analysis) == 'MetaboProfile') {
    ld <- '

```{r loadData,echo=FALSE}
processed <- read_rds("reportData.rds")
```

'
  }
  if (class(analysis) == 'Workflow') {
    if (T %in% (c('peakPick','spectralBin') %in% analysis@flags)) {
      
      if ({analysis %>%
          resultsProcessing() %>%
          class()} == 'Binalysis') {
        pr <- '
binalysis <- workflowData %>%
                        resultsProcessing()' 
      }
      
      if ({analysis %>%
          resultsProcessing() %>%
          class()} == 'MetaboProfile') {
        pr <- '
processed <- workflowData %>%
                        resultsProcessing()' 
      } 
    } else {
      pr <- ''
    }
    
    
    if ('preTreat' %in% analysis@flags) {
      ar <- '
analysis <- workflowData %>%
                        resultsAnalysis()'
    } else {
      ar <- ''
    }
    
    
    if ('annotation' %in% analysis@flags) {
      anr <- '
assignment <- workflowData %>%
      resultsAnnotation()'
    } else {
      anr <- ''
    }
    
    
    
    ld <- str_c('

```{r loadData,echo=FALSE}
workflowData <- read_rds("reportData.rds")',
                pr,ar,anr,
                '
```
    
')
  }
  if (class(analysis) == 'Assignment') {
    ld <- '

```{r loadData,echo=FALSE}
assignment <- read_rds("reportData.rds")
```

'
  }
  return(ld)
}