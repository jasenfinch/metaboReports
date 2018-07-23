
workflowMethods <- function(analysis){
  method <- list(
    FIE_HRMSfingerprinting = FIEfingerprintingMethods
  )
  method <- method[[analysis@workflowParameters@workflow]]
  return(method)
}