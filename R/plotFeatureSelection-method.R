#' @importClassesFrom metaboWorkflows Workflow
#' @importFrom dplyr filter mutate
#' @importFrom ggplot2 ggplot aes geom_point theme_bw facet_wrap
#' @importFrom stringr str_sub str_replace_all 
#' @importFrom ggthemes scale_colour_ptol

plotFeatureSelection <- function(analysis,method = 'fs.rf') {
  featureSelection <- analysis@analysed@featureSelection %>%
    filter(Method == method) %>%
    mutate(Mode = str_sub(Feature,1,1),`m/z` = as.numeric(str_replace_all(Feature,'[:alpha:]','')),`-log10(Score)` = -log10(Score))
  
  featureSelection$Mode[featureSelection$Mode == 'n'] <- 'Negative'
  featureSelection$Mode[featureSelection$Mode == 'p'] <- 'Positive'
  
  featureSelection %>%
    ggplot(aes(x = `m/z`,y = `-log10(Score)`,colour = Mode)) +
    geom_point() +
    scale_colour_ptol() +
    guides(colour = FALSE) +
    theme_bw() +
    ylab(expression(-log[10]*FPR)) +
    facet_wrap(~Mode)
}