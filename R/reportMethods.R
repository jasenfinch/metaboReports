
reportMethods <- function(method) {
  methods <- list(
    Binalysis = binalysisMethods,
    Analysis = analysisMethods,
    Workflow = workflowMethods,
    Assignment = assignmentMethods 
  )
  method <- methods[[method]]
  return(method)
}