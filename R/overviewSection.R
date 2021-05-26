#' @importFrom stringr str_c
#' @importFrom purrr map

overViewSection <- function(analysis,type = 'head'){
  
  if (type == 'head') {
    overview <- '## Overview'
  }
  if (type == 'sub') {
    overview <- '### Overview'
  }
  
  if (class(analysis) == 'Workflow') {
    overview <- str_c(overview,
                      '
      
**Technique:** `metaboWorkflows` v',analysis@logs$packageVersion %>% as.character(),' workflow - ',analysis@workflowParameters@workflow,'

**Undertaken:** ',analysis@logs$initialisation,'

**Flags:** ',str_c(analysis@flags,collapse = ', '),'
'
    )
  }
  
  if (class(analysis) == 'Binalysis') {
    overview <- str_c(overview,
                      '
      
**Technique:** FIE-HRMS Spectral Binning

```{r binalysisOverview,echo = FALSE}
print(binalysis)
```
'
    )
  }
  
  if (class(analysis) == 'Analysis') {
    overview <- str_c(overview,
                      '
      
**Technique:** `metabolyseR` analysis

```{r analysisOverview,echo = FALSE}
print(analysis)
```
'
    )
  }
  
  if (class(analysis) == 'Assignment') {
    overview <- str_c(overview,
                      '
                      
**Technique:** `MFassign` assignment

```{r assignmentOverview,echo = FALSE}
print(assignment)
```
'
    )
  }
  
  return(overview)
}