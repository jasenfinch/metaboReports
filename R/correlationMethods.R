#' @importFrom metabolyseR correlationResults

correlationMethods <- function(analysis){
  if ({analysis %>% correlationResults() %>% length()} > 0) {
    "
### Correlations

```{r correlationTable,echo = F}
datatable(analysis %>%
          correlationResults() %>%
          mutate_if(is.numeric,round,digits = 3),
          rownames = F,filter = 'top',caption = 'Table of feature correlations')
```

"
  } else {
    ""
  }
}