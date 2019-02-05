

profileMethods <- function(processed) {
  
  technique <- processed@processingParameters@technique
  
  methods <- list(
    `LCMS-NP` = XCMSmethods,
    `LCMS-RP` = XCMSmethods,
    `GCMS-XCMS` = XCMSmethods
  )
  
  method <- methods[[technique]]
  
  return(method)
  
}