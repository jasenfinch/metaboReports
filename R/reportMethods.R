
reportMethods <- function(method) {
  methods <- list(
    Binalysis = binalysisMethods,
    MetaboProfile = profileMethods,
    Analysis = analysisMethods,
    Assignment = assignmentMethods 
  )
  method <- methods[[method]]
  return(method)
}