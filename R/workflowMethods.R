#' @importFrom stringr str_detect

workflowMethods <- function(analysis){
  m <- analysis@workflowParameters@workflow
  if (str_detect(m,'FIEfingerprinting')) {
    FIEfingerprintingMethods(analysis@flags)
  }
}