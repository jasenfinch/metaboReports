
assignmentMethods <- function(analysis){
  methods <- list(
   parameters = function(analysis,type = 'head'){
      headHash <- '##'
      
      if (type == 'sub') {
         headHash <- '###'
      }
      
     str_c("
",headHash," Parameters

```{r assignmentParamters,echo=FALSE}
assignment@parameters
```
")
   },
   assignments = function(analysis,type = 'head'){
      headHash <- '##'
      
      if (type == 'sub') {
         headHash <- '###'
      }
      
     str_c('
',headHash,' Assignments  

```{r assignmentTable,echo = FALSE,cache = FALSE}
datatable(assignment %>%
  summariseAssignment(),
          rownames = F,filter = "top",caption = "Summary table of molecular formula assignments")
```

')
   },
   network = function(analysis){
     '
```{r assignmentNetwork,fig.height=12,fig.width=12}
plotNetwork(assignment,layout = "nicely")
```

'
   }
  )
  
  return(methods)
  
}