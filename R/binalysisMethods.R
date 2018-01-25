
binalysisMethods <- function(method) {
  
  methods <- list(
    
    parameters = function(binalysis){
      str_c(
'
      ```{r binParamters,echo=FALSE}
',
      binalysis@binParameters,
'
      ```
'
      )
    }
  )
  
}