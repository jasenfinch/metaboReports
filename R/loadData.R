
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
    ld <- str_c('

```{r loadData,echo=FALSE}
workflowData <- read_rds("reportData.rds")',
    if (T %in% (c('peakPick','spectralBin') %in% analysis@flags)) {
      if (analysis %>%
          resultsProcessing() %>%
          class() == 'Binalysis') {
        '
binalysis <- workflowData %>%
                        resultsProcessing()' 
      }
      if (analysis %>%
          resultsProcessing() %>%
          class() == 'MetaboProfile') {
        '
processed <- workflowData %>%
                        resultsProcessing()' 
      }
    },
    if ('preTreat' %in% analysis@flags) {
      '
analysis <- workflowData %>%
                        resultsAnalysis()'
    },
    if ('annotation' %in% analysis@flags) {
      '
assignment <- workflowData %>%
      resultsAnnotation()'
    },
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