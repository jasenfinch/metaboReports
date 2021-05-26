#' @rdname parameters

setGeneric('path', function(x)
  standardGeneric('path'))

#' @rdname parameters

setGeneric('path<-', function(x,value)
  standardGeneric('path<-'))

#' @rdname parameters

setGeneric('title', function(x)
  standardGeneric('title'))

#' @rdname parameters

setGeneric('title<-', function(x,value)
  standardGeneric('title<-'))

#' @rdname parameters

setGeneric('investigator', function(x)
  standardGeneric('investigator'))

#' @rdname parameters

setGeneric('investigator<-', function(x,value)
  standardGeneric('investigator<-'))

#' @rdname parameters

setGeneric("sessionInformation", function(x)
  standardGeneric("sessionInformation"))

#' @rdname parameters

setGeneric("sessionInformation<-", function(x,value)
  standardGeneric("sessionInformation<-"))

#' @rdname parameters

setGeneric('toc', function(x)
  standardGeneric('toc'))

#' @rdname parameters

setGeneric('toc<-', function(x,value)
  standardGeneric('toc<-'))

#' @rdname parameters

setGeneric('echo', function(x)
  standardGeneric('echo'))

#' @rdname parameters

setGeneric('echo<-', function(x,value)
  standardGeneric('echo<-'))

#' @rdname parameters

setGeneric('cache', function(x)
  standardGeneric('cache'))

#' @rdname parameters

setGeneric('cache<-', function(x,value)
  standardGeneric('cache<-'))

#' @rdname parameters

setGeneric('creationDate', function(x)
  standardGeneric('creationDate'))

#' @rdname parameters

setGeneric('creationDate<-', function(x,value)
  standardGeneric('creationDate<-'))

#' @rdname parameters

setGeneric('output', function(x)
  standardGeneric('output'))

#' @rdname parameters

setGeneric('output<-', function(x,value)
  standardGeneric('output<-'))

#' @rdname report

setGeneric("report", function(x)
  standardGeneric("report"))

#' @rdname report

setGeneric("report<-", function(x,value)
  standardGeneric("report<-"))

#' @rdname reportData

setGeneric("reportData", function(x)
  standardGeneric("reportData"))

#' @rdname reportData

setGeneric("reportData<-", function(x,value)
  standardGeneric("reportData<-"))

#' @rdname reportRMD

setGeneric("reportRMD", function(x)
  standardGeneric("reportRMD"))

#' @rdname reportObjects

setGeneric("reportObjects", function(x)
  standardGeneric("reportObjects"))

setGeneric('generateReport', function(report_parameters,...)
  standardGeneric('generateReport'))

setGeneric('generate', function(x)
  standardGeneric('generate'))

setGeneric('reportHeader', function(x)
  standardGeneric('reportHeader'))

setGeneric('reportOptions', function(x)
  standardGeneric('reportOptions'))

setGeneric('sessionInformationSection', function(x)
  standardGeneric('sessionInformationSection'))

setGeneric('reportFooter', function(x)
  standardGeneric('reportFooter'))

setGeneric('reportDirectory', function(x)
  standardGeneric('reportDirectory'))

#' @rdname renderReport

setGeneric('renderReport', function(x,open = TRUE,...)
  standardGeneric('renderReport'))

setGeneric('sectionTitle', function(x)
  standardGeneric('sectionTitle'))

setGeneric('load', function(x)
  standardGeneric('load'))

setGeneric('introduction', function(x)
  standardGeneric('introduction'))

setGeneric('parameters', function(x)
  standardGeneric('parameters'))

setGeneric('featureTable', function(x)
  standardGeneric('featureTable'))

setGeneric('chromatograms', function(x)
  standardGeneric('chromatograms'))

setGeneric('fingerprints', function(x)
  standardGeneric('fingerprints'))

setGeneric('purityAndCentrality', function(x)
  standardGeneric('purityAndCentrality'))

setGeneric('ticPlot', function(x)
  standardGeneric('ticPlot'))

setGeneric('rsdPlot', function(x)
  standardGeneric('rsdPlot'))

setGeneric('assignments', function(x)
  standardGeneric('assignments'))

#' @rdname chunk-accessors

setGeneric('code', function(x)
  standardGeneric('code'))

#' @rdname chunk-accessors

setGeneric('label', function(x)
  standardGeneric('label'))

#' @rdname chunk-accessors

setGeneric('label<-', function(x,value)
  standardGeneric('label<-'))

#' @rdname chunk-accessors

setGeneric('chunkOptions', function(x)
  standardGeneric('chunkOptions'))

#' @rdname chunk-accessors

setGeneric('chunkOptions<-', function(x,value)
  standardGeneric('chunkOptions<-'))

#' @rdname chunk-accessors

setGeneric('textAbove', function(x)
  standardGeneric('textAbove'))

#' @rdname chunk-accessors

setGeneric('textAbove<-', function(x,value)
  standardGeneric('textAbove<-'))

#' @rdname chunk-accessors

setGeneric('textBelow', function(x)
  standardGeneric('textBelow'))

#' @rdname chunk-accessors

setGeneric('textBelow<-', function(x,value)
  standardGeneric('textBelow<-'))

#' @rdname chunk-accessors

setGeneric('rmd', function(x)
  standardGeneric('rmd'))