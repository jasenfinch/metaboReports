#' @importFrom rlang enexpr

chunk <- function(code,
                  id = character(),
                  options = list(),
                  text_before = character(),
                  text_after = character()){
  
  code_chunk <- enexpr(code)
  
  new('Chunk',
      id = id,
      options = options,
      code = code_chunk,
      text_before = text_before,
      text_after = text_after
      )
}

setMethod('code',signature = 'Chunk',
          function(x){
            x@code
          })

setMethod('code<-',signature = 'Chunk',
          function(x,value){
            x@code <- value
            return(x)
          })

setMethod('id',signature = 'Chunk',
          function(x){
            x@id
          })

setMethod('id<-',signature = 'Chunk',
          function(x,value){
            x@id <- value
            return(x)
          })

setMethod('options',signature = 'Chunk',
          function(x){
            x@id
          })

setMethod('options<-',signature = 'Chunk',
          function(x,value){
            x@id <- value
            return(x)
          })

setMethod('textBefore',signature = 'Chunk',
          function(x){
            x@text_before
          })

setMethod('textBefore<-',signature = 'Chunk',
          function(x,value){
            x@text_before <- value
            return(x)
          })

setMethod('textAfter',signature = 'Chunk',
          function(x){
            x@text_after
          })

setMethod('textBefore<-',signature = 'Chunk',
          function(x,value){
            x@text_after <- value
            return(x)
          })
