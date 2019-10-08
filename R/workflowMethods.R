
workflowMethods <- function(analysis){
  method <- list(
    `FIE-HRMS fingerprinting` = FIEfingerprintingMethods,
    `NSI-HRMS fingerprinting` = FIEfingerprintingMethods,
    `NP-LC-HRMS profiling` = profilingMethods,
    `RP-LC-HRMS profiling` = profilingMethods,
    `GC-MS profiling deconvolution` = profilingMethods
  )
  method <- method[[analysis@workflowParameters@workflow]]
  return(method)
}