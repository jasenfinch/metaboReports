#' @importFrom purrr gather

plotExplanatoryHeatmap <- function(analysis, method = 'fs.rf', threshold = 0.01){
  featureSelection <- analysis@analysed@featureSelection %>%
    filter(Method == method,Score < threshold) %>%
    select(Feature) %>%
    unique() %>%
    mutate(Mode = str_sub(Feature,1,1),`m/z` = as.numeric(str_replace_all(Feature,'[:alpha:]','')))
  featureSelection$Mode[featureSelection$Mode == 'n'] <- 'Negative'
  featureSelection$Mode[featureSelection$Mode == 'p'] <- 'Positive'
  
  dat <- analysis@analysed@preTreated$Data %>%
    bind_cols(Class = analysis@analysed@preTreated$Info[,analysis@analysed@parameters@featureSelection$cls]) #%>%
    gather('Feature','Intensity',-Class)
  

}