
assignmentMethods <- function(analysis){
  methods <- list(
   parameters = function(analysis){
     "
### Parameters

```{r assignmentParamters,echo=FALSE}
assignment@parameters
```
"
   },
   assignments = function(analysis){
     '
### Assignments  

```{r assignmentTable,echo = FALSE}
datatable(assignment@assignments %>%
              arrange(`Theoretical M`,MF) %>%
              mutate(`PPM Error` = `PPM Error` %>% round(3),
                     Score = Score %>% round(3)),
          rownames = F,filter = "top")
```

'
   }
  )
  
  return(methods)
  
}