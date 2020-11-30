#' @rdname parameters

setGeneric('title', function(x){
  standardGeneric('title')
})

#' @rdname parameters

setGeneric('title<-', function(x,value){
  standardGeneric('title<-')
})

#' @rdname parameters

setGeneric('investigator', function(x){
  standardGeneric('investigator')
})

#' @rdname parameters

setGeneric('investigator<-', function(x,value){
  standardGeneric('investigator<-')
})

#' @rdname parameters

setGeneric("sessionInformation", function(x){
  standardGeneric("sessionInformation")
})

#' @rdname parameters

setGeneric("sessionInformation<-", function(x,value) {
  standardGeneric("sessionInformation<-")
})

#' @rdname parameters

setGeneric('toc', function(x){
  standardGeneric('toc')
})

#' @rdname parameters

setGeneric('toc<-', function(x,value){
  standardGeneric('toc<-')
})

#' @rdname parameters

setGeneric('echo', function(x){
  standardGeneric('echo')
})

#' @rdname parameters

setGeneric('echo<-', function(x,value){
  standardGeneric('echo<-')
})

#' @rdname parameters

setGeneric('cache', function(x){
  standardGeneric('cache')
})

#' @rdname parameters

setGeneric('cache<-', function(x,value){
  standardGeneric('cache<-')
})

#' @rdname parameters

setGeneric('time', function(x){
  standardGeneric('time')
})

#' @rdname parameters

setGeneric('time<-', function(...){
  standardGeneric('time<-')
})

#' @rdname parameters

setGeneric('output', function(x){
  standardGeneric('output')
})

#' @rdname parameters

setGeneric('output<-', function(x,value){
  standardGeneric('output<-')
})

#' @rdname report

setGeneric("report", function(x) {
  standardGeneric("report")
})

#' @rdname report

setGeneric("report<-", function(x,value) {
  standardGeneric("report<-")
})

#' @rdname reportData

setGeneric("reportData", function(x) {
  standardGeneric("reportData")
})

#' @rdname reportData

setGeneric("reportData<-", function(x,value) {
  standardGeneric("reportData<-")
})

#' @rdname reportRMD

setGeneric("reportRMD", function(x) {
  standardGeneric("reportRMD")
})

setGeneric('generateReport', function(parameters,...){
  standardGeneric('generateReport')
})

setGeneric('generate', function(...){
  standardGeneric('generate')
})

setGeneric('reportHeader', function(x){
  standardGeneric('reportHeader')
})

setGeneric('sessionInformationSection', function(x){
  standardGeneric('sessionInformationSection')
})

setGeneric('reportFooter', function(x){
  standardGeneric('reportFooter')
})

setGeneric('sectionTitle', function(...){
  standardGeneric('sectionTitle')
})

setGeneric('load', function(...){
  standardGeneric('load')
})

setGeneric('parameters', function(...){
  standardGeneric('parameters')
})

setGeneric('featureTable', function(...){
  standardGeneric('featureTable')
})

setGeneric('chromatograms', function(...){
  standardGeneric('chromatograms')
})

setGeneric('fingerprints', function(...){
  standardGeneric('fingerprints')
})

setGeneric('purityAndCentrality', function(...){
  standardGeneric('purityAndCentrality')
})

setGeneric('ticPlot', function(...){
  standardGeneric('ticPlot')
})

setGeneric('rsdPlot', function(...){
  standardGeneric('rsdPlot')
})
