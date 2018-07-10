#' @importFrom metabolyseR featureSelectionResults

featureSelectionMethods <- function(analysis){
  if ({analysis %>% featureSelectionResults() %>% nrow()} > 0) {
    "
### Feature selection

"
  } else {
    ""
  }
}