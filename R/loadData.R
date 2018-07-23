
loadData <- function(analysis){
  if (class(analysis) == 'Binalysis') {
    '

```{r loadData,echo=FALSE}
binalysis <- read_rds("reportData.rds")
```

'
  }
  if (class(analysis) == 'Analysis') {
    '

```{r loadData,echo=FALSE}
analysis <- read_rds("reportData.rds")
```

'
  }
  if (class(analysis) == 'Workflow') {
    str_c('

```{r loadData,echo=FALSE}
workflowData <- read_rds("reportData.rds")',
    if ('spectralBin' %in% analysis@flags) {
      '
binalysis <- workflowData %>%
                        resultsProcessing()'
    },
    if ('preTreat' %in% analysis@flags) {
      '
analysis <- workflowData %>%
                        resultsAnalysis()'
    },
    '
```
    
')
  }
}