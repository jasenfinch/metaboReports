
setClass('ReportParameters',
         slots = list(
           path = 'character',
           title = 'character',
           date = 'Date',
           workflow = 'character',
           processing = 'list',
           QC = 'list',
           classification = 'list',
           featureSelection = 'list'
         )
)