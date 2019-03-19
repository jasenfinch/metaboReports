#' @importFrom metabolyseR correlationResults

correlationMethods <- function(analysis){
  if ({analysis %>% correlationResults() %>% length()} > 0) {
    "
### Correlations

```{r correlationTable,echo = F}
cors <- analysis %>%
  correlationResults()
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

"
  } else {
    ""
  }
}