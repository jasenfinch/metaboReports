#' Report chunks for Binalysis class
#' @rdname Binalysis-chunks
#' @description Report chunks for Binalysis S4 class
#' @param x S4 object of class Binalysis
#' @return S4 object of class Chunk.
#' @export

setMethod('sectionTitle',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            objectTitle(!!object_name)
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('load',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            loadData(!!object_name)
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('introduction',signature = 'Binalysis',
          function(x){
            chunk(text_above = "Processing results using a spectral binning approach.")
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('parameters',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(binningParameters(!!object_name))
            
            chunk(!!chunk_code,
                  label = glue("{chunk_name}_bin_parameters"),
                  text_above = '### Parameters')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('featureTable',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(feature_summary <- metaboMisc::featureSummary(!!object_name))
            
            chunk(!!chunk_code,
                  knitr::kable(feature_summary,caption = 'Table overview of spectral bins returned for each acqusition mode'),
                  label = glue("{chunk_name}_feature_table"),
                  text_above = '### Feature overview')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('chromatograms',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(binneR::plotChromatogram(!!object_name))
            
            chunk(!!chunk_code,
                  label = glue("{chunk_name}_chromatograms"),
                  text_above = '### Infusion profiles')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('fingerprints',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(binneR::plotFingerprint(!!object_name))
            
            chunk(!!chunk_code,
                  label = glue("{chunk_name}_fingerprint"),
                  text_above = '### Spectrum fingerprints')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('purityAndCentrality',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(patchwork::wrap_plots(binneR::plotPurity(!!object_name),binneR::plotCentrality(!!object_name)))
            
            chunk(!!chunk_code,
                  label = glue("{chunk_name}_purity_centrality"),
                  text_above = '### Bin purity and centrality')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('ticPlot',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(binneR::plotTIC(!!object_name,by = 'injOrder',colour = 'block'))
            
            chunk(!!chunk_code,
                  label = glue("{chunk_name}_TIC_plot}"),
                  text_above = '### Sample total ion counts')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('rsdPlot',signature = 'Binalysis',
          function(x){
            object_name <- substitute(x)
            chunk_name <- chunkName(object_name)
            
            chunk_code <- expr(patchwork::wrap_plots(metaboMisc::plotRSD(!!object_name),ncol = 1))
            
            chunk(!!chunk_code,
                  label = glue("{chunk_name}_RSD_plot"),
                  text_above = '### Feature relative standard deviations')
          })
