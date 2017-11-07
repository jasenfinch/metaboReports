
reportHeader <- function(analysis,parameters){
  
  path <- parameters@path
  title <- parameters@title
  date <- parameters@date
  
  header <- str_c(
'---
title: "',title,'"
output: html_document
date: "',date,'"
---

```{r libraryLoad,include=FALSE}
hrm::hrmAttach()
library(tidyverse)
```

```{r loadData,echo=FALSE}
load("reportData.RData")
```

'
  )
  return(header)
}