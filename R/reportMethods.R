
reportMethods <- function(method) {
  methods <- list(
    Binalysis = binalysisMethods(),
    Analysis = analysisMethods()
  )
  method <- methods[method]
  return(method)
}