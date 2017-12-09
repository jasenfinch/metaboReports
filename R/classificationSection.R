
classificationSection <- function(analysis,parameters){
 section <- '
## Classification

```{r classificationPlot,echo=FALSE}
analysis %>%
  resultsAnalysis() %>%
  plotClassification()
```
 ' 
 return(section)
}