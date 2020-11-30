

setMethod('parameters',signature = 'Binalysis',
          function(x){
            object_name <- deparse(substitute(x))
            glue(
"
### Parameters
  
```{{r binParamters}}
{object_name}@binParameters
```
"
            )
          })

setMethod('featureTable',signature = 'Binalysis',
          function(x){
            object_name <- deparse(substitute(x))
            glue(
"
```{{r rawFeaturesTable}}
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
          function(x){
            object_name <- deparse(substitute(x))
            glue(
"
```{{r chromatograms}}
binneR::plotChromatogram({object_name})
```
" 
            )
})

setMethod('fingerprints',signature = 'Binalysis',
          function(x){
            object_name <- deparse(substitute(x))
            glue(
"
```{{r fingerprint}}
binneR::plotFingerprint({object_name})
```
" 
            )
})

setMethod('purityAndCentrality',signature = 'Binalysis',
          function(x){
            object_name <- deparse(substitute(x))
            glue(
"
```{{r PurityCentrality}}
patchwork::wrap_plots(binneR::plotPurity({object_name}),
                      binneR::plotCentrality({object_name}))
```
"
            )

})

setMethod('ticPlot',signature = 'Binalysis',
          function(x){
            object_name <- deparse(substitute(x))
            glue(
"
```{{r TICplot}}
binneR::plotTIC(object_name, 
                by = 'injOrder', 
                colour = 'block')
``` 
" 
            )
          })

setMethod('rsdPlot',signature = 'Binalysis',
          function(x){
"
```{{r RSDplot,fig.show='hold''}}
metaboMisc::plotRSD(binalysis)
````
"
          })
