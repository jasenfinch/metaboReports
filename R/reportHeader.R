
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

```{r setup,echo=FALSE}
knitr::opts_chunk$set(cache = T,fig.align = "center",echo = F,cache.lazy = FALSE)
```

```{r libraryLoad,include=FALSE,cache = FALSE}
hrm::hrmAttach()
library(tidyverse)
library(patchwork)
library(ggthemes)
library(DT)
```

'
  )
  return(header)
}