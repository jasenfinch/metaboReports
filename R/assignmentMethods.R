
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
datatable(assignment %>%
  summariseAsignment(),
          rownames = F,filter = "top",caption = "Summary table of molecular formula assignments")
```

'
   },
   network = function(analysis){
     '
```{r assignmentNetwork}
plotNetwork(assignment,layout = "nicely")
```

'
   }
  )
  
  return(methods)
  
}