#' @importFrom rlang enexprs

chunk <- function(...,
                  id = '',
                  chunk_options = list(),
                  text_above = '',
                  text_below = ''){
  
  code_chunk <- enexprs(...)
  
  new('Chunk',
      id = id,
      knitr_options = chunk_options,
      code = code_chunk,
      text_above = text_above,
      text_below = text_below
  )
}

setMethod('code',signature = 'Chunk',
          function(x){
            x@code
          })

setMethod('code<-',signature = 'Chunk',
          function(x,...){
            value <- enexpr(...)
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

setMethod('chunkOptions',signature = 'Chunk',
          function(x){
            x@knitr_options
          })

setMethod('chunkOptions<-',signature = 'Chunk',
          function(x,value){
            x@knitr_options <- value
            return(x)
          })

setMethod('textAbove',signature = 'Chunk',
          function(x){
            x@text_above
          })

setMethod('textAbove<-',signature = 'Chunk',
          function(x,value){
            x@text_above <- value
            return(x)
          })

setMethod('textBelow',signature = 'Chunk',
          function(x){
            x@text_below
          })

setMethod('textBelow<-',signature = 'Chunk',
          function(x,value){
            x@text_below <- value
            return(x)
          })

#' @importFrom purrr flatten_chr
#' @importFrom stringr str_c

collapseOptions <- function(options){
  if (length(options) > 0){
    str_c(names(options),'=',flatten_chr(options)) %>%
      str_c(collapse = ', ') 
  } else {
    return('')
  }
}

#' @importFrom rlang expr_text

setMethod('rmd',signature = 'Chunk',
          function(x){
            
            chunk_id <- x %>%
              id()
            
            if (nchar(chunk_id) > 0){
              chunk_id <- glue(" {chunk_id}")
            }
            
            chunk_options <- x %>%
              chunkOptions() %>%
              collapseOptions()
            
            if (nchar(chunk_options) > 0){
              chunk_options <- glue(", {chunk_options}")
            }
            
            chunk_code <- x %>%
              code() %>%
              map_chr(expr_text) %>%
              glue_collapse(sep = '\n')
            
            if (chunk_code == 'expr()') {
              chunk_code <- ''
            }
            
            if (nchar(chunk_code) > 0 |
                nchar(chunk_id) > 0 |
                nchar(chunk_options) > 0) {
              chunk_rmd <- glue("
            ```{{r{chunk_id}{chunk_options}}}
            {chunk_code}
            ```")  
            } else {
              chunk_rmd <- glue('')
            }
            
            text_above <- textAbove(x)
            
            if (nchar(text_above) > 0){
              chunk_rmd <- glue("
              {text_above}
              
              {chunk_rmd}")
            }
            
            text_below <- textBelow(x)
            
            if (nchar(text_below) > 0){
              chunk_rmd <- glue("
              {chunk_rmd}
              
              {text_below}")
            }
            
            return(chunk_rmd)
          })