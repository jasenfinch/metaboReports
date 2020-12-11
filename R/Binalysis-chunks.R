#' Report chunks for Binalysis class
#' @rdname Binalysis-chunks
#' @description Report chunks for Binalysis S4 class
#' @param ... S4 object of class Binalysis
#' @return S4 object of class Chunk.
#' @export

setMethod('sectionTitle',signature = 'Binalysis',
          function(...){
  objectTitle(...)
})

#' @rdname Binalysis-chunks
#' @export

setMethod('load',signature = 'Binalysis',
          function(...){
  loadData(...)
})

#' @rdname Binalysis-chunks
#' @export

setMethod('introduction',signature = 'Binalysis',
          function(...){
  chunk(text_above = "Processing results using a spectral binning approach.")
})

#' @rdname Binalysis-chunks
#' @export

setMethod('parameters',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("binningParameters({object_name$variable})") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  label = glue("{object_name$chunk}_bin_parameters"),
                  text_above = '### Parameters')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('featureTable',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("feature_summary <- metaboMisc::featureSummary({object_name$variable})") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  knitr::kable(feature_summary,caption = 'Table overview of spectral bins returned for each acqusition mode'),
                  label = glue("{object_name$chunk}_feature_table"),
                  text_above = '### Feature overview')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('chromatograms',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("binneR::plotChromatogram({object_name$variable})") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  label = glue("{object_name$chunk}_chromatograms"),
                  text_above = '### Infusion profiles')
})

#' @rdname Binalysis-chunks
#' @export

setMethod('fingerprints',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("binneR::plotFingerprint({object_name$variable})") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  label = glue("{object_name$chunk}_fingerprint"),
                  text_above = '### Spectrum fingerprints')
})

#' @rdname Binalysis-chunks
#' @export

setMethod('purityAndCentrality',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("patchwork::wrap_plots(binneR::plotPurity({object_name$variable}),binneR::plotCentrality({object_name$variable}))") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  label = glue("{object_name$chunk}_purity_centrality"),
                  text_above = '### Bin purity and centrality')
})

#' @rdname Binalysis-chunks
#' @export

setMethod('ticPlot',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("binneR::plotTIC({object_name$variable},by = 'injOrder',colour = 'block')") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  label = glue("{object_name$chunk}_TIC_plot}"),
                  text_above = '### Sample total ion counts')
          })

#' @rdname Binalysis-chunks
#' @export

setMethod('rsdPlot',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            
            chunk_code <- glue("patchwork::wrap_plots(metaboMisc::plotRSD({object_name$variable}),ncol = 1)") %>%
              parse_expr()
            
            chunk(!!chunk_code,
                  label = glue("{object_name$chunk}_RSD_plot"),
                  text_above = '### Feature relative standard deviations')
          })
