#' @importFrom stringr str_c
#' @importFrom binneRlyse info
#' @importFrom metabolyseR rawData
#' @importFrom purrr map

overViewSection <- function(analysis){
  
  overview <- '## Overview'
  
  if (class(analysis) == 'Workflow') {
    overview <- str_c(overview,
'
      
**Technique:** Workflow - ',analysis@logs,'

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
      
**Technique:** metabolyseR analysis

**Date undertaken:** ',analysis@log$analysis,'

**Analysis elements:** ',str_c(names(analysis@log)[-1],collapse = ', '),'

**Number of raw samples**: ',rawData(analysis)$Info %>% nrow(),'

```{r loadData,echo=FALSE}
analysis <- read_rds("reportData.rds")
```

'
    )
  }
  return(overview)
}