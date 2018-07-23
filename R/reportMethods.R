
reportMethods <- function(method) {
  methods <- list(
    Binalysis = binalysisMethods,
    Analysis = analysisMethods,
    Workflow = workflowMethods
  )
  method <- methods[[method]]
  return(method)
}