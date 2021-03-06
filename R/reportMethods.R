
reportMethods <- function(method) {
  methods <- list(
    Binalysis = binalysisMethods,
    MetaboProfile = profileMethods,
    Analysis = analysisMethods,
    Workflow = workflowMethods,
    Assignment = assignmentMethods 
  )
  method <- methods[[method]]
  return(method)
}