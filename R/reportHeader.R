
reportHeader <- function(analysis,parameters){
  
  title <- parameters@title
  output <- parameters@output
  date <- parameters@date
  
  header <- str_c(
'---
title: "',title,'"
output: "',output,'"
date: "',date,'"
---

```{r libraryLoad,include=FALSE}
hrm::hrmAttach()
library(tidyverse)
```

```{r loadData,echo=FALSE}
analysis <- read_rds("reportData.rds")
```

'
  )
  return(header)
}