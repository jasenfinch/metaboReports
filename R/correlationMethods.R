#' @importFrom metabolyseR analysisResults

correlationMethods <- function(analysis,type = 'head'){
  
  headHash <- '##'
  
  if (type == 'sub') {
    headHash <- '###'
  }
  
  if ({analysis %>% analysisResults(element = 'correlations') %>% length()} > 0) {
    str_c("
",headHash," Correlations

```{r correlationTable,echo = F,cache = F}
cors <- analysis %>%
  analysisResults('correlations')
if (nrow(cors) > 10000) {
  cors <- cors %>%
    arrange(desc(r)) %>%
    .[1:10000,]
  caption <- 'Table of top 10000 feature correlations'
} else {
  caption <- 'Table of feature correlations'
}
datatable(cors %>%
          mutate_if(is.numeric,round,digits = 3),
          rownames = F,filter = 'top',caption = caption)
```

")
  } else {
    ""
  }
}