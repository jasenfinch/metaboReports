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

objectName <- function(x){
  object_name <- list()
  
  object_name$name <- deparse(substitute(x))
  
  object_name$chunk <- object_name$name %>%
    tolower() %>%
    str_replace_all(' ','_')
  
  if (str_detect(object_name$name,' ')) {
    object_name$variable <- glue("`{object_name$name}`")
  } else {
    object_name$variable <- object_name$name
  }
  
  return(object_name)
}

objectTitle <- function(...){
  object_name <- objectName(...)
  chunk(text_above = glue("## {object_name$name}"))
} 

#' @importFrom rlang parse_expr

loadData <- function(...){
  object_name <- objectName(...)
  chunk_code <- glue("{object_name$variable} <- readr::read_rds('data/{object_name$chunk}.rds')") %>%
    parse_expr()
  chunk(!!chunk_code,
        label = glue("{object_name$chunk}_load_data"))
}

argumentNames <- function(...){
  as.character(match.call())
}
