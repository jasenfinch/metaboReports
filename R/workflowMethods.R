
workflowMethods <- function(analysis){
  method <- list(
    FIE_HRMSfingerprinting = FIEfingerprintingMethods,
    NP_LC_HRMSprofiling = profilingMethods,
    RP_LC_HRMSprofiling = profilingMethods
  )
  method <- method[[analysis@workflowParameters@workflow]]
  return(method)
}