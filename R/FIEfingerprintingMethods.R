
FIEfingerprintingMethods <- function(analysis){
  flags <- analysis@flags
  methods <- list(
    spectralBin = binalysisMethods(),
    preTreat = analysisMethods()$preTreatment
    
  )
  methods <- methods[[names(methods %in% flags)]]
  return(methods)
}