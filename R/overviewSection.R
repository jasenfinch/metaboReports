#' @importFrom stringr str_c
#' @importFrom binneRlyse info

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

**Date undertaken:** ',analysis@binLog,'

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

'
    )
  }
  return(overview)
}