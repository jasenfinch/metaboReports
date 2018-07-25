
workflowMethods <- function(analysis){
  method <- list(
    FIE_HRMSfingerprinting = FIEfingerprintingMethods,
    FIE_HRMSfingerprinting2 = FIEfingerprintingMethods
  )
  method <- method[[analysis@workflowParameters@workflow]]
  return(method)
}