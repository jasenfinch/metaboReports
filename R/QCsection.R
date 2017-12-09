
QCsection <- function(analysis,parameters){
  parameters <- parameters@QC
  
  section <- '
## Quality Control

```{r RSD,echo=FALSE}
suppressMessages(analysis %>%
  resultsAnalysis() %>%
  plotRSD()
  )
```

```{r PCA,echo=FALSE}
analysis %>%
  resultsAnalysis() %>%
  plotPCA()
```

```{r LDA,echo=FALSE}
analysis %>%
  resultsAnalysis() %>%
  plotLDA()
```
  '
  
  return(section)
}