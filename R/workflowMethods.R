
workflowMethods <- function(analysis){
  method <- list(
    FIE_HRMSfingerprinting = FIEfingerprintingMethods,
    FIE_HRMSfingerprinting2 = FIEfingerprintingMethods,
    NP_LC_HRMSprofiling = profilingMethods(),
    RP_LC_HRMSprofiling = profilingMethods()
  )
  method <- method[[analysis@workflowParameters@workflow]]
  return(method)
}