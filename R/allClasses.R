
setClass('ReportParameters',
         slots = list(
           QC = 'list',
           processing = 'list',
           preTreatment = 'list',
           classification = 'list',
           featureSelection = 'list',
           annotation = 'list'
         )
)