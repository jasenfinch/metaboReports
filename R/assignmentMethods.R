
setMethod('sectionTitle',signature = 'Assignment',
          function(...){
  objectTitle(...)
})

setMethod('load',signature = 'Assignment',
          function(...){
  loadData(...)
})

setMethod('introduction',signature = 'Assignment',
          function(...){
  ""
})

setMethod('parameters',signature = 'Assignment',
          function(...){
            object_name <- objectName(...)
            glue(
              "
### Parameters
  
```{{r {object_name$chunk}_assignment_paramters}}
{object_name$variable}@parameters
```
"
            )
          })

setMethod('assignments',signature = 'Assignment',
          function(...){
            object_name <- objectName(...)
            glue(
"
### Assignments

```{{r {object_name$chunk}_assignment_table,echo = FALSE,cache = FALSE}}
assignments <- MFassign::summariseAssignment({object_name$variable})
DT::datatable(assignments,
          rownames = FALSE,
          filter = 'top',
          caption = 'Summary table of molecular formula assignments')
```               
"
)
          })
