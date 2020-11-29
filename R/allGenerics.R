
#' @rdname report

setGeneric("report", function(analysis,parameters) {
  standardGeneric("report")
})

#' @rdname reportData

setGeneric("reportData", function(x) {
  standardGeneric("reportData")
})

#' @rdname reportData

setGeneric("reportData<-", function(x,value) {
  standardGeneric("reportData<-")
})

setGeneric('generate', function(x){
  standardGeneric('generate')
})

setGeneric('parameters', function(x){
  standardGeneric('parameters')
})

setGeneric('results', function(x){
  standardGeneric('results')
})

setGeneric('featureTable', function(x){
  standardGeneric('featureTable')
})

setGeneric('chromatograms', function(x){
  standardGeneric('chromatograms')
})

setGeneric('fingerprints', function(x){
  standardGeneric('fingerprints')
})

setGeneric('purityAndCentrality', function(x){
  standardGeneric('purityAndCentrality')
})

setGeneric('ticPlot', function(x){
  standardGeneric('ticPlot')
})

setGeneric('rsdPlot', function(x){
  standardGeneric('rsdPlot')
})


