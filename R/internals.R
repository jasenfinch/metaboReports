
objectName <- function(x){
  deparse(substitute(x))
}

sectionTitle <- function(x){
  object_name <- deparse(substitute(x))
  glue(
    "
## {object_name}  
"
  )
} 

loadData <- function(x){
  object_name <- deparse(substitute(x))
  glue(
  "
```{{r loadData}}
{object_name} <- read_rds('{object_name}.rds')
```
"
  )
}

argumentNames <- function(...){
  as.character(match.call())
}