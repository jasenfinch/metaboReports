
setClass('ReportParameters',
         slots = list(
           path = 'character',
           title = 'character',
           date = 'Date',
           output = 'character',
           workflow = 'character',
           processing = 'list',
           QC = 'list',
           classification = 'list',
           featureSelection = 'list'
         )
)