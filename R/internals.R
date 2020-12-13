#' @importFrom stringr str_remove_all

sanitiseArgumentNames <- function(x){
  argument_names <- list()
  
  if (str_detect(x,'`') | str_detect(x,' ')){
    argument_names$name <- str_remove_all(x,'`')
    argument_names$file_name <- argument_names$name %>%
      tolower() %>%
      str_replace_all(' ','_')
  } else {
    argument_names$name <- x
    argument_names$file_name <- x
  }
  
  argument_names$variable <- x
  
  return(argument_names)
}

chunkName <- function(x){
  x %>%
    tolower() %>%
    str_replace_all(' ','_')
}

#' @importFrom rlang ensym

objectTitle <- function(x){
  object_name <- ensym(x) %>%
    expr_text()
  
  chunk(text_above = glue("## {object_name}"))
} 

#' @importFrom rlang expr parse_expr as_string

loadData <- function(x){
  object_name <- ensym(x) %>%
    as_string()
  chunk_name <- chunkName(object_name)
  
  chunk_code <- glue("{object_name} <- readr::read_rds('data/{chunk_name}.rds')") %>%
    parse_expr()
  
  chunk(!!chunk_code,
        label = glue("{chunk_name}_load_data"))
}

argumentNames <- function(...){
  as.character(match.call())
}
