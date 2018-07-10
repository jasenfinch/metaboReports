#' @importFrom metabolyseR classificationResults

classificationMethods <- function(analysis){
  if ({analysis %>% classificationResults() %>% nrow()} > 0) {
    "
### Classification

"
  } else {
    ""
  }
}