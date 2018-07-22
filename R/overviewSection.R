#' @importFrom stringr str_c
#' @importFrom binneR info
#' @importFrom metabolyseR rawInfo
#' @importFrom purrr map

overViewSection <- function(analysis){
  
  overview <- '## Overview'
  
  if (class(analysis) == 'Workflow') {
    overview <- str_c(overview,
                      '
      
**Technique:** `metaboWorkflows`` v',analysis@logs$packageVersion %>% as.character(),' workflow - ',analysis@workflowParameters@workflow,'

**Undertaken:** ',analysis@logs$initialisation,'

**Flags:** ',str_c(analysis@flags,collapse = ', '),'

```{r loadData,echo=FALSE}
workflowData <- read_rds("reportData.rds")
```

'
    )
  }
  
  if (class(analysis) == 'Binalysis') {
    overview <- str_c(overview,
                      '
      
**Technique:** FIE-HRMS Spectral Binning

**Undertaken:** ',analysis@binLog,'

**Number of samples:** ',nrow(info(analysis)),'

```{r loadData,echo=FALSE}
binalysis <- read_rds("reportData.rds")
```

'
    )
  }
  
  if (class(analysis) == 'Analysis') {
    overview <- str_c(overview,
                      '
      
**Technique:** `metabolyseR` analysis

**Processed:** ',analysis@log$analysis,'

**Analysis elements:** ',str_c(names(analysis@log)[-(1:3)],collapse = ', '),'

**Number of raw samples**: ',rawInfo(analysis) %>% nrow(),'

```{r loadData,echo=FALSE}
analysis <- read_rds("reportData.rds")
```

'
    )
  }
  return(overview)
}