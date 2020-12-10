#' Genreate an Rmarkdown chunk
#' @description Generate an Rmarkdown code chunk.
#' @param ... R expressions from which to generate a chunk
#' @param label chunk label
#' @param chunk_options knitr chunk options
#' @param text_above optional text to be placed above the code chunk
#' @param text_below optional text to be placed below the code chunk
#' @examples 
#' chunk(a <- 1,
#'       b <- 2,
#'       a + b,
#'       label = 'example',
#'       chunk_options = list(eval = FALSE),
#'       text_above = 'Some example text above.',
#'       text_below = 'Some example text below.') 
#' @importFrom rlang enexprs
#' @export

chunk <- function(...,
                  label = '',
                  chunk_options = list(),
                  text_above = '',
                  text_below = ''){
  
  code_chunk <- enexprs(...)
  
  new('Chunk',
      label = label,
      knitr_options = chunk_options,
      code = code_chunk,
      text_above = text_above,
      text_below = text_below
  )
}

#' Chunk get and set methods
#' @rdname chunk-accessors
#' @description Get and set methods for Chunk S4 class.
#' @param x S4 object of class Chunk
#' @param value value to set
#' @param ... R expressions to set
#' @export

setMethod('code',signature = 'Chunk',
          function(x){
            x@code
          })

#' @rdname chunk-accessors
#' @export

setMethod('code<-',signature = 'Chunk',
          function(x,...){
            value <- enexprs(...)
            x@code <- value
            return(x)
          })

#' @rdname chunk-accessors
#' @export

setMethod('label',signature = 'Chunk',
          function(x){
            x@label
          })

#' @rdname chunk-accessors
#' @export

setMethod('label<-',signature = 'Chunk',
          function(x,value){
            x@label <- value
            return(x)
          })

#' @rdname chunk-accessors
#' @export

setMethod('chunkOptions',signature = 'Chunk',
          function(x){
            x@knitr_options
          })

#' @rdname chunk-accessors
#' @export

setMethod('chunkOptions<-',signature = 'Chunk',
          function(x,value){
            x@knitr_options <- value
            return(x)
          })

#' @rdname chunk-accessors
#' @export

setMethod('textAbove',signature = 'Chunk',
          function(x){
            x@text_above
          })

#' @rdname chunk-accessors
#' @export

setMethod('textAbove<-',signature = 'Chunk',
          function(x,value){
            x@text_above <- value
            return(x)
          })

#' @rdname chunk-accessors
#' @export

setMethod('textBelow',signature = 'Chunk',
          function(x){
            x@text_below
          })

#' @rdname chunk-accessors
#' @export

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

#' Chunk Rmarkdown
#' @description Retrieve Rmarkdown from an object of class Chunk.
#' @param x S4 object of class Chunk
#' @examples
#' x <- chunk(1 + 1)
#' rmd(x)
#' @importFrom rlang expr_text
#' @export

setMethod('rmd',signature = 'Chunk',
          function(x){
            
            chunk_label <- x %>%
              label()
            
            if (nchar(chunk_label) > 0){
              chunk_label <- glue(" {chunk_id}")
            }
            
            chunk_options <- x %>%
              chunkOptions() %>%
              collapseOptions()
            
            if (nchar(chunk_options) > 0){
              chunk_options <- glue(", {chunk_options}")
            }
            
            chunk_code <- x %>%
              code()
            
            if (length(chunk_code) > 0) {
              chunk_code <-  chunk_code %>%
                map_chr(expr_text) %>%
                glue_collapse(sep = '\n')
            } else {
              chunk_code <- ''
            }
            
            if (nchar(chunk_code) > 0 |
                nchar(chunk_label) > 0 |
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