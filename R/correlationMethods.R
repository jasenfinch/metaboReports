#' @importFrom metabolyseR correlationResults

correlationMethods <- function(analysis){
  if ({analysis %>% correlationResults() %>% nrow()} > 0) {
    "
### Correlations

```{r correlationHist,echo = F}
library(ggthemes)
analysis %>%
  correlationResults() %>%
  {
    ggplot(.,aes(x = r)) +
      geom_histogram(fill = ptol_pal()(5)[2],colour = 'black',bins = 30) +
      theme_bw() +
      theme(plot.title = element_text(face = 'bold'),
        axis.title = element_text(face = 'bold')) +
      ggtitle('Histogram of correlation coefficients')
  }
````

"
  } else {
    ""
  }
}