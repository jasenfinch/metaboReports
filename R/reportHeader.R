
reportHeader <- function(analysis,parameters){
  
  title <- parameters@title
  investigator <- parameters@investigator
  output <- parameters@output
  date <- parameters@date
  
  header <- str_c(
'---
title: "',title,'"
output: "',output,'"
author: "',investigator,'"
date: "',date,'"
---

```{r libraryLoad,include=FALSE}
library(tidyverse)
hrm::hrmAttach()
```

'
  )
  return(header)
}