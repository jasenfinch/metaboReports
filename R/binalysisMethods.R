
setMethod('sectionTitle',signature = 'Binalysis',
          function(...){
  objectTitle(...)
})

setMethod('load',signature = 'Binalysis',
          function(...){
  loadData(...)
})

setMethod('introduction',signature = 'Binalysis',
          function(...){
  "Processing results using a spectral binning approach."
})

setMethod('parameters',signature = 'Binalysis',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Parameters
  
```{{r {object_name$chunk}_bin_paramters}}
{object_name$variable}@binParameters
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

```{{r {object_name$chunk}_feature_table}}

feature_summary <- metaboMisc::featureSummary({object_name$variable})

knitr::kable(
  feature_summary,
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

```{{r {object_name$chunk}_chromatograms}}
binneR::plotChromatogram({object_name$variable})
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

```{{r {object_name$chunk}_fingerprint}}
binneR::plotFingerprint({object_name$variable})
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
```{{r {object_name$chunk}_purity_centrality}}
patchwork::wrap_plots(binneR::plotPurity({object_name$variable}),
                      binneR::plotCentrality({object_name$variable}))
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

```{{r {object_name$chunk}_TIC_plot}}
binneR::plotTIC({object_name$variable}, 
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

```{{r {object_name$chunk}_RSD_plot}}
patchwork::wrap_plots(
  metaboMisc::plotRSD({object_name$variable}),
  ncol = 1)
````
" 
            )
          })
