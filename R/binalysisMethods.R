
setMethod('sectionTitle',signature = 'Binalysis',function(...){
  objectTitle(...)
})

setMethod('load',signature = 'Binalysis',function(...){
  loadData(...)
})

setMethod('introduction',signature = 'Binalysis',function(...){
  "Processing results using a spectral binning approach."
})

setMethod('parameters',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Parameters
  
```{{r {object_name}_bin_paramters}}
{object_name}@binParameters
```
"
            )
          })

setMethod('featureTable',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Feature overview

```{{r {object_name}_feature_table}}
rawFeat <- {object_name} %>%
  binneR::binnedData() %>%
  purrr::map(~{{
    .x %>%
      tibble::rowid_to_column(var = 'Sample') %>%
      tidyr::gather('Feature','Intensity',-Sample)
  }}) %>%
  dplyr::bind_rows() %>%
  dplyr::mutate(Mode = str_sub(Feature,1,1)) %>%
  dplyr::group_by(Mode) %>%
  dplyr::summarise(
    `Number of bins` = dplyr::n_distinct(Feature),
    `Missing Data (%)` = round(length(which(Intensity == 0)) / length(Intensity) * 100,2)) %>%
  {{
    .$Mode[.$Mode == 'n'] = 'Negative'
    .$Mode[.$Mode == 'p'] = 'Positive'
    .
  }}

knitr::kable(
  rawFeat,
  caption = 'Table overview of spectral bins returned for each acqusition mode')
```        
" 
            )
          })

setMethod('chromatograms',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Infusion profiles

```{{r {object_name}_chromatograms}}
binneR::plotChromatogram({object_name})
```
" 
            )
})

setMethod('fingerprints',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Spectrum fingerprints

```{{r {object_name}_fingerprint}}
binneR::plotFingerprint({object_name})
```
" 
            )
})

setMethod('purityAndCentrality',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Bin purity and centrality
```{{r {object_name}_purity_centrality}}
patchwork::wrap_plots(binneR::plotPurity({object_name}),
                      binneR::plotCentrality({object_name}))
```
"
            )

})

setMethod('ticPlot',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Sample total ion counts

```{{r {object_name}_TIC_plot}}
binneR::plotTIC({object_name}, 
                by = 'injOrder', 
                colour = 'block')
``` 
" 
            )
          })

setMethod('rsdPlot',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Feature relative standard deviations

```{{r {object_name}_RSD_plot}}
patchwork::wrap_plots(
  metaboMisc::plotRSD({object_name}),
  ncol = 1)
````
" 
            )
          })
