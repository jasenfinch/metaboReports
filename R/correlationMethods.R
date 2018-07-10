#' @importFrom metabolyseR correlationResults

correlationMethods <- function(analysis){
  if ({analysis %>% correlationResults() %>% nrow()} > 0) {
    "
### Feature selection

"
  } else {
    ""
  }
}