
setClass('ReportParameters',
         slots = list(
           path = 'character',
           title = 'character',
           investigator = 'character',
           sessionInfo = 'logical',
           toc = 'logical',
           date = 'Date',
           output = 'character'
         )
)